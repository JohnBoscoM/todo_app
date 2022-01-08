import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/controller/task_operations.dart';
import 'package:todo_app/model/board.dart';
import 'package:todo_app/model/todo.dart';
import 'package:neon_circular_timer/neon_circular_timer.dart';
import 'package:todo_app/view/todo_list.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen>
    with TickerProviderStateMixin {
  bool _isPause = false;
  late SharedPreferences sharedPreferences;
  late AnimationController animation_controller;
  final CountDownController controller = new CountDownController();
  bool isRunning = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    animation_controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animation_controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: []),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 0, right: 0, top: 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [])),
                      // Switch(value: true, onChanged: (value) {}),
                      //SizedBox(height: MediaQuery.of(context).viewPadding.top + 20),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(children: [
                            // Text("Round 1",
                            //     style: GoogleFonts.rajdhani(fontSize: 23)),
                            Container(
                              height: 145,
                              decoration: BoxDecoration(
                                // color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  // BoxShadow(
                                  //   blurRadius: 15,
                                  //   offset: Offset(-5, -5),
                                  //   color: Colors.white,
                                  // ),
                                  // BoxShadow(
                                  //   blurRadius: 15,
                                  //   offset: Offset(10.5, 10.5),
                                  //   color: Color.fromRGBO(214, 223, 230, 1),
                                  // )
                                ],
                              ),
                              // Digital green background

                              child: NeonCircularTimer(
                                width: 800,
                                duration: 20,
                                controller: controller,
                                isTimerTextShown: true,
                                neumorphicEffect: true,
                                innerFillGradient: LinearGradient(colors: [
                                  Colors.greenAccent.shade200,
                                  Colors.blueAccent.shade400
                                ]),
                                neonGradient: LinearGradient(colors: [
                                  Colors.greenAccent.shade200,
                                  Colors.blueAccent.shade400
                                ]),
                              ),
                            ),
                          ])),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // AnimatedContainer(
                          //   duration: Duration.zero,
                          //   child: Icon(
                          //     Icons.timer,
                          //     size: 30,
                          //   ),
                          // ),
                          // PlayButton(
                          //   pauseIcon: Icon(Icons.pause, color: Colors.black, size: 40),
                          //   playIcon:
                          //       Icon(Icons.play_arrow, color: Colors.black, size: 40),
                          //   onPressed: () {
                          //     setState(() {
                          //       isActive = !isActive;
                          //     });
                          //   },
                          // ),
                          FloatingActionButton(
                              backgroundColor: Colors.greenAccent.shade400,
                              foregroundColor: Colors.white,
                              child: AnimatedIcon(
                                progress: animation_controller,
                                icon: AnimatedIcons.play_pause,
                                size: 35,
                              ),
                              onPressed: () {
                                tooglePlayPauseIcon();
                                setState(() {
                                  // isActive = !isActive;
                                });
                              }),
                          FloatingActionButton(
                              backgroundColor: Colors.greenAccent.shade400,
                              foregroundColor: Colors.white,
                              child: AnimatedIcon(
                                progress: animation_controller,
                                icon: AnimatedIcons.play_pause,
                                size: 35,
                              ),
                              onPressed: () {
                                tooglePlayPauseIcon();
                                setState(() {
                                  // isActive = !isActive;
                                });
                              }),
                        ],
                      ),
                      //SizedBox(height: 90),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.all(Radius.circular(70)),
                          ),
                          width: width,
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            ),
                            title: Text(
                              'MongoDB Plugg',
                              style: GoogleFonts.actor(
                                  // color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Time Spent: 35min',
                              style: GoogleFonts.actor(
                                  // color: Colors.black.withOpacity(0.6)
                                  ),
                            ),
                            trailing: Icon(
                              CupertinoIcons.volume_up,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                      //   SizedBox(height: 10),

                      // Text(
                      //   "v.100.1",
                      //   style: GoogleFonts.actor(
                      //       color: Colors.grey.shade500, fontSize: 19),
                      // )
                    ],
                  ),
                ),
              ],
            )));
  }

  void tooglePlayPauseIcon() => setState(() {
        isRunning = !isRunning;
        isRunning
            ? animation_controller.forward()
            : animation_controller.reverse();
      });
}
