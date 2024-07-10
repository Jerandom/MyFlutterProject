import 'package:flutter/material.dart';

class SlidePageWidget extends StatefulWidget {
  const SlidePageWidget({super.key});

  @override
  State<SlidePageWidget> createState() => _SlidePageWidgetState();
}

class _SlidePageWidgetState extends State<SlidePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Page"),
      ),
      body: Center(
        child: Text("This is the Menu Page"),
      ),
    );
  }
}


// for animation for sliding window
class SlidePageRoute extends PageRouteBuilder {
  final Widget widget;
  SlidePageRoute({required this.widget}) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return widget;
    },
    transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      const begin = Offset(-1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
