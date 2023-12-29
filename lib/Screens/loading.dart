// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/cure.dart';
import 'package:kpkwk/Screens/profile.dart';
import 'package:kpkwk/Screens/upload.dart';
import 'package:kpkwk/logic/llmcontroller.dart';
import 'package:kpkwk/logic/localllm.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:page_transition/page_transition.dart';

class LoadingPage extends StatefulWidget {
  final String pred;
  final String pred2;
  final String pred3;
  final double confi1;
  final double confi2;
  final double confi3;
  const LoadingPage(
      {super.key,
      required this.pred,
      required this.pred2,
      required this.pred3,
      required this.confi1,
      required this.confi2,
      required this.confi3});

  @override
  State<LoadingPage> createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage> {
  var cure_avail1 = 0;
  var cure_avail2 = 0;
  var cure_avail3 = 0;
  final LlmController llmController = LlmController();
  String curellm = '';
  String curellm2 = '';
  String curellm3 = '';
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

  Future getHaikuTextData2(
      String productName, String curellm, var cure_avail5) async {
    var poemData = await llmController.getPoem(productName, 1);
    setState(() {
      if (poemData != null) {
        curellm2 = poemData;
      } else {
        curellm2 = llmanswers[productName]!;
      }
      cure_avail2 = 1;
    });
  }

  Future getHaikuTextData3(
      String productName, String curellmy, var cure_avail5) async {
    var poemData = await llmController.getPoem(productName, 1);
    setState(() {
      if (poemData != null) {
        curellm3 = poemData;
      } else {
        curellm3 = llmanswers[productName]!;
      }
      cure_avail3 = 1;
    });
    if (cure_avail3 == 1 && cure_avail1 == 1 && cure_avail3 == 1) {
      Navigator.of(context).pushAndRemoveUntil(
          PageTransition(
              child: CurePage(
                pred1: widget.pred,
                pred2: widget.pred2,
                pred3: widget.pred3,
                cure1: curellm,
                cure2: curellm2,
                cure3: curellm3,
                confi1: widget.confi1,
                confi2: widget.confi2,
                confi3: widget.confi3,
              ),
              type: PageTransitionType.leftToRight),
          (Route<dynamic> route) => false);
    }
  }

  getdatas() {
    getHaikuTextData(widget.pred, curellm, 1)
        .then((value) => getHaikuTextData2(widget.pred2, curellm2, 2))
        .then((value) => getHaikuTextData3(widget.pred3, curellm3, 3));
  }

  getPrints() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          PageTransition(
              child: CurePage(
                pred1: widget.pred,
                pred2: widget.pred2,
                pred3: widget.pred3,
                cure1: cure1,
                cure2: cure2,
                cure3: cure3,
                confi1: widget.confi1,
                confi2: widget.confi2,
                confi3: widget.confi3,
              ),
              type: PageTransitionType.leftToRight),
          (Route<dynamic> route) => false);
    });
  }

  @override
  void initState() {
    super.initState();
    //getdatas();
    getPrints();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Analyzing Image ...",
              style: GoogleFonts.exo2(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade900,
                fontSize: 18,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image(image: AssetImage("assets/loadingCure.gif")),
          ),
        ],
      ),
    );
  }
}
