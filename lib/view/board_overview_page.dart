import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/controller/task_operations.dart';
import 'package:todo_app/model/board.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/view/todo_list.dart';

class RestTimerScreen extends StatefulWidget {
  @override
  _RestTimerScreenState createState() => _RestTimerScreenState();
}

class _RestTimerScreenState extends State<RestTimerScreen>
    with TickerProviderStateMixin {
  final taskstartImage = Image(image: AssetImage('assets/taskstart.png'));
  late SharedPreferences sharedPreferences;
  final CountDownController countDowncontroller = new CountDownController();
  int workDuration = 1500;
  int breakDuration = 300;
  late int duration;
  late AnimationController animation_controller;
  final controller = TextEditingController();
  bool isRunning = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    animation_controller.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    animation_controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    initSharedPreferences();
    super.initState();
  }

  void initSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    duration = workDuration;
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.grey.shade100,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
                centerTitle: true,
                title: Text(
                  "Podoromo",
                  style: GoogleFonts.actor(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
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
            body: Container(
                width: _width,
                height: _height,
                child: Stack(
                    alignment: Alignment.topCenter,
                    fit: StackFit.loose,
                    children: [
                      Container(
                        height: _height * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200),
                              bottomRight: Radius.circular(200)),
                        ),
                      ),
                      Container(
                        width: _width * 0.46,
                        child: TextField(
                          controller: controller,
                          decoration:
                              InputDecoration(hintText: 'What is your Focus?'),
                          style: GoogleFonts.manrope(fontSize: 20),
                        ),
                      ),
                      Positioned(
                        top: 120,
                        child: NeonCircularTimer(
                          onStart: () {

                          },
                          autoStart: false,
                          neon: 4,
                          width: _width / 1.5,
                          strokeWidth: 5,
                          duration: workDuration,
                          controller: countDowncontroller,
                          isTimerTextShown: true,
                          neumorphicEffect: true,
                          innerFillGradient: LinearGradient(colors: [
                            Colors.deepPurpleAccent.shade700,
                            Colors.deepPurpleAccent.shade100
                          ]),
                          neonGradient: LinearGradient(colors: [
                            Colors.deepPurple.shade200,
                            Colors.deepPurple.shade400
                          ]),
                        ),
                      ),
                      // Positioned(
                      //   top: _height * 0.65,
                      //   left: _width * 0.4,
                      //   child: FloatingActionButton(
                      //       backgroundColor: Colors.greenAccent.shade400,
                      //       foregroundColor: Colors.white,
                      //       child: AnimatedIcon(
                      //         progress: animation_controller,
                      //         icon: AnimatedIcons.play_pause,
                      //         size: 35,
                      //       ),
                      //       onPressed: () {
                      //         tooglePlayPauseIcon();
                      //         setState(() {
                      //           if (!isRunning) {
                      //             countDowncontroller.pause();
                      //           } else {
                      //             countDowncontroller.resume();
                      //           }
                      //         });
                      //       }),
                      // ),
                      Positioned(
                        top: _height * 0.65,
                        left: _width * 0.2,
                        child: IconButton(
                            //backgroundColor: Colors.greenAccent.shade400,

                            icon: Icon(
                              Icons.coffee_rounded,
                              size: 32,
                            ),
                            onPressed: () {}),
                      ),
                      Positioned(
                        top: _height * 0.65,
                        left: _width * 0.7,
                        child: IconButton(
                            //backgroundColor: Colors.greenAccent.shade400,
                            icon: Icon(
                              Icons.restart_alt,
                              size: 30,
                            ),
                            onPressed: () {
                              countDowncontroller.restart();
                            }),
                      ),
                      Positioned(
                        top: _height * 0.65,
                        left: _width * 0.44,
                        child: FloatingActionButton(
                            backgroundColor: Colors.deepPurpleAccent.shade400,
                            foregroundColor: Colors.white,
                            child: AnimatedIcon(
                              progress: animation_controller,
                              icon: AnimatedIcons.play_pause,
                              size: 35,
                            ),
                            onPressed: () {
                              tooglePlayPauseIcon();
                              setState(() {
                                if (!isRunning) {
                                  countDowncontroller.pause();
                                } else {
                                  countDowncontroller.resume();
                                }
                              });
                            }),
                      )
                    ]))));
  }

  void tooglePlayPauseIcon() => setState(() {
        isRunning = !isRunning;
        isRunning
            ? animation_controller.forward()
            : animation_controller.reverse();
      });
}
