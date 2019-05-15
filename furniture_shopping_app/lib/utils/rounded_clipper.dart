import 'dart:ui';

import 'package:flutter/material.dart';

class RoundedClipper extends CustomClipper<Path> {
  var differenceInHeights = 0;

  RoundedClipper(int differenceInHeights) {
    this.differenceInHeights = differenceInHeights;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - differenceInHeights);

    var firstControlPoint = new Offset(size.width / 2, size.height + 10);
    var firstEndPoint =
    new Offset(size.width, size.height - differenceInHeights);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width, size.height - differenceInHeights);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}