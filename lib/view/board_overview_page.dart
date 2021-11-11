import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/view/add_task.dart';
import 'package:todo_app/view/todo_list.dart';
import 'package:todo_app/view/todo_page.dart';

class BoardOverviewPage extends StatefulWidget {
  @override
  _BoardOverviewPageState createState() => _BoardOverviewPageState();
}

class _BoardOverviewPageState extends State<BoardOverviewPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    // final effectKey = RippleEffect.createGlobalKey();
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Work",
          style: GoogleFonts.manrope(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //     padding: EdgeInsets.only(left: 20, top: 2, bottom: 10),
          //     child: Text(
          //       "Work",
          //       textScaleFactor: 2.5,
          //       style: GoogleFonts.manrope(
          //           color: Colors.black54, fontWeight: FontWeight.w500),
          //     )),
          Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Row(children: [
                Text(
                  "TASKS",
                  textScaleFactor: 1.2,
                  style: GoogleFonts.manrope(
                      color: Colors.black26, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "3/10",
                      textScaleFactor: 1.1,
                      style: GoogleFonts.manrope(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ])),
          buildList(),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 42,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
        tooltip: 'Add a new task',
        label: Text(
          "Write a new task  ",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black45),
        ),
      ),
    ));
  }
}
