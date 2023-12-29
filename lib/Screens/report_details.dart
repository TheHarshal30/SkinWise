// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportDetailsPage extends StatefulWidget {
  const ReportDetailsPage({super.key});

  @override
  State<ReportDetailsPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage> {
  Map<String, double> labels = {
    'Acne / Rosacea': 0.51,
    'Actinic Keratosis / Basal Cell Carcinoma': 1.03,
    'Atopic Dermatitis': 15.2,
    'Bullous Disease': 0.15,
    'Cellulitis Impetigo (Bacterial Infections)': 0.24,
    'Eczema': 2.34,
    'Exanthems (Drug Eruptions)': 0.08,
    'Hair Loss (Alopecia)': 0.02,
    'Herpes HPV': 0.18,
    'Disorders of Pigmentation': 0.13,
    'Lupus ': 0.09,
    'Melanoma (Skin Cancer)': 0.18,
    'Nail Fungus': 0.06,
    'Poison Ivy': 0.11,
    'Psoriasis (Lichen Planus)': 1.37,
    'Scabies Lyme': 0.11,
    'Seborrheic Keratoses': 2.02,
    'Systemic Disease': 0.22,
    'Tinea Ringworm (Fungal Infections)': 0.35,
    'Urticaria Hives': 0.01,
    'Vascular Tumors': 0.11,
    'Vasculitis': 0.27,
    'Warts Molluscum': 75.22
  };
  String cure =
      "To cure warts and molescums, here are some treatment options:\n1. Topical Therapies: Apply Over-the-counter (OTC) products containing salicylic acid or other ingredients to the affected area until they shrink or disappear on their own\n2. Prescription Creams or Gels: If OTC products are ineffective, your doctor may prescribe a topical medication that contains retinoids, antiseptics, or other ingredients\n3. Can or Freeze Removal: Another common way to treat warts and moles is by using cannabis oil. Cannabis has anti-inflammatory properties that can help reduce the size of the wart or mole and improve its appearance. Some studies have shown that cannabis can effectively eliminate malignant and benign tumors, including those on the skin, especially warts caused by HPV infections.";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.blueGrey.shade800.withRed(10),
              ),
              Center(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      "Osiris generated analysis",
                      style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  Text(
                    "Report Details",
                    style: GoogleFonts.lora(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width / 4,
                          margin: EdgeInsets.only(
                              bottom: 5, left: 5, right: 5, top: 5),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 1.0,
                                ),
                              ],
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/download.jpg"),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Predicted",
                    style: GoogleFonts.exo2(
                      textStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    "Warts Molluscum",
                    style: GoogleFonts.exo2(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Confidences:",
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  // Text(
                  //   labels.keys
                  //       .map((key) => "${key}: ${labels[key]}%")
                  //       .join("\n"),
                  //   style: GoogleFonts.exo2(
                  //     textStyle: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 15,
                  //         fontWeight: FontWeight.w500),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.1,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: labels.length,
                          itemBuilder: (BuildContext context, int idx) {
                            String key = labels.keys.elementAt(idx);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 5),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.5,
                                      child: Text(
                                        key,
                                        style: GoogleFonts.exo2(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      labels[key].toString() + " %",
                                      style: GoogleFonts.exo2(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red.shade300,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Suggested Treatment: ",
                        style: GoogleFonts.exo2(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Text(
                      cure,
                      style: GoogleFonts.exo2(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ]),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 10),
                  child: Icon(
                    Icons.downloading,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
