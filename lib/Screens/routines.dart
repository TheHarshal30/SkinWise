// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpkwk/Screens/3dmodel.dart';
import 'package:kpkwk/Screens/3dmodel2.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/loading2.dart';
import 'package:kpkwk/Screens/profile.dart';
import 'package:kpkwk/Screens/temp.dart';
import 'package:kpkwk/logic/llmcontroller.dart';

import 'package:kpkwk/logic/model.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class RoutinesPage extends StatefulWidget {
  const RoutinesPage({super.key});

  @override
  State<RoutinesPage> createState() => _RoutinesPageState();
}

class _RoutinesPageState extends State<RoutinesPage> {
  var cure_avail = 0;
  var multi = 0;
  List<String> mkc = [];
  final LlmController llmController = LlmController();
  String curellm = '';
  String curellm1 = '';
  String curellm2 = '';
  // temp(String productName) {
  //   curellm = "Routine for ${mkc[0]}" "\n" +
  //       llmroutines[mkc[0]]! +
  //       "Routine for ${mkc[1]}" "\n" +
  //       llmroutines[mkc[1]]! +
  //       "Routine for ${mkc[2]}" "\n" +
  //       llmroutines[mkc[2]]!;
  //   Future.delayed(const Duration(seconds: 10), () {
  //     setState(() {
  //       cure_avail = 1;
  //     });
  //   });
  // }

  var write = 0;
  final picker = ImagePicker();
  Future getImage() async {
    HapticFeedback.heavyImpact();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final classifier = ImageClassifier();

    await classifier.initialize();
    final recognitions = await classifier.recognizeImage(pickedFile!.path);
    final top3Recognitions = recognitions.take(3); // Get the top 3 recognitions
    if (top3Recognitions.first.name == "Normal") {
      mkc.add(recognitions[0].name);
    } else {
      for (final recognition in top3Recognitions) {
        mkc.add(recognition.name);
        print(
            'Label: ${recognition.name}, Confidence: ${recognition.confidence}');
      }
    }
    List<String> last = [];
    if (mkc[0] == "Normal") last.add(mkc[0]);
    Navigator.push(
        context,
        AnimateRoute(
            widget: LoadingPage2(
          mkc: (mkc[0] == "Normal") ? last : mkc,
        )));
    setState(() {
      // _imageFile = File(pickedFile!.path);
      // classifyImage(pickedFile!.path);
      temp(mkc[0] + " " + mkc[1] + " " + mkc[2]);
      write = 1;
    });
  }

  TextEditingController _cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 40.0),
                      //   child: Text(
                      //     "One Stop Solution for Tele-Dermatology",
                      //     style: GoogleFonts.exo2(
                      //       textStyle: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.green,
                      //         fontSize: 15,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'Personalized Skincare\n',
                            style: GoogleFonts.exo2(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'with',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: ' AI',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: ' in few steps',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: Image(
                                image: AssetImage(
                              "assets/skinroutine.png",
                            ))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.25,
                        child: Text(
                          "Take Skin Diagnostic Test and get core recommendations",
                          style: GoogleFonts.exo2(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 40),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 10,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Column(
                                      children: [
                                        Image(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              18,
                                          image: AssetImage("assets/recom.png"),
                                        ),
                                        Text(
                                          (index == 0)
                                              ? "Acne"
                                              : (index == 1)
                                                  ? "Blackheads"
                                                  : (index == 2)
                                                      ? "Sunspots"
                                                      : "Dermititis",
                                          style: GoogleFonts.exo2(
                                            textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 50.0, right: 50, top: 20),
                        child: TextField(
                            controller: _cont,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          AnimateRoute(
                                              widget: TempPage(
                                            mkc: _cont.text,
                                          )));
                                    },
                                    child: Icon(Icons.done)),
                                hintText: "Describe your problem",
                                hintStyle: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                  color: Colors.grey,
                                )))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          "--OR--",
                          style: GoogleFonts.urbanist(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
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
                              Navigator.push(
                                  context, AnimateRoute(widget: ModelPage2()))
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      "Upload Image",
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
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20.0),
                      //   child: Container(
                      //     //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //     height: MediaQuery.of(context).size.height / 15,
                      //     width: MediaQuery.of(context).size.width / 2.3,
                      //     margin: EdgeInsets.only(bottom: 5),
                      //     decoration: BoxDecoration(
                      //         color: Colors.green.shade200,
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: InkWell(
                      //       onTap: () {},
                      //       child: Container(
                      //         padding: EdgeInsets.all(10),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Icon(
                      //               Icons.camera_alt,
                      //               color: Colors.black,
                      //             ),
                      //             Padding(
                      //               padding: const EdgeInsets.only(left: 8.0),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.center,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Text(
                      //                     "Upload Image",
                      //                     style: GoogleFonts.exo2(
                      //                       textStyle: TextStyle(
                      //                         fontWeight: FontWeight.w500,
                      //                         color: Colors.black,
                      //                         fontSize: 16,
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
