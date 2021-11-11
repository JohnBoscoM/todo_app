import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:todo_app/view/todo_list.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            // IconButton(
            //   icon: const Icon(
            //     CupertinoIcons.xmark_circle,
            //     color: Colors.black26,
            //     size: 40,
            //   ),
            //   onPressed: () {},
            // ),
          ]),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Write a new task',
                ),
                style: GoogleFonts.manrope(fontSize: 45),
              ),
            )),
        SizedBox(
          height: 10,
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueAccent,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => AddTaskPage()),
          // );
        },
        tooltip: 'Increment',
        label: Text(
          "New Task",
          style: GoogleFonts.manrope(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    ));
  }
}
