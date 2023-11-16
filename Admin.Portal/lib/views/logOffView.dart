import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prechart_mobile/views/navigation.dart';

class LogOffView extends StatefulWidget {
  static const routeName = '/logoff';

  const LogOffView({Key? key}) : super(key: key);

  @override
  State<LogOffView> createState() => _LogOffViewState();
}

class _LogOffViewState extends State<LogOffView> {
  void _showDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Off'),
          content: const Text('Are you sure you want to log off?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                if (Platform.isIOS) {
                  exit(0);
                } else {
                  SystemNavigator.pop();
                }
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navigation(),
      appBar: AppBar(
        title: const Text('Log Off'),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue[400],
          child: const Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'Log Off',
              style: TextStyle(fontSize: 30),
            ),
          ),
          onPressed: () {
            _showDialog();
          },
        ),
      ),
    );
  }
}