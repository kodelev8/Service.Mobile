import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/models/personModel.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/navigation_provider.dart';
import 'package:prechart_mobile/providers/persons_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:prechart_mobile/views/personDetailedView.dart';
import 'package:provider/provider.dart';

class WerkgeverPersons extends StatefulWidget {
  final String fiscaalNummer;

  WerkgeverPersons({required this.fiscaalNummer});

  @override
  State<WerkgeverPersons> createState() => _WerkgeverPersonsState();
}

class _WerkgeverPersonsState extends State<WerkgeverPersons> {
  List<Person>? persons;
  List<Person>? filteredPersons;
  bool _isLoaded = false;

  TextEditingController filterController = TextEditingController();


  @override
  void initState() {
    super.initState();
    getPersons();
    filterController.text = '';
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  getPersons() async {
    persons = context.read<PersonsLists>().personsWerkgever(taxno: widget.fiscaalNummer);
    var tokens = context.read<UserTokens>().user;

    if (persons == null || (persons?.isEmpty ?? true)) {
      var servers = context.read<EndPointServers>().Endpoints;

      persons = await Endpoints(endpoint: servers!).getEmployeePersons(tokens);

      if (persons != null && persons!.isNotEmpty) {
        context.read<PersonsLists>().setPersons(persons!);
      }
    }

    persons = filteredPersons = context.read<PersonsLists>().personsWerkgever(taxno: widget.fiscaalNummer);

    if (persons != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  void filteredSearch(String search) {
    setState(() {
      filteredPersons = persons
          ?.where((person) =>
              (person.significantAchternaam ?? '').toLowerCase().contains(search.toLowerCase()) ||
              (person.sofiNr ?? '').toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isLoaded,
      replacement: const Center(child: CircularProgressIndicator()),
      child: Column(
        children: [
          Container(
            child: TextField(
              controller: filterController,
              decoration: InputDecoration(
                hintText: 'Search',
                suffix: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      filterController.text = '';
                      filteredPersons = persons;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                filteredSearch(value);
              },
            ),
          ),
          Expanded(
            child: LiquidPullToRefresh(
              showChildOpacityTransition: false,
              onRefresh: () async {
                context.read<PersonsLists>().clearPersons();
                await getPersons();
              },
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: filteredPersons != null ? filteredPersons!.length : 0,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          '${filteredPersons![index].significantAchternaam ?? ''} (${filteredPersons![index].voorletter ?? ''})'),
                      leading: Icon(Icons.person),
                      subtitle: Text(filteredPersons![index].sofiNr ?? ''),
                      onTap: () async {
                        context.read<NavigationIndex>().setIndex(0);
                        await Future.delayed(const Duration(milliseconds: 200));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => PersonDetailedView(filteredPersons![index])),
                            (route) => false);
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
