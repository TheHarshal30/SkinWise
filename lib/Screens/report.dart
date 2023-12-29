// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/report_details.dart';
import 'package:kpkwk/logic/routing_animation.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => ReportPageState();
}

class ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.blueGrey.shade800.withRed(10),
              ),
              Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Text(
                    "Good Morning, Mahi ❤️",
                    style: GoogleFonts.exo2(
                        textStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Text(
                  "Check your Reports",
                  style: GoogleFonts.lora(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.only(bottom: 5, left: 5, right: 5, top: 5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 1.0,
                            ),
                          ],
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.file_open,
                                          color: Colors.green, size: 20),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: RichText(
                                          text: TextSpan(
                                            text: 'Report',
                                            style: GoogleFonts.exo2(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' #003',
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "Processing",
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.yellow.shade900,
                                      fontSize: 13,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 20, right: 20),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "Image submitted on 27 Aug, 2023",
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20, right: 20),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "image_submitted.jpeg",
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 10,
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 20, right: 20),
                            child: Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "AI Prediction: Harmonal Acne",
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: 13,
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Generating...",
                                        style: GoogleFonts.exo2(
                                          textStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0, left: 30),
                    child: RichText(
                      text: TextSpan(
                        text: 'Past',
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Analysis,',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                AnimateRoute(widget: ReportDetailsPage()));
                            HapticFeedback.heavyImpact();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 0.0, left: 0, right: 0),
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.only(
                                        bottom: 5, left: 5, right: 5, top: 5),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 1.0), //(x,y)
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                        color: Colors.grey.shade100,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.file_open,
                                                      color: Colors.green,
                                                      size: 20),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: RichText(
                                                      text: TextSpan(
                                                        text: 'Report',
                                                        style: GoogleFonts.exo2(
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                            text: ' #002',
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade700,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text(
                                              "Completed",
                                              style: GoogleFonts.exo2(
                                                textStyle: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.green,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0, left: 5),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Text(
                                                "Image submitted on 12 Aug, 2023",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                      color:
                                                          Colors.grey.shade700,
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.italic),
                                                ),
                                              )),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0, left: 5, bottom: 0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Text(
                                                "image_submitted.jpeg",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20.0, left: 5, bottom: 0),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.5,
                                              child: Text(
                                                "AI Prediction: Ringworm",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  child: Text(
                                                "View Details",
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                    color: Colors.grey.shade900,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 40,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
