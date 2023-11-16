import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:prechart_mobile/providers/werkgever_provider.dart';
import 'package:prechart_mobile/views/navigation.dart';
import 'package:provider/provider.dart';

import '../endpoints/endpoints.dart';
import '../models/werkgeverModel.dart';
import 'package:prechart_mobile/views/werkgeverDetailedView.dart';

class WerkgeverView extends StatefulWidget {
  static const routeName = '/werkgever';

  @override
  State<WerkgeverView> createState() => _WerkgeverViewState();
}

class _WerkgeverViewState extends State<WerkgeverView> {
  bool _isLoaded = false;
  List<Werkgever>? werkgevers;
  List<Werkgever>? filteredWerkgevers;
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    getWerkgevers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getWerkgevers() async {
    var tokens = context.read<UserTokens>().user;

    if (context.read<WerkgeversLists>().werkgevers.isEmpty) {
      var servers = context.read<EndPointServers>().Endpoints!;

      werkgevers = await Endpoints(endpoint: servers).getWerkgevers(tokens);

      if (werkgevers != null && werkgevers!.isNotEmpty) {
        context.read<WerkgeversLists>().setWerkgevers(werkgevers!);
      }
    }

    werkgevers = filteredWerkgevers = context.read<WerkgeversLists>().werkgevers;

    if (werkgevers != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  void filteredSearch(String search) {
    setState(() {
      filteredWerkgevers = werkgevers
          ?.where((werkgever) =>
              (werkgever.naam ?? '').toLowerCase().contains(search.toLowerCase()) ||
              (werkgever.fiscaalNummer ?? '').toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      appBar: AppBar(
        title: !_isSearching
            ? Text('Werkgever')
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
                      filteredWerkgevers = werkgevers;
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
            context.read<WerkgeversLists>().clearWerkgevers();
            await getWerkgevers();
          },
          child: ListView.builder(
              itemCount: filteredWerkgevers != null ? filteredWerkgevers!.length : 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredWerkgevers?[index].naam ?? ''),
                  leading: const Icon(Icons.work),
                  subtitle: Text(filteredWerkgevers![index].fiscaalNummer),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WerkgeverDetailsView(
                          filteredWerkgevers![index],
                        ),
                      ),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
