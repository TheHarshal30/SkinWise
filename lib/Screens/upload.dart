// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, prefer_const_declarations, use_build_context_synchronously, unnecessary_new

import 'dart:collection';
import 'dart:ffi';
import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpkwk/Screens/3dmodel.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/loading.dart';
import 'package:kpkwk/Screens/profile.dart';
import 'package:kpkwk/Screens/report_details.dart';
import 'package:kpkwk/Screens/temp2.dart';
import 'package:kpkwk/logic/llmcontroller.dart';

import 'package:kpkwk/logic/model.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:logger/logger.dart';
import 'package:image/image.dart' as img; // For image processing
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/widgets/buttons/neopop_button/neopop_button.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:toast/toast.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

final LlmController llmController = LlmController();
String cure1 = "";
String cure2 = '';
String cure3 = "";
Future getHaikuTextData(String productName) async {
  String curellm;
  var poemData = await llmController.getPoem(productName, 1);
  if (poemData != null) {
    curellm = poemData;
  } else {
    curellm = llmanswers[productName]!;
  }
  return curellm;
}

getCures(String pred1, String pred2, String pred3) async {
  // cure1 = getHaikuTextData(pred1, cure1).toString();
  // cure2 = getHaikuTextData(pred2, cure2).toString();
  // cure3 = getHaikuTextData(pred3, cure3).toString();
  // // print(cure1);
  // // print(cure2);
  // // print(cure3);
  final futures = [
    getHaikuTextData(pred1),
    getHaikuTextData(pred2),
    getHaikuTextData(pred3),
  ];

  final results = await Future.wait(futures);

  cure1 = results[0].toString();
  cure2 = results[1].toString();
  cure3 = results[2].toString();
  print('Result 1: $cure1');
  print('Result 2: $cure2');
  print('Result 3: $cure3');
}

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  var cure_avail = 0;
  final LlmController llmController = LlmController();
  String curellm = '';
  Future getHaikuTextData(String productName) async {
    var poemData = await llmController.getPoem(productName, 1);
    setState(() {
      if (poemData != null)
        curellm = poemData;
      else {
        curellm = llmanswers[mkc]!;
      }
      cure_avail = 1;
    });
  }

  String pred1 = "";
  String pred2 = "";
  String pred3 = "";
  double confi1 = 0.0;
  double confi2 = 0.0;
  double confi3 = 0.0;
  String mkc = "";
  Interpreter? _interpreter;
  Interpreter? _interpreter2;
  String cure =
      "To cure warts and molescums, here are some treatment options:\n1. Topical Therapies: Apply Over-the-counter (OTC) products containing salicylic acid or other ingredients to the affected area until they shrink or disappear on their own\n.2. Prescription Creams or Gels: If OTC products are ineffective, your doctor may prescribe a topical medication that contains retinoids, antiseptics, or other ingredients\n.3. Can or Freeze Removal: Another common way to treat warts and moles is by using cannabis oil. Cannabis has anti-inflammatory properties that can help reduce the size of the wart or mole and improve its appearance. Some studies have shown that cannabis can effectively eliminate malignant and benign tumors, including those on the skin, especially warts caused by HPV infections.";
  var write = 0;
  List<String> labels = [
    'Acne / Rosacea',
    'Actinic Keratosis / Basal Cell Carcinoma',
    'Atopic Dermatitis',
    'Bullous Disease',
    'Cellulitis Impetigo (Bacterial Infections)',
    'Eczema',
    'Exanthems (Drug Eruptions)',
    'Hair Loss (Alopecia)',
    'Herpes HPV',
    'Disorders of Pigmentation',
    'Lupus ',
    'Melanoma (Skin Cancer)',
    'Nail Fungus',
    'Poison Ivy',
    'Psoriasis (Lichen Planus)',
    'Scabies Lyme',
    'Seborrheic Keratoses',
    'Systemic Disease',
    'Tinea Ringworm (Fungal Infections)',
    'Urticaria Hives',
    'Vascular Tumors',
    'Vasculitis',
    'Warts Molluscum'
  ];
  List<String> labels2 = [
    "Acne Papule",
    "Blackheads",
    "Fungal Acne",
    "Milia",
    "Normal",
    "Perioral Dermatitis",
    "Sun Spots",
    "Whiteheads"
  ];
  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    _interpreter = await Interpreter.fromAsset('quantizedF16.tflite');
  }

  Future<Map<String, double>> classifyImage(String imagePath) async {
    img.Image inputImage = img.decodeImage(File(imagePath).readAsBytesSync())!;
    inputImage = img.copyResize(inputImage, width: 224, height: 224);

    var input = Float32List(224 * 224 * 3);
    var pixelIndex = 0;
    for (var y = 0; y < 224; y++) {
      for (var x = 0; x < 224; x++) {
        var pixel = inputImage.getPixel(x, y);
        input[pixelIndex++] = (img.getRed(pixel)).toDouble();
        input[pixelIndex++] = (img.getGreen(pixel).toDouble());
        input[pixelIndex++] = (img.getBlue(pixel).toDouble());
      }
    }

    var output =
        List<List<double>>.generate(1, (index) => List<double>.filled(23, 0));
    _interpreter?.run(Uint8List.fromList(input.buffer.asUint8List()), output);

    Map<String, double> confidences = {};
    double temp = -2.0;
    String name = "";

    for (int i = 0; i < labels.length; i++) {
      if (temp < output[0][i]) {
        temp = output[0][i];
        name = labels[i];
      }
      confidences[labels[i]] = output[0][i];
    }
    print(name + " " + (temp * 100).toString());
    List<MapEntry<String, double>> sortedEntries = confidences.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    List<MapEntry<String, double>> top3Entries = sortedEntries.take(3).toList();

    Map<String, double> top3Confidences = Map.fromEntries(top3Entries);
    List<MapEntry<String, double>> entries = top3Confidences.entries.toList();
    pred1 = entries[0].key;
    confi1 = entries[0].value;
    pred2 = entries[1].key;
    confi2 = entries[1].value;
    pred3 = entries[2].key;
    confi3 = entries[2].value;
    mkc = name;
    return confidences;
  }

  final picker = ImagePicker();
  var _imageFile;
  Future getImage() async {
    HapticFeedback.heavyImpact();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    classifyImage(pickedFile!.path)
        .then((value) => getCures(pred1, pred2, pred3));
    Navigator.push(
        context,
        AnimateRoute(
            widget: Temp2(
          pred: pred1,
          pred2: pred2,
          pred3: pred3,
          confi1: confi1,
          confi2: confi2,
          confi3: confi3,
        )));
    // final classifier = ImageClassifier();

    // await classifier.initialize();
    // final recognitions = await classifier.recognizeImage(pickedFile!.path);
    // final top3Recognitions = recognitions.take(3); // Get the top 3 recognitions

    // for (final recognition in top3Recognitions) {
    //   print(
    //       'Label: ${recognition.name}, Confidence: ${recognition.confidence}');
    // }

    setState(() {
      // _imageFile = File(pickedFile!.path);
      write = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            text: 'Skin Analysis\n',
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
                                text: ' in 3 steps',
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
                            height: MediaQuery.of(context).size.height / 8,
                            child: Image(
                                image: AssetImage(
                              "assets/selfie-removed.png",
                            ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, left: 20),
                        child: Row(
                          children: [
                            Image(
                                width: 70,
                                height: 70,
                                image: AssetImage("assets/os1.png")),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "1. Upload Photo",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "As simple as that!.",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Text(
                                    "Upload photo in well lit room of skin issue",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: Row(
                          children: [
                            Image(
                                width: 70,
                                height: 70,
                                image: AssetImage("assets/os2.png")),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "2. Skin  Assessment",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    child: Text(
                                      "In matter of seconds, Skinwise will analyze skin conditons and provide detailed report ",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.exo2(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, left: 20),
                        child: Row(
                          children: [
                            Image(
                                width: 70,
                                height: 65,
                                image: AssetImage(
                                  "assets/os3.png",
                                )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3. Real-Time  Diagnosis",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.exo2(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.4,
                                  child: Text(
                                    "Interactive Diagnosis System which provides cure to analyzed skin conditions.",
                                    style: GoogleFonts.exo2(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 0.0),
                      //   child: Container(
                      //     //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //     height: MediaQuery.of(context).size.height / 15,
                      //     width: MediaQuery.of(context).size.width / 2.3,
                      //     margin: EdgeInsets.only(bottom: 5),
                      //     decoration: BoxDecoration(
                      //         color: Colors.green.shade200,
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: InkWell(
                      //       onTap: getImage,
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
                      Container(
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
                          onTapUp: () => {HapticFeedback.vibrate(), getImage()},
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
                                    "Start Analysis",
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
                      // NeoPopTiltedButton(
                      //     //isFloating: true,
                      //     decoration: const NeoPopTiltedButtonDecoration(
                      //       color: Colors.lightGreen,
                      //       plunkColor: Color(0xFF3F6915),
                      //       shadowColor: Colors.grey,
                      //       border: Border.fromBorderSide(
                      //         BorderSide(color: Color(0xFF8DD04A), width: 1),
                      //       ),
                      //     ),
                      // onTapUp: () =>
                      //     {HapticFeedback.vibrate(), getImage()},
                      // onTapDown: () => HapticFeedback.vibrate(),
                      //     child: Padding(
                      //       padding: const EdgeInsets.symmetric(
                      //         horizontal: 50.0,
                      //         vertical: 15,
                      //       ),
                      //       child:
                      // Text(
                      //         "Start Analysis",
                      //         style: GoogleFonts.exo2(
                      //           textStyle: TextStyle(
                      //             fontWeight: FontWeight.w600,
                      //             color: Colors.black,
                      //             fontSize: 16,
                      //           ),
                      //         ),
                      //       ),
                      //     )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
