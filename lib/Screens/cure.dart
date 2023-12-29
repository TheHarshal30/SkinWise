// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/curedetail.dart';
import 'package:kpkwk/Screens/upload.dart';
import 'package:kpkwk/logic/llmcontroller.dart';
import 'package:kpkwk/logic/localllm.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:intl/intl.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:toast/toast.dart';

class CurePage extends StatefulWidget {
  final String pred1;
  final String cure1;
  final String pred2;
  final String cure2;
  final String pred3;
  final String cure3;
  final double confi1;
  final double confi2;
  final double confi3;
  const CurePage(
      {super.key,
      required this.pred1,
      required this.cure1,
      required this.pred2,
      required this.cure2,
      required this.pred3,
      required this.cure3,
      required this.confi1,
      required this.confi2,
      required this.confi3});

  @override
  State<CurePage> createState() => _CurePageState();
}

class _CurePageState extends State<CurePage> {
  final LlmController llmController = LlmController();
  String curellm = '';
  var cure_avail1 = 0;
  Future getHaikuTextData(
      String productName, String curellmx, var cure_avail5) async {
    var poemData = await llmController.getPoem(productName, 1);
    setState(() {
      if (poemData != null) {
        curellm = poemData;
      } else {
        curellm = llmanswers[productName]!;
      }
      cure_avail1 = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.of(context).pushAndRemoveUntil(
            PageTransition(
                child: BottomNavBar(
                  idx: 0,
                ),
                type: PageTransitionType.leftToRight),
            (Route<dynamic> route) => false);
      },
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: SafeArea(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 20, right: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Preliminary',
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '  Diagnosis',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200),
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "The diagnosis generated using Osirs AI is just for reference. Osiris AI acts as assistant to Dermatologists. It suggested to consult dermatologists for proper treatment",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.exo2(
                            textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                      child: Text(
                        "Possible Conditions",
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                      child: GestureDetector(
                        onTap: () {
                          if (cure1 == "") {
                            Toast.show(
                                "We are getting cure for you, please wait 🙏",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom);
                          } else {
                            Navigator.push(
                                context,
                                AnimateRoute(
                                    widget: CureDetails(
                                  cure: cure1,
                                  pred: widget.pred1,
                                  id: 1,
                                )));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(10),
                                  width: MediaQuery.of(context).size.width / 5,
                                  lineHeight: 8.0,
                                  percent: widget.confi1,
                                  progressColor: Colors.red,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.pred1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "High risk (${(widget.confi1 * 100).toString()})",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                      child: GestureDetector(
                        onTap: () {
                          if (cure2 == "") {
                            Toast.show(
                                "We are getting cure for you, please wait 🙏",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom);
                          } else {
                            Navigator.push(
                                context,
                                AnimateRoute(
                                    widget: CureDetails(
                                  cure: cure2,
                                  pred: widget.pred2,
                                  id: 1,
                                )));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(10),
                                  width: MediaQuery.of(context).size.width / 5,
                                  lineHeight: 8.0,
                                  percent: widget.confi2,
                                  progressColor: Colors.yellow.shade600,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.pred2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "Medium risk (${(widget.confi2 * 100).toString()})",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                      child: GestureDetector(
                        onTap: () {
                          if (cure3 == "") {
                            Toast.show(
                                "We are getting cure for you, please wait 🙏",
                                duration: Toast.lengthLong,
                                gravity: Toast.bottom);
                          } else {
                            Navigator.push(
                                context,
                                AnimateRoute(
                                    widget: CureDetails(
                                  cure: cure3,
                                  pred: widget.pred3,
                                  id: 1,
                                )));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                LinearPercentIndicator(
                                  barRadius: Radius.circular(10),
                                  width: MediaQuery.of(context).size.width / 5,
                                  lineHeight: 8.0,
                                  percent: (widget.confi3),
                                  progressColor: Colors.green,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.pred3,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Text(
                                          "Low risk (${(widget.confi3 * 100).toString()})",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Not satisfied with diagnosis?",
                            style: GoogleFonts.exo2(
                              textStyle: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: NeoPopButton(
                                color: Colors.green.shade300,
                                bottomShadowColor:
                                    ColorUtils.getVerticalShadow(Colors.black)
                                        .toColor(),
                                rightShadowColor:
                                    ColorUtils.getHorizontalShadow(Colors.black)
                                        .toColor(),
                                animationDuration: Duration(milliseconds: 200),
                                onTapUp: () => {
                                  HapticFeedback.vibrate(),
                                  Navigator.of(context).pushAndRemoveUntil(
                                      PageTransition(
                                          child: BottomNavBar(
                                            idx: 0,
                                          ),
                                          type: PageTransitionType.leftToRight),
                                      (Route<dynamic> route) => false)
                                },
                                onTapDown: () => HapticFeedback.vibrate(),
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.camera_alt),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Text(
                                          "Try Again",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    // padding:
                    //     const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Icon(
                    //             Icons.timer,
                    //             size: 20,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 10.0),
                    //             child: Text(getCurrentDateAndTime(),
                    //                 style: GoogleFonts.exo2(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: Colors.grey.shade900,
                    //                   fontSize: 15,
                    //                 )),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Icon(
                    //             Icons.check_box,
                    //             color: Colors.green.shade800,
                    //             size: 20,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 10.0),
                    //             child: Text(widget.pred,
                    //                 style: GoogleFonts.exo2(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: Colors.grey.shade900,
                    //                   fontSize: 15,
                    //                 )),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Row(
                    //         children: [
                    //           Icon(
                    //             Icons.info,
                    //             size: 20,
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(left: 10.0),
                    //             child: Text("Cure Suggested: ",
                    //                 style: GoogleFonts.exo2(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: Colors.grey.shade900,
                    //                   fontSize: 15,
                    //                 )),
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // Padding(
                    //   padding:
                    //       const EdgeInsets.only(left: 50.0, right: 20, top: 20),
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height / 1.6,
                    //     child: RawScrollbar(
                    //       thumbColor: Colors.grey.shade300,
                    //       thickness: 3,
                    //       thumbVisibility: true,
                    //       child: Markdown(
                    //           physics: BouncingScrollPhysics(),
                    //           padding: EdgeInsets.all(0),
                    //           data: widget.cure),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

String getCurrentDateAndTime() {
  final now = DateTime.now();
  final timeFormat = DateFormat.Hm(); // Format for time (e.g., 11:04)
  final dateFormat =
      DateFormat.yMMMMd(); // Format for date (e.g., May 19, 2023)

  final formattedTime = timeFormat.format(now);
  final formattedDate = dateFormat.format(now);

  return '$formattedTime / $formattedDate';
}
