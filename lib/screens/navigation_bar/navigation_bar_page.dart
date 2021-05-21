import 'package:car_service_mobile/screens/home/home_page.dart';
import 'package:car_service_mobile/screens/search/search_page.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  List<Widget> _widgets = <Widget>[
    HomePageBuilderNavigator(),
    SearchPageBuilderNavigator(),
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
    return Scaffold(
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
        ],
        onTap: _onTapHandler,
        currentIndex: _selectedIndexTab,
      ),
    );
  }
}
