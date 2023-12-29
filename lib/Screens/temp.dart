// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/loading3.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class TempPage extends StatefulWidget {
  final String mkc;
  const TempPage({super.key, required this.mkc});

  @override
  State<TempPage> createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  getNext() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        load1 = 1;
        load2 = 1;
      });
    });
  }

  var load1 = 0;
  var load2 = 2;
  @override
  void initState() {
    super.initState();
    getNext();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                        text: 'Apollo',
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
                            padding: const EdgeInsets.only(left: 5.0),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Text(" ''${widget.mkc}'' ")),
                    ),
                    (load2 == 1)
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 20),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: ModelViewer(
                                    backgroundColor: Colors.transparent,
                                    src: 'assets/lara.glb',
                                    alt: 'A 3D model of Skin',
                                    autoRotate: true,
                                    disableZoom: false,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      AnimateRoute(
                                          widget: TempLoading(
                                        mkc: widget.mkc,
                                      )));
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
                                            "Click here after Marking",
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
}
