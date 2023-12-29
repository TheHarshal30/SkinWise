// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: double.infinity),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/desc.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("Harshal Rudra",
                            style: GoogleFonts.exo2(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 18,
                            ))),
                      ),

                      //REMOVE THIS WHEN BACKEND INTEGRATED!!!
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text("harshal@help.me",
                            style: GoogleFonts.exo2(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade800,
                              fontSize: 16,
                            ))),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("CONTENT",
                              style: GoogleFonts.exo(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: 15,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.downloading,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Downloads",
                                  style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height / 20,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text("PREFERENCES",
                              style: GoogleFonts.exo(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                                fontSize: 15,
                              )),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.verified_user,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text("Name",
                                  style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Mahi",
                                style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                    fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.male,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text("Gender",
                                  style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("M",
                                style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                    fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text("Age",
                                  style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("34",
                                style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                    fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.healing,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text("User History",
                                  style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Diabeties",
                                style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                    fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              size: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text("Logout",
                                  style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade900,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("",
                                style: GoogleFonts.exo(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                    fontSize: 12)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 18,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Engineered with ❤️",
                        style: GoogleFonts.exo(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900,
                          fontSize: 15,
                        )),
                    Text("An Inside Labs Creation",
                        style: GoogleFonts.exo(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                          fontSize: 15,
                        )),
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
