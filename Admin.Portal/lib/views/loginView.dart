import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prechart_mobile/endpoints/endpoints.dart';
import 'package:prechart_mobile/helpers/endpoint_domains.dart';
import 'package:prechart_mobile/helpers/mongo_helper.dart';
import 'package:prechart_mobile/models/endPointModel.dart';
import 'package:prechart_mobile/models/personModel.dart';
import 'package:prechart_mobile/models/tokensModel.dart';
import 'package:prechart_mobile/providers/endpoint_provider.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/persons_provider.dart';
import 'package:prechart_mobile/providers/taxJaar_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:prechart_mobile/providers/werkgever_provider.dart';
import 'package:prechart_mobile/models/werkgeverModel.dart' as werkgeverModel;
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _showPassword = false;
  TextEditingController userInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  List<EndPointModel> endpoints = [];
  String _endPoint = '';

  int loginAttempts = 0;
  Tokens? tokens;

  void connectToMongo() async {
    endpoints = await MongoDatabase().connect();

    inspect(endpoints);

    if (endpoints != null && endpoints.isNotEmpty) {
      context.read<EndPointsList>().setEndPoints(endpoints);
    }

    setState(() {
      endpoints = context.read<EndPointsList>().Endpoints;
      _endPoint = endpoints[0].servers!.server!;

      context.read<EndPointServers>().setEndPoint( endpoints[0]);

    });
  }

  Future<bool> doLogin() async {
    setState(() {
      loginAttempts++;
    });

    try {
      var servers = context.read<EndPointServers>().Endpoints;
      tokens = await Endpoints(endpoint: servers).Login(userInput.text, passwordInput.text);

      if (tokens != null) {
        context.read<UserTokens>().clearUser();
        context.read<UserTokens>().setUser(
            bearerToken: tokens!.bearerToken,
            refreshToken: tokens!.refreshToken,
            apiKey: tokens!.apiKey,
            userName: tokens!.userName);

        var user = context.read<UserTokens>().user;

        final data = await Future.wait([
          Endpoints(endpoint: servers).getWerkgevers(user),
          Endpoints(endpoint: servers).getEmployeePersons(user),
          Endpoints(endpoint: servers).getTaxYears(user),
        ]);

        var werkgevers = data[0] as List<werkgeverModel.Werkgever>?;

        if (werkgevers != null && werkgevers.isNotEmpty) {
          context.read<WerkgeversLists>().setWerkgevers(werkgevers);
        }

        var persons = data[1] as List<Person>?;

        if (persons != null && persons.isNotEmpty) {
          context.read<PersonsLists>().setPersons(persons);
        }

        var taxYears = data[2] as List<int>?;

        if (taxYears != null && taxYears.isNotEmpty) {
          context.read<TaxJaarLists>().setTaxJaar(taxYears);
        }

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    connectToMongo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: true,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 100,
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Server'),
                    DropdownButton(
                      value: _endPoint,
                      items: endpoints.map((EndPointModel endpoint) {
                        return DropdownMenuItem(
                          value: endpoint.servers?.server ?? '',
                          child: Text(endpoint.servers?.server ?? ''),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _endPoint = value.toString();
                          context.read<EndPointServers>().setEndPoint( endpoints.firstWhere((element) => element.servers!.server == _endPoint));
                          SetServers(_endPoint);
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: userInput,
                enabled: loginAttempts < 3,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordInput,
                obscureText: !_showPassword,
                enabled: loginAttempts < 3,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      }),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: loginAttempts < 3 ? Colors.blue : Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onPressed: loginAttempts <= 3
                    ? () async {
                        if (loginAttempts < 3) {
                          buildShowDialog(context);
                          var validCreds = await doLogin();
                          Navigator.of(context).pop();

                          if (validCreds) {
                            Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
                          } else {
                            final errorMessage = SnackBar(
                              content: loginAttempts < 3
                                  ? Text('Invalid UserName and Password')
                                  : Text('You have exceeded the maximum number of login attempts'),
                              duration: loginAttempts < 3 ? Duration(seconds: 2) : Duration(days: 1),
                              action: SnackBarAction(
                                label: 'dismiss',
                                onPressed: () {
                                  if (loginAttempts >= 3) {
                                    if (Platform.isIOS) {
                                      exit(0);
                                    } else {
                                      SystemNavigator.pop();
                                    }
                                  }
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(errorMessage);
                          }
                        }
                      }
                    : null,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  void SetServers(String endpoint) {
    var _endpoints = endpoints.firstWhere((element) => element.servers?.server == endpoint);

    werkgeverDomain = _endpoints.servers?.werkgever ?? '';
    personDomain = _endpoints.servers?.person ?? '';
    loonheffingDomain = _endpoints.servers?.loonheffing ?? '';
    berekingenDomain = _endpoints.servers?.berekingen ?? '';
    belastingDomain = _endpoints.servers?.belasting ?? '';
  }
}
