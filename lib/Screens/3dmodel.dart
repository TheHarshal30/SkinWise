// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpkwk/Screens/loading.dart';
import 'package:kpkwk/logic/llmcontroller.dart';
import 'package:kpkwk/logic/localllm.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class ModelPage extends StatefulWidget {
  const ModelPage({super.key});

  @override
  State<ModelPage> createState() => _ModelPageState();
}

class _ModelPageState extends State<ModelPage> {
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
    mkc = name;
    return confidences;
  }

  final picker = ImagePicker();
  var _imageFile;
  Future getImage() async {
    HapticFeedback.heavyImpact();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    classifyImage(pickedFile!.path);
    // Navigator.push(
    //     context,
    //     AnimateRoute(
    //         widget: LoadingPage(
    //       pred: mkc,
    //     )));
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

      getHaikuTextData(mkc);
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
                debugLogging: false,
                backgroundColor: Colors.transparent,
                src: 'assets/body.glb',
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
