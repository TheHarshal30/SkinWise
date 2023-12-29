import 'package:flutter/material.dart';

class AnimateRoute extends PageRouteBuilder {
  final Widget widget;
  AnimateRoute({required this.widget})
      : super(
          // transitionDuration: Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeIn;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) {
            return widget;
          },
        );
}

// class CustomSlideTransition extends PageRouteBuilder {
//   final Widget page;
//   final Duration duration;

//   CustomSlideTransition({
//     required this.page,
//     this.duration = const Duration(milliseconds: 300),
//   }) : super(
//           transitionDuration: duration,
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) {
//             return page;
//           },
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) {
//             const begin = Offset(1.0, 0.0);
//             const end = Offset.zero;
//             const curve = Curves.easeInOut;

//             var slideTransition =
//                 Tween(begin: begin, end: end).animate(CurvedAnimation(
//               parent: animation,
//               curve: Interval(0.0, 1.0, curve: curve),
//             ));

//             return SlideTransition(
//               position: slideTransition,
//               child: child,
//             );
//           },
//         );
// }
