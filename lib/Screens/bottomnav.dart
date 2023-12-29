// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kpkwk/Screens/home.dart';
import 'package:kpkwk/Screens/profile.dart';
import 'package:kpkwk/Screens/report.dart';
import 'package:kpkwk/Screens/routines.dart';
import 'package:kpkwk/Screens/upload.dart';
import 'package:kpkwk/logic/routing_animation.dart';

class BottomNavBar extends StatefulWidget {
  final idx;
  const BottomNavBar({required this.idx, super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int curridx = widget.idx;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            IndexedStack(index: 0, children: []),
            buildContent(curridx, context),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20.0, left: 50, right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height / 14,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: BottomNavigationBar(
                        type: BottomNavigationBarType.shifting,
                        elevation: 0,
                        backgroundColor: Colors.black,
                        selectedItemColor: Colors.green[600],
                        unselectedItemColor: Colors.blueGrey,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        currentIndex: curridx,
                        onTap: (index) {
                          // setState(() {
                          //   curridx = index;
                          // });

                          temp(index);
                          HapticFeedback.lightImpact();
                        },
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(
                                FontAwesomeIcons.house,
                                size: 20,
                              ),
                              label: "Home"),
                          BottomNavigationBarItem(
                              icon: Icon(
                                FontAwesomeIcons.camera,
                                size: 20,
                              ),
                              label: "upload"),
                          BottomNavigationBarItem(
                              icon: Icon(
                                FontAwesomeIcons.fileInvoice,
                                size: 20,
                              ),
                              label: "reports"),
                          BottomNavigationBarItem(
                              icon: Icon(
                                FontAwesomeIcons.weightScale,
                                size: 20,
                              ),
                              label: "profile"),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }

  Widget buildContent(int idx, BuildContext context) {
    switch (idx) {
      case 0:
        return HomePage();
      case 1:
        return UploadPage();
      case 2:
        return ReportPage();
      case 3:
        return RoutinesPage();
      default:
        return HomePage();
    }
  }

  temp(int idx) {
    switch (idx) {
      case 0:
        return HomePage();
      case 1:
        return Navigator.pushNamed(context, "/upload");
      case 2:
        return Navigator.pushNamed(context, "/report");
      case 3:
        return Navigator.pushNamed(context, "/routines");
      default:
        return HomePage();
    }
  }
}
