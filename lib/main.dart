import 'dart:io';

import 'package:car_service_mobile/screens/home/home_page.dart';
import 'package:car_service_mobile/screens/search/search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text('Erro Firebase');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyAppPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}

class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  List<Widget> _widgets = <Widget>[
    HomePageBuilderNavigator(),
    SearchPageBuilderNavigator(),
    Icon(Icons.time_to_leave),
    Icon(Icons.access_alarm),
  ];
  int _defaultIndexTab = 0;
  int _selectedIndexTab;

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndexTab = index;
    });
  }

  @override
  initState() {
    super.initState();
    _selectedIndexTab = _defaultIndexTab;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Service',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.redAccent[700],
        accentColor: Colors.red[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _widgets[_selectedIndexTab],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Início",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Busca",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_rounded),
              label: "Agendas",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: "Perfil",
            ),
          ],
          onTap: _onTapHandler,
          currentIndex: _selectedIndexTab,
        ),
      ),
    );
  }
}
