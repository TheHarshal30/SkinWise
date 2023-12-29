// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kpkwk/Screens/cure.dart';
import 'package:kpkwk/Screens/cure2.dart';
import 'package:kpkwk/Screens/profile.dart';
import 'package:kpkwk/logic/llmcontroller.dart';

import 'package:kpkwk/logic/routing_animation.dart';

class LoadingPage2 extends StatefulWidget {
  final List<String> mkc;
  const LoadingPage2({super.key, required this.mkc});

  @override
  State<LoadingPage2> createState() => LoadingPageState();
}

class LoadingPageState extends State<LoadingPage2> {
  var cure_avail = 0;
  final LlmController llmController = LlmController();
  String curellm = '';
  temp(List<String> productName) {
    if (widget.mkc[0] == "Normal") {
      curellm = "You have a perfectly Normal skin 🙂";
    } else {
      curellm = "Routine for ${widget.mkc[0]}" "\n\n" +
          llmroutines[widget.mkc[0]]! +
          "\n\n"
              "Routine for ${widget.mkc[1]}"
              "\n\n" +
          llmroutines[widget.mkc[1]]! +
          "\n\n"
              "Routine for ${widget.mkc[2]}"
              "\n\n" +
          llmroutines[widget.mkc[2]]!;
    }

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context,
          AnimateRoute(
              widget: CurePage2(
            pred: widget.mkc,
            cure: curellm,
          )));
    });
  }

  @override
  void initState() {
    super.initState();
    temp(widget.mkc);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            child: Image(image: AssetImage("assets/loadingRoutine2.gif")),
          ),
        ],
      ),
    );
  }
}
