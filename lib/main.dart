import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/screens/add_screen.dart';
import 'package:flutter_blutdrucktagebuch/screens/history_screen.dart';
import 'package:numberpicker/numberpicker.dart';

void main() => runApp(MyApp());

//App
class MyApp extends StatefulWidget {

  List<Widget> _screens = <Widget>[
    AddScreen(),
    HistoryScreen()
  ];

  @override
  State<StatefulWidget> createState() => _AppState();

}

class _AppState extends State<MyApp> {

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blutdruck-Tagebuch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hinzufügen"),
        ),
        body: widget._screens.elementAt(_selectedScreenIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Hinzufügen"),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Geschichte"),
          ],
          currentIndex: _selectedScreenIndex,
          onTap: (index) {
            setState(() {
              _selectedScreenIndex = index;
            });
          },
        ),
      ),
    );
  }

}