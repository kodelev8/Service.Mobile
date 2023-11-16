import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/models/personModel.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/navigation_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:prechart_mobile/views/navigation.dart';
import 'package:prechart_mobile/providers/persons_provider.dart';
import 'package:prechart_mobile/views/personDetailedView.dart';
import 'package:provider/provider.dart';

class PersonsView extends StatefulWidget {
  static const routeName = '/persons';

  @override
  State<PersonsView> createState() => _PersonsViewState();
}

class _PersonsViewState extends State<PersonsView> {
  bool _isLoaded = false;
  List<Person>? persons;
  List<Person>? filteredPersons;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    getPersons();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getPersons() async {
    var tokens = context.read<UserTokens>().user;

    var a = context.read<PersonsLists>().persons.isEmpty;

    if (context.read<PersonsLists>().persons.isEmpty) {
      var servers = context.read<EndPointServers>().Endpoints!;

      persons = await Endpoints(endpoint: servers).getEmployeePersons(tokens);
      context.read<PersonsLists>().clearPersons();

      if (persons != null && persons!.isNotEmpty) {
        context.read<PersonsLists>().setPersons(persons!);
      }
    }

    persons = filteredPersons = context.read<PersonsLists>().persons;

    if (persons != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  void filteredSearch(String search){
    setState(() {
      filteredPersons = persons?.where((person) => (person.significantAchternaam ?? '').toLowerCase().contains(search.toLowerCase()) || (person.sofiNr ?? '').toLowerCase().contains(search.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      appBar: AppBar(
        title: !_isSearching
            ? Text('Persons')
            : TextField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  filteredSearch(value);
                  // context.read<PersonsLists>().searchPersons(value);
                },
              ),
        actions: <Widget>[
          _isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      filteredPersons = persons;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Visibility(
        visible: _isLoaded,
        replacement: const Center(child: CircularProgressIndicator()),
        child: LiquidPullToRefresh(
          showChildOpacityTransition: false,
          onRefresh: () async {
            context.read<PersonsLists>().clearPersons();
            await getPersons();
          },
          child: ListView.builder(
              itemCount: filteredPersons != null ? filteredPersons!.length : 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${filteredPersons![index].significantAchternaam ?? ''} (${filteredPersons![index].voorletter ?? ''})'),
                  leading: Icon(Icons.person),
                  subtitle: Text(filteredPersons![index].sofiNr ?? ''),
                  onTap: () async {
                    context.read<NavigationIndex>().setIndex(0);
                    await Future.delayed(const Duration(milliseconds: 600));
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => PersonDetailedView(filteredPersons![index])), (route) => false);
                  },
                );
              }),
        ),
      ),
    );
  }
}
