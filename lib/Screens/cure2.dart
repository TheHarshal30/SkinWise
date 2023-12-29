// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/routines.dart';
import 'package:kpkwk/Screens/upload.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:page_transition/page_transition.dart';

class CurePage2 extends StatefulWidget {
  final List<String> pred;
  final String cure;
  const CurePage2({super.key, required this.cure, required this.pred});

  @override
  State<CurePage2> createState() => _CurePageState();
}

class _CurePageState extends State<CurePage2> {
  @override
  Widget build(BuildContext context) {
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
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800.withRed(10).withOpacity(1),
          elevation: 0,
          centerTitle: true,
          title: Text("Result",
              style: GoogleFonts.exo(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 18,
              )),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.timer,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(getCurrentDateAndTime(),
                            style: GoogleFonts.exo2(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: Colors.green.shade800,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                            (widget.pred[0] == "Normal")
                                ? "Normal Skin"
                                : widget.pred.toString(),
                            style: GoogleFonts.exo2(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("Routines Suggested: ",
                            style: GoogleFonts.exo2(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900,
                              fontSize: 15,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 20, top: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: RawScrollbar(
                  thumbColor: Colors.grey.shade300,
                  thickness: 3,
                  thumbVisibility: true,
                  child: Markdown(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      data: widget.cure),
                ),
              ),
            ),
          ]),
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
