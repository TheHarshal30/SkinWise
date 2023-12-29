// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpkwk/Screens/loading.dart';
import 'package:kpkwk/Screens/loading2.dart';
import 'package:kpkwk/logic/llmcontroller.dart';
import 'package:kpkwk/logic/localllm.dart';
import 'package:kpkwk/logic/model.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class ModelPage2 extends StatefulWidget {
  const ModelPage2({super.key});

  @override
  State<ModelPage2> createState() => _ModelPage2State();
}

class _ModelPage2State extends State<ModelPage2> {
  var cure_avail = 0;
  var multi = 0;
  List<String> mkc = [];
  final LlmController llmController = LlmController();
  String curellm = '';
  String curellm1 = '';
  String curellm2 = '';
  temp(String productName) {
    curellm = "Routine for ${mkc[0]}" "\n" +
        llmroutines[mkc[0]]! +
        "Routine for ${mkc[1]}" "\n" +
        llmroutines[mkc[1]]! +
        "Routine for ${mkc[2]}" "\n" +
        llmroutines[mkc[2]]!;
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        cure_avail = 1;
      });
    });
  }

  var write = 0;
  final picker = ImagePicker();
  Future getImage() async {
    HapticFeedback.heavyImpact();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    final classifier = ImageClassifier();

    await classifier.initialize();
    final recognitions = await classifier.recognizeImage(pickedFile!.path);
    final top3Recognitions = recognitions.take(3); // Get the top 3 recognitions

    for (final recognition in top3Recognitions) {
      mkc.add(recognition.name);
      print(
          'Label: ${recognition.name}, Confidence: ${recognition.confidence}');
    }
    Navigator.push(
        context,
        AnimateRoute(
            widget: LoadingPage2(
          mkc: mkc,
        )));
    setState(() {
      // _imageFile = File(pickedFile!.path);
      // classifyImage(pickedFile!.path);
      temp(mkc[0] + " " + mkc[1] + " " + mkc[2]);
      write = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ModelViewer(
                backgroundColor: Colors.transparent,
                src: 'assets/lara.glb',
                alt: 'A 3D model of Skin',
                autoRotate: true,
                disableZoom: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                    "Zoom and place the circle on the desired skin area \n\n\n (You can skip this step)",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.exo2(
                      textStyle: TextStyle(
                        color: Colors.green.shade900,
                      ),
                    )),
              ),
            ),
            GestureDetector(
              onTap: getImage,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade800
                            .withRed(10)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 20,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white, size: 18),
                        Text("  Start Now",
                            style: GoogleFonts.exo2(
                              textStyle: TextStyle(
                                color: Colors.white,
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
    );
  }
}
