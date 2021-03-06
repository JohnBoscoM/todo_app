import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/controller/task_operations.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/view/add_task.dart';
import 'package:todo_app/view/board_overview_page.dart';
import 'package:todo_app/view/todo_list.dart';

import 'addboard_page.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with TickerProviderStateMixin {
  TodoList todoList = new TodoList();
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    // final effectKey = RippleEffect.createGlobalKey();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFF8FAFB),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black38),
        backgroundColor: Color(0xFFF8FAFB),
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu, color: Colors.black26, size: 30),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.black26,
              size: 30,
            ),
            onPressed: () {},
          ),
          // IconButton(
          //   icon: const Icon(
          //     CupertinoIcons.moon,
          //     color: Colors.black26,
          //     size: 30,
          //   ),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 20, top: 2, bottom: 10),
              child: Text(
                "Wendsday",
                textScaleFactor: 2.5,
                style: GoogleFonts.manrope(
                    color: Colors.black54, fontWeight: FontWeight.w500),
              )),
          Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "21 October",
                textScaleFactor: 2,
                style: GoogleFonts.manrope(
                    color: Colors.black38, fontWeight: FontWeight.w200),
              )),

          Padding(
              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Row(children: [
                Text(
                  "IN PROGRESS",
                  textScaleFactor: 1.0,
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
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      "3",
                      textScaleFactor: 1.1,
                      style: GoogleFonts.manrope(
                          color: Colors.orange, fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ])),

          todoList.buildList(),

          // Padding(
          //     padding: EdgeInsets.only(left: 20),
          //     child: Expanded(
          //         child: Container(
          //             width: _width * 0.4,
          //             height: _height * 0.2,
          //             decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 // border:
          //                 //     Border.all(color: Color(0xFFEDEFFA), width: 2),
          //                 borderRadius: BorderRadius.circular(30)),
          //             child: Center(
          //               child: IconButton(
          //                   onPressed: () {
          //                     Navigator.push(
          //                       context,
          //                       MaterialPageRoute(
          //                           builder: (context) => AddTaskPage()),
          //                     );
          //                   },
          //                   icon: Icon(
          //                     CupertinoIcons.add,
          //                     size: 40,
          //                     color: Colors.black45,
          //                   )),
          //             )))),
          // Padding(
          //     padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          //     child: Text(
          //       "TODAY'S TASKS",
          //       textScaleFactor: 1.0,
          //       style: GoogleFonts.manrope(
          //           color: Colors.black26, fontWeight: FontWeight.w700),
          //     )),
        ],
      ),
      // drawer: Drawer(
      //   // Add a ListView to the drawer. This ensures the user can scroll
      //   // through the options in the drawer if there isn't enough vertical
      //   // space to fit everything.
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Text('Drawer Header'),
      //       ),
      //       ListTile(
      //         title: const Text('Item 1'),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('Item 2'),
      //         onTap: () {
      //           // Update the state of the app
      //           // ...
      //           // Then close the drawer
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    ));
  }
}
