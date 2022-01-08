import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/view/add_task.dart';
import 'package:todo_app/view/timerscreen.dart';
//import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:todo_app/view/todo_page.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<NavigationPage> {
  int _selectedIndex = 0;
  void changeTab() {
    if (mounted) setState(() {});
  }

  // SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  // SnakeShape snakeShape = SnakeShape.indicator;
  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;
  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(0)),
  );
  EdgeInsets padding =
      const EdgeInsets.only(top: 2, bottom: 16, right: 12, left: 12);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<dynamic> _widgetOptions = [
    TimerScreen(),
    // PlayButton(
    //   pauseIcon: Icon(Icons.pause, color: Colors.black, size: 40),
    //   playIcon: Icon(Icons.play_arrow, color: Colors.black, size: 40),
    //   onPressed: () {},
    // ),
    AddTaskPage(),
    Center(
      child: Text("You"),
    ),
    //  SettingsPage()
  ];

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //backgroundColor: themeProvider.themeMode().blendBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //  backgroundColor: Colors.black,
        selectedLabelStyle: TextStyle(fontFamily: 'avenir'),

        selectedItemColor: Colors.yellow.shade900,
        //  unselectedItemColor: Colors.grey.shade800,

        //configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled_solid, size: 40),
              label: 'Playlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined, size: 25), label: 'Settings'),
        ],
      ),
    );
  }
}
