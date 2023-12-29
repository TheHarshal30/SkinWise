// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/loading.dart';
import 'package:kpkwk/Screens/loading3.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:page_transition/page_transition.dart';

class Temp2 extends StatefulWidget {
  final String pred;
  final String pred2;
  final String pred3;
  final double confi1;
  final double confi2;
  final double confi3;
  const Temp2(
      {super.key,
      required this.pred,
      required this.pred2,
      required this.pred3,
      required this.confi1,
      required this.confi2,
      required this.confi3});

  @override
  State<Temp2> createState() => _Temp2State();
}

class _Temp2State extends State<Temp2> {
  TextEditingController _age = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _diseases = TextEditingController();
  getNext() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        load1 = 1;
        load2 = 1;
      });
    });
  }

  getNext2() {
    setState(() {
      load3 = 1;
    });
  }

  var load1 = 0;
  var load2 = 0;
  var load3 = 0;
  @override
  void initState() {
    super.initState();
    getNext();
  }

  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
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
                        text: 'Osiris',
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '  AI',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
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
                height: MediaQuery.of(context).size.height * 1.25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 20),
                      child: Row(
                        children: [
                          (load1 == 0)
                              ? Container(
                                  width: 20,
                                  height: 20,
                                  child:
                                      CircularProgressIndicator(strokeWidth: 2))
                              : Text("👍"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Understanding your problem",
                              style: GoogleFonts.exo2(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 50),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            "Reading the image provided",
                            style: GoogleFonts.exo2(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          )),
                    ),
                    (load2 == 1)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 20),
                            child: Row(
                              children: [
                                (load3 == 0)
                                    ? Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2))
                                    : Text("👍"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "Fill the following details",
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(""),
                    (load2 == 1)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 50, right: 50),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          height: 30,
                                          child: TextField(
                                            controller: _age,
                                            decoration: InputDecoration(
                                                hintText: "Age",
                                                hintStyle: GoogleFonts.exo2(
                                                  fontSize: 12,
                                                )),
                                          ),
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4,
                                          height: 30,
                                          child: TextField(
                                            controller: _city,
                                            decoration: InputDecoration(
                                                hintText: "City/Country",
                                                hintStyle: GoogleFonts.exo2(
                                                  fontSize: 12,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 10),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      height: 30,
                                      child: TextField(
                                        controller: _gender,
                                        decoration: InputDecoration(
                                            hintText: "Male/Female",
                                            hintStyle: GoogleFonts.exo2(
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0, top: 10),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 30,
                                      child: TextField(
                                        controller: _diseases,
                                        decoration: InputDecoration(
                                            hintText: "Prev chronic diseases",
                                            hintStyle: GoogleFonts.exo2(
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      getNext2();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 25),
                                      child: Icon(Icons.done, size: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(""),
                    (load3 == 1)
                        ? Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 40.0, left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2)),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        child: Text(
                                          "Please locate the area where you are having this problem (Use zoom to locate the cirlce)",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 50.0, right: 30, top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5)),
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: ModelViewer(
                                    backgroundColor: Colors.grey.shade200,
                                    src: 'assets/body.glb',
                                    alt: 'A 3D model of Skin',
                                    autoRotate: true,
                                    disableZoom: false,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      PageTransition(
                                          child: LoadingPage(
                                            confi1: widget.confi1,
                                            confi2: widget.confi2,
                                            confi3: widget.confi3,
                                            pred: widget.pred,
                                            pred2: widget.pred2,
                                            pred3: widget.pred3,
                                          ),
                                          type: PageTransitionType.leftToRight),
                                      (Route<dynamic> route) => false);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade100,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Text(
                                            "Click here after marking",
                                            style: GoogleFonts.exo2(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Text("")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500), // Adjust the duration as needed
      curve: Curves.easeOut, // You can change the curve to your liking
    );
  }
}
