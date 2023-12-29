// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/cure2.dart';
import 'package:kpkwk/logic/llmcontroller.dart';
import 'package:kpkwk/logic/localllm.dart';
import 'package:kpkwk/logic/routing_animation.dart';

class TempLoading extends StatefulWidget {
  final String mkc;
  const TempLoading({super.key, required this.mkc});

  @override
  State<TempLoading> createState() => _TempLoadingState();
}

class _TempLoadingState extends State<TempLoading> {
  var cure_avail = 0;
  String curellm = '';
  final LlmController llmController = LlmController();
  Future getHaikuTextData(String productName) async {
    var poemData = await llmController.getPoem(productName, 1);
    setState(() {
      if (poemData != null) {
        curellm = poemData;
      } else {
        //curellm = llmanswers[productName]!;
      }
      cure_avail = 1;
    });
    if (cure_avail == 1) {
      Navigator.push(
          context,
          AnimateRoute(
              widget: CurePage2(
            pred: [widget.mkc],
            cure: curellm,
          )));
    }
  }

  @override
  void initState() {
    super.initState();
    getHaikuTextData(widget.mkc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Thinking for best cure ...",
              style: GoogleFonts.exo2(
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade900,
                fontSize: 18,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Image(image: AssetImage("assets/loadingRoutine2.gif")),
          ),
        ],
      ),
    );
  }
}
