import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'package:tflite_flutter/tflite_flutter.dart';

class ImageClassifier {
  static const PROBABILITY_MEAN = 0;
  static const PROBABILITY_STD = 255.0;
  static const IMAGE_STD = 1.0;
  static const IMAGE_MEAN = 0.0;
  static const MAX_SIZE = 8;

  final List<String> labels = [
    "Acne Papule",
    "Blackheads",
    "Fungal Acne",
    "Milia",
    "Normal",
    "Perioral Dermatitis",
    "Sun Spots",
    "Whiteheads"
  ];

  ImageClassifier();

  late Interpreter interpreter;

  Future<void> initialize() async {
    interpreter = await Interpreter.fromAsset("condition_model.tflite");
  }

  Future<List<Recognition>> recognizeImage(String imagePath) async {
    final image = img
        .decodeImage(Uint8List.fromList(await File(imagePath).readAsBytes()))!;

    final inputImage = loadAndPreprocessImage(image);
    final inputShape = interpreter.getInputTensor(0).shape;
    final outputShape = interpreter.getOutputTensor(0).shape;
    interpreter.allocateTensors();

    final inputTensor = interpreter.getInputTensor(0);
    inputTensor.data = inputImage.buffer.asUint8List();

    interpreter.invoke();

    final outputTensor = interpreter.getOutputTensor(0);
    final outputData = outputTensor.data;
    final recognitions = <Recognition>[];

    for (var i = 0; i < labels.length; i++) {
      final confidence = outputData[i] / PROBABILITY_STD;
      final label = labels[i];
      recognitions.add(Recognition(label, confidence));
    }

    recognitions.sort((a, b) => b.confidence.compareTo(a.confidence));
    return recognitions.take(MAX_SIZE).toList();
  }

  Uint8List loadAndPreprocessImage(img.Image image) {
    final inputWidth = interpreter.getInputTensor(0).shape[1];
    final inputHeight = interpreter.getInputTensor(0).shape[2];
    final resizedImage =
        img.copyResize(image, width: inputWidth, height: inputHeight);
    final inputImageData = Uint8List(1 * inputWidth * inputHeight * 3);

    for (var x = 0; x < inputWidth; x++) {
      for (var y = 0; y < inputHeight; y++) {
        final pixel = resizedImage.getPixel(x, y);
        inputImageData[(y * inputWidth + x) * 3 + 0] =
            (img.getRed(pixel) - IMAGE_MEAN) ~/ IMAGE_STD;
        inputImageData[(y * inputWidth + x) * 3 + 1] =
            (img.getGreen(pixel) - IMAGE_MEAN) ~/ IMAGE_STD;
        inputImageData[(y * inputWidth + x) * 3 + 2] =
            (img.getBlue(pixel) - IMAGE_MEAN) ~/ IMAGE_STD;
      }
    }

    return inputImageData;
  }
}

class Recognition {
  final String name;
  final double confidence;

  Recognition(this.name, this.confidence);

  @override
  String toString() {
    return 'Recognition{name: $name, confidence: $confidence}';
  }
}
