// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/upload.dart';

class CureDetails extends StatefulWidget {
  final String pred;
  final String cure;
  final int id;
  const CureDetails(
      {super.key, required this.pred, required this.cure, required this.id});

  @override
  State<CureDetails> createState() => _CureDetailsState();
}

class _CureDetailsState extends State<CureDetails> {
  String Fcure = "";
  @override
  Widget build(BuildContext context) {
    if (widget.id == 1) {
      if (cure1 != "") {
        setState(() {
          Fcure = cure1;
        });
      }
    }
    if (widget.id == 2) {
      if (cure2 != "") {
        setState(() {
          Fcure = cure2;
        });
      }
    }
    if (widget.id == 3) {
      if (cure3 != "") {
        setState(() {
          Fcure = cure3;
        });
      }
    }
    return Scaffold(
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
                        text: 'Detailed',
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '  Cure',
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
                          const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                      child: Text(
                        "${widget.pred}:",
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 20, bottom: 20),
                        child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100,
                            ),
                            height: MediaQuery.of(context).size.height / 1.35,
                            child: RawScrollbar(
                              thumbColor: Colors.grey.shade300,
                              thickness: 3,
                              thumbVisibility: true,
                              child: Markdown(
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(0),
                                  data: widget.cure),
                            ))),
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
