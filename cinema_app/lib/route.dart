//import 'package:flutter/material.dart';
//
//class MyCustomRoute<T> extends MaterialPageRoute<T> {
//  MyCustomRoute({ WidgetBuilder builder, RouteSettings settings })
//      : super(builder: builder, settings: settings);
//
//  @override
//  Widget buildTransitions(BuildContext context,
//      Animation<double> animation,
//      Animation<double> secondaryAnimation,
//      Widget child) {
//    if (settings.isInitialRoute)
//      return child;
//    // Fades between routes. (If you don't want any animation,
//    // just return child.)
//    return new FadeTransition(opacity: animation, child: child);
//  }
//}


import 'package:flutter/material.dart';
class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  );
}