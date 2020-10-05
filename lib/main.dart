import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/screens/add/add_screen.dart';
import 'package:flutter_blutdrucktagebuch/screens/history/history_screen.dart';

void main() => runApp(MyApp());

//App
class MyApp extends StatefulWidget {
  List<Screen> _screens = [
    Screen(
      body: AddScreen(appBarTitle: "Hinzufügen"),
      bottomBarIconData: Icons.add,
      bottomBarText: "Hinzufügen",
    ),
    Screen(
      body: HistoryScreen(appBarTitle: "Geschichte"),
      bottomBarIconData: Icons.calendar_today,
      bottomBarText: "Geschichte",
    ),
  ];

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Screen currentScreen = widget._screens[_selectedScreenIndex];

    return MaterialApp(
      title: 'Blutdruck-Tagebuch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: currentScreen.body,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            for (Screen screen in widget._screens)
              BottomNavigationBarItem(
                icon: Icon(screen.bottomBarIconData),
                label: screen.bottomBarText,
              )
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

class Screen {
  // body
  Widget body;

  // footer
  IconData bottomBarIconData;
  String bottomBarText;

  Screen({this.body, this.bottomBarIconData, this.bottomBarText});
}
