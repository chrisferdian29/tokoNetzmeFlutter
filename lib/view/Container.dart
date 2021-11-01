import 'package:flutter/material.dart';
import 'package:toko_netzme/view/home.dart';
import 'package:toko_netzme/view/pos_widget.dart';

class ContainerWidget extends StatefulWidget {
  @override
  State createState() {
    return _ContainerState();
  }
}
Widget _underConstraction() {
  return Scaffold(
    appBar: AppBar(
      // Here we take the value from the MyHomePage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(""),
    ),
    body: Center(
      child: Text('under construction'),
    ),
  );
}
class _ContainerState extends State {
  int _currentIndex = 0;
  final List _children = [
    HomeWidget(),
    _underConstraction(),
    _underConstraction(),
    POSWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            // title: new Text('Transaction'),
            label: 'Transaction'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.build),
              label: 'QRIS'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_print_shop),
              label: 'POS'
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}