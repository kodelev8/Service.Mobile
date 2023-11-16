import 'package:prechart_mobile/helpers/mongo_helper.dart';
import 'package:prechart_mobile/models/endPointModel.dart';
import 'package:prechart_mobile/providers/calculation_current_page_provider.dart';
import 'package:prechart_mobile/providers/endpoint_provider.dart';
import 'package:prechart_mobile/providers/endpoint_servers_provider.dart';
import 'package:prechart_mobile/providers/navigation_provider.dart';
import 'package:prechart_mobile/providers/persons_cumulatief_provider.dart';
import 'package:prechart_mobile/providers/persons_provider.dart';
import 'package:flutter/material.dart';
import 'package:prechart_mobile/providers/taxJaar_provider.dart';
import 'package:prechart_mobile/providers/user_token_provider.dart';
import 'package:prechart_mobile/providers/werkgever_provider.dart';
import 'package:prechart_mobile/views/calculationDetailedView.dart';
import 'package:prechart_mobile/views/calculationView.dart';
import 'package:prechart_mobile/views/homeView.dart';
import 'package:prechart_mobile/views/logOffView.dart';
import 'package:prechart_mobile/views/loginView.dart';
import 'package:prechart_mobile/views/personDetailedView.dart';
import 'package:prechart_mobile/views/personsView.dart';
import 'package:prechart_mobile/views/werkgeverView.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NavigationIndex()),
      ChangeNotifierProvider(create: (context) => WerkgeversLists()),
      ChangeNotifierProvider(create: (context) => PersonsLists()),
      ChangeNotifierProvider(create: (context) => PersonsCumulatiefLists()),
      ChangeNotifierProvider(create: (context) => TaxJaarLists()),
      ChangeNotifierProvider(create: (context) => UserTokens()),
      ChangeNotifierProvider(create: (context) => CalculationCurrentPage()),
      ChangeNotifierProvider(create: (context) => EndPointsList()),
      ChangeNotifierProvider(create: (context) => EndPointServers()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prechart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Prechart Mobile App'),
      routes: {
        PersonsView.routeName: (context) => PersonsView(),
        WerkgeverView.routeName: (context) => WerkgeverView(),
        PersonDetailedView.routeName: (context) => PersonDetailedView(null),
        LogOffView.routeName: (context) => const LogOffView(),
        CalculationView.routeName: (context) => const CalculationView(),
        CalculationDetails.routeName: (context) =>  CalculationDetails(),
        HomeView.routeName: (context) => const HomeView(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: Navigation(),
        body: Container(
          child: LoginView(),
        )
    );
  }
}

Widget LoadWidgetPage({required int index}) {
  Widget widget;

  switch (index) {
    case 0:
      widget = PersonsView();
      break;
    case 1:
      widget = CalculationView();
      break;
    case 2:
      widget = WerkgeverView();
      break;
    default:
      widget = LogOffView();
      break;
  }

  return widget;
}
