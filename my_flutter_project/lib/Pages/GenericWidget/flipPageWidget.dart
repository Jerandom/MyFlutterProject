import 'package:flutter/material.dart';

class FlipPageRoute extends PageRouteBuilder {
  final Widget widget;

  FlipPageRoute({required this.widget})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            // Flip transition: rotating along the Y axis
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: curve));

            return AnimatedBuilder(
              animation: animation,
              child: child,
              builder: (context, child) {
                double value = tween.evaluate(animation);
                const perspective = 0.0015;
                double rotation = value * 3.14; // Rotate in radians (pi)

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, perspective) // Perspective effect
                    ..rotateY(rotation),
                  child: child,
                );
              },
            );
          },
        );
}
