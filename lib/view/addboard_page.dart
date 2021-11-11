import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/controller/board_operations.dart';
import 'package:todo_app/model/board.dart';
import 'package:todo_app/view/todo_list.dart';

class AddBoardPage extends StatefulWidget {
  @override
  _AddBoardPageState createState() => _AddBoardPageState();
}

class _AddBoardPageState extends State<AddBoardPage>
    with TickerProviderStateMixin {
  late SharedPreferences sharedPreferences;
  late List<Board> boards = [];
  late Board board = Board(title: '');
  final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    initSharedPreferences();
    super.initState();
  }

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                controller: controller,
                decoration: InputDecoration(hintText: 'Board Name'),
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
          board.title = controller.text;
          addItem(sharedPreferences, board, boards);
        },
        tooltip: 'Increment',
        label: Text(
          "Add Board",
          style: GoogleFonts.manrope(fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    ));
  }
}
