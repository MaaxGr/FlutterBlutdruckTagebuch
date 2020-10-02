import 'package:flutter/material.dart';
import 'package:flutter_blutdrucktagebuch/screens/add/add_screen.dart';
import 'package:flutter_blutdrucktagebuch/screens/history/history_screen.dart';

void main() => runApp(MyApp());

//App
class MyApp extends StatefulWidget {
  List<Screen> _screens = [
    Screen(
      topBarText: "Hinzufügen",
      body: AddScreen(),
      bottomBarIconData: Icons.add,
      bottomBarText: "Hinzufügen",
    ),
    Screen(
      topBarText: "Geschichte",
      body: HistoryScreen(),
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
        appBar: AppBar(
          title: Text(currentScreen.topBarText),
        ),
        body: currentScreen.body,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            for (Screen screen in widget._screens)
              BottomNavigationBarItem(
                  icon: Icon(screen.bottomBarIconData),
                  label: screen.bottomBarText)
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
  String topBarText;

  Widget body;

  IconData bottomBarIconData;
  String bottomBarText;

  Screen(
      {this.topBarText, this.body, this.bottomBarIconData, this.bottomBarText});
}
