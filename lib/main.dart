import 'dart:io';

import 'package:car_service_mobile/screens/home/home_page.dart';
import 'package:car_service_mobile/screens/search/search_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      debugShowCheckedModeBanner: false,
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'maps/animate_camera.dart';
// import 'maps/map_click.dart';
// import 'maps/map_coordinates.dart';
// import 'maps/map_ui.dart';
// import 'maps/map_ui.dart';
// import 'maps/marker_icons.dart';
// import 'maps/move_camera.dart';
// import 'maps/padding.dart';
// import 'maps/page.dart';
// import 'maps/place_circle.dart';
// import 'maps/place_marker.dart';
// import 'maps/place_polygon.dart';
// import 'maps/place_polyline.dart';
// import 'maps/scrolling_map.dart';
// import 'maps/snapshot.dart';
// import 'maps/tile_overlay.dart';

// final List<GoogleMapExampleAppPage> _allPages = <GoogleMapExampleAppPage>[
//   MapUiPage(),
//   MapCoordinatesPage(),
//   MapClickPage(),
//   AnimateCameraPage(),
//   MoveCameraPage(),
//   PlaceMarkerPage(),
//   MarkerIconsPage(),
//   ScrollingMapPage(),
//   PlacePolylinePage(),
//   PlacePolygonPage(),
//   PlaceCirclePage(),
//   PaddingPage(),
//   SnapshotPage(),
//   TileOverlayPage(),
// ];

// class MapsDemo extends StatelessWidget {
//   void _pushPage(BuildContext context, GoogleMapExampleAppPage page) {
//     Navigator.of(context).push(MaterialPageRoute<void>(
//         builder: (_) => Scaffold(
//               appBar: AppBar(title: Text(page.title)),
//               body: page,
//             )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('GoogleMaps examples')),
//       body: ListView.builder(
//         itemCount: _allPages.length,
//         itemBuilder: (_, int index) => ListTile(
//           leading: _allPages[index].leading,
//           title: Text(_allPages[index].title),
//           onTap: () => _pushPage(context, _allPages[index]),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: MapsDemo()));
// }
