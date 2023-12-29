// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kpkwk/Screens/bottomnav.dart';
import 'package:kpkwk/Screens/home.dart';
import 'package:kpkwk/Screens/report.dart';
import 'package:kpkwk/Screens/routines.dart';
import 'package:kpkwk/Screens/upload.dart';
import 'package:kpkwk/logic/routing_animation.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BottomNavBar(
            idx: 0,
          ),
        );
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/upload':
        return AnimateRoute(widget: UploadPage());
      case '/report':
        return AnimateRoute(widget: ReportPage());
      case '/routines':
        return AnimateRoute(widget: RoutinesPage());

      default:
        return null;
    }
  }
}
