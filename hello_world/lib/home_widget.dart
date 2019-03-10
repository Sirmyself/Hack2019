import 'package:flutter/material.dart';
import 'recherche.dart';
import 'main.dart';
import 'Classes/Profile/Profile.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final List<Widget> _children = [
    Recherche(),
    new FlashCardSwipe(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tinder pour les cools'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.search),
            title: new Text('Recherche'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.format_bold),
            title: new Text('Flash'),              
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('Profil'),
          )
        ],
        
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.flash_on),
            tooltip: 'Flash',
            onPressed:(){ onTabTapped(1); },
          )
    );
    
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}
