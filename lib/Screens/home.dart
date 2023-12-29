// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/education.dart';
import 'package:kpkwk/Screens/profile.dart';
import 'package:kpkwk/Screens/report_details.dart';
import 'package:kpkwk/Screens/routines.dart';
import 'package:kpkwk/Screens/upload.dart';
import 'package:kpkwk/logic/llmcontroller.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:kpkwk/logic/llm.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> skincareTips = [
    Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(
              Icons.person,
              color: Colors.green[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Minimal Makeup",
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "Keep your makeup to the minimal and still look \npresentable with a dash of kohl and lip balms",
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(
              Icons.water_drop,
              color: Colors.green[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cleansing",
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "Due to the increased humidity there is a great \nchance that the skin will produce more oil",
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Icon(
              Icons.sunny,
              color: Colors.green[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sunscreen",
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  "Though the weather looks pleasant and cloudy \none must not avoid the protective shield",
                  style: GoogleFonts.exo2(
                    textStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ];
  var currIdx = 0;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height,
                      color:
                          Colors.blueGrey.shade800.withRed(10).withOpacity(0.3),
                      padding: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Welcome,',
                                style: GoogleFonts.urbanist(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Mahi',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    AnimateRoute(widget: ProfilePage()));
                                HapticFeedback.heavyImpact();
                              },
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            color: Colors.transparent,
                                            spreadRadius: 0)
                                      ],
                                      color: Colors.transparent),
                                  child: Icon(Icons.person_2)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 1.5,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30.0, left: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: 'Skincare for',
                                      style: GoogleFonts.exo2(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Today,',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "(It seems partly cloudy in your area today)",
                                    style: GoogleFonts.urbanist(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              10,
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CarouselSlider(
                                                items: skincareTips,
                                                options: CarouselOptions(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            10,
                                                    viewportFraction: 1,
                                                    autoPlay: true,
                                                    autoPlayAnimationDuration:
                                                        Duration(seconds: 3),
                                                    autoPlayCurve:
                                                        Curves.fastOutSlowIn,
                                                    padEnds: false,
                                                    autoPlayInterval:
                                                        Duration(seconds: 5)))
                                            // AnimatedSwitcher(
                                            //   duration: Duration(seconds: 2),
                                            //   key: ValueKey<int>(currIdx),
                                            //   child: skincareTips[currIdx],
                                            // ),
                                            // skincareTips[0],
                                            // skincareTips[1],
                                            // skincareTips[2],
                                          ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, top: 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30.0, left: 30),
                                            child: Text(
                                              "Explore",
                                              style: GoogleFonts.exo2(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 00.0, left: 30),
                                            child: RichText(
                                              text: TextSpan(
                                                text: 'Skin',
                                                style: GoogleFonts.exo2(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'Wise',
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 22,
                                                    ),
                                                  ),
                                                  TextSpan(text: " Care")
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Image(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                16,
                                            image: AssetImage("assets/sk.png")),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10, right: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/upload");
                                              HapticFeedback.heavyImpact();
                                            },
                                            child: exploring(
                                                context,
                                                "Skin Cure",
                                                "Scan for diseases",
                                                "assets/skincure.png"),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/report");
                                              HapticFeedback.heavyImpact();
                                            },
                                            child: exploring(
                                                context,
                                                "Reports",
                                                "Personal reports",
                                                "assets/reports.png"),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/routines");
                                              HapticFeedback.heavyImpact();
                                            },
                                            child: exploring(
                                                context,
                                                "Routines",
                                                "Skin care for you",
                                                "assets/skincare.png"),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  AnimateRoute(
                                                      widget: EducationPage()));

                                              HapticFeedback.heavyImpact();
                                            },
                                            child: exploring(
                                                context,
                                                "3D model",
                                                "Learn about skin",
                                                "assets/model.png"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("WHAT'S SPECIAL 🔥",
                                          style: GoogleFonts.exo2(
                                            letterSpacing: 2,
                                            color: Colors.grey.shade600,
                                            textStyle: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20.0, left: 20, right: 20),
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 0, left: 10, right: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.blueGrey.shade800
                                                  .withRed(10)
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20.0, left: 10),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'Start using',
                                                    style: GoogleFonts.exo2(
                                                      wordSpacing: 1,
                                                      letterSpacing: 1.2,
                                                      textStyle: TextStyle(
                                                        color: Colors
                                                            .grey.shade800,
                                                      ),
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: ' Skin',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      TextSpan(
                                                        text: 'Wise',
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                2,
                                                            child: Text(
                                                                "Interactive Diagnosis for best skincare",
                                                                style:
                                                                    GoogleFonts
                                                                        .exo2(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                )),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 5.0),
                                                            child: Text(
                                                                "for Doctors & Individuals!",
                                                                style:
                                                                    GoogleFonts
                                                                        .exo2(
                                                                  textStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade500,
                                                                    fontSize:
                                                                        13,
                                                                  ),
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Image(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            12,
                                                        image: AssetImage(
                                                            "assets/desc2.png"))
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushAndRemoveUntil(
                                                          PageTransition(
                                                              child:
                                                                  UploadPage(),
                                                              type: PageTransitionType
                                                                  .rightToLeft),
                                                          (Route<dynamic>
                                                                  route) =>
                                                              false);
                                                  HapticFeedback.heavyImpact();
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 20.0),
                                                  child: Center(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors
                                                              .blueGrey.shade800
                                                              .withRed(10)
                                                              .withOpacity(0.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20)),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              20,
                                                      child: Center(
                                                          child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(Icons.camera_alt,
                                                              color:
                                                                  Colors.white,
                                                              size: 18),
                                                          Text(" Start Now",
                                                              style: GoogleFonts
                                                                  .exo2(
                                                                textStyle:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              )),
                                                        ],
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 40.0, left: 30),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Text("Inside \nLabs",
                                        style: GoogleFonts.modernAntiqua(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey.shade400,
                                            fontSize: 60,
                                          ),
                                        )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, top: 20),
                                  child:
                                      Text("Engineered with ❤️ at Inside Labs",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 16,
                                            ),
                                          )),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}

Widget exploring(
    BuildContext context, String title, String subtit, String str) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Container(
      padding: EdgeInsets.only(top: 20, left: 10, right: 0),
      height: MediaQuery.of(context).size.height / 6.5,
      width: MediaQuery.of(context).size.width / 2.3,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20))),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // icon,
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.exo2(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      subtit,
                      style: GoogleFonts.exo2(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(""),
                      Image(
                          height: MediaQuery.of(context).size.height / 12,
                          image: AssetImage(str)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
