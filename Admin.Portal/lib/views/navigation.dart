import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:prechart_mobile/providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class Navigation extends StatelessWidget {
  const Navigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.blue,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.blue,
      height: 50,
      animationDuration: const Duration(milliseconds: 200),
      items: const <Widget>[
        Icon(Icons.person, size: 30, color: Colors.white),
        Icon(Icons.calculate, size: 30, color: Colors.white),
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.assured_workload, size: 30, color: Colors.white),
        Icon(Icons.logout, size: 30, color: Colors.white),
      ],
      index: context.watch<NavigationIndex>().index,
      onTap: (_index) async {
        var previousIndex = context.read<NavigationIndex>().index;
        context.read<NavigationIndex>().setIndex(_index);

        if (_index == 0) {
          Navigator.of(context).pushNamedAndRemoveUntil('/persons', (route) => false);
        } else if (_index == 1) {
          if (previousIndex != 1){
            Navigator.of(context).pushNamedAndRemoveUntil('/calculation', (route) => false);
          }
        } else if (_index == 2) {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
        } else if (_index == 3) {
          Navigator.of(context).pushNamedAndRemoveUntil('/werkgever', (route) => false);
        } else if (_index == 4) {
          Navigator.of(context).pushNamedAndRemoveUntil('/logoff', (route) => false);
        }
      },
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
