import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/utils/rounded_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title  = "fraz";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                ClipPath(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 125,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.orange[500],
                              Colors.orange[500],
                              Colors.orange[600],
                              Colors.orange[800],
                              Colors.orange[800]
                            ])),
                      ),
                      Positioned(
                          top: -80,
                          left: -80,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.36,
                            width: MediaQuery.of(context).size.height * 0.36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    (MediaQuery.of(context).size.height *
                                            0.36) /
                                        2),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepOrange[700],
                                      Colors.deepOrange[700],
                                      Colors.deepOrange[400],
                                      Colors.deepOrange[300],
                                      Colors.deepOrange[300]
                                    ])),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 125,
                          width: MediaQuery.of(context).size.width,

//                        child: CustomPaint(
//                          painter: _ArcPainter(),
//                        ),
                        ),
                      )
                    ],
                  ),
                  clipper: RoundedClipper(30),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                _buildCategoriesList(context),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[Icon(Icons.menu), Icon(Icons.shopping_cart)],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 80, left: 35, right: 35),
              height: 50,
              width: double.infinity,
              child: Card(
                elevation: 3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey[350],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Search product",
                      style: TextStyle(color: Colors.grey[350]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Color> colorsList = [
    Colors.orange,
    Colors.red,
    Colors.pink,
    Colors.indigo,
    Colors.greenAccent
  ];

  @override
  Widget _buildCategoriesList(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 12, right: 20),
        height: 110.0,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 110,
              delegate: SliverChildBuilderDelegate(
                  (context, index) => BuildSingleOffersItem(context, index),
                  childCount: 5),
            ),
          ],
        ));
  }

  @override
  Widget BuildSingleOffersItem(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(index != 0 ? 5 : 0, 0, index != 4 ? 5 : 0, 5),
      child: GestureDetector(
        onTap: () {
          print("Tapped");
        },
        child:
//        Column(
//          children: <Widget>[
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey[300], width: 0.5)),
                color: colorsList?.elementAt(index),
                child: Row(
//              alignment: Alignment.centerLeft,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.purple[300]),
                    ),
                  ],
                )),
//          ],
//        ),
      ),
    );
  }
}

//class _ArcPainter extends CustomPainter {
//  _ArcPainter();
//
//  @override
//  bool shouldRepaint(_ArcPainter oldDelegate) {
//    return true;
//  }
//
//  double AVATAR_RADIUS = 160 * 0.28;
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = new Paint()
//      ..style = PaintingStyle.fill
//      ..isAntiAlias = true
//      ..color = Colors.purple[700];
//
//    Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);
//
//    Offset topLeft = Offset(0, 0);
//    Offset bottomLeft = Offset(0, size.height * 0.25);
//    Offset topRight = Offset(size.width, 0);
//    Offset bottomRight = Offset(size.width, size.height * 0.5);
//
//    Offset leftCurveControlPoint = Offset(circleCenter.dx * 0.5, size.height - AVATAR_RADIUS * 1.5);
//    Offset rightCurveControlPoint = Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);
//
//    final arcStartAngle = 200 / 180 * pi;
//    final avatarLeftPointX = circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
//    final avatarLeftPointY = circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
//    Offset avatarLeftPoint = Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc
//
//    final arcEndAngle = -5 / 180 * pi;
//    final avatarRightPointX = circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
//    final avatarRightPointY = circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
//    Offset avatarRightPoint = Offset(avatarRightPointX, avatarRightPointY); // the right point of the arc
//
//    Path path = Path()
//      ..moveTo(topLeft.dx, topLeft.dy) // this move isn't required since the start point is (0,0)
//      ..lineTo(bottomLeft.dx, bottomLeft.dy)
//      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy, avatarLeftPoint.dx, avatarLeftPoint.dy)
//
//      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy, bottomRight.dx, bottomRight.dy)
//      ..lineTo(topRight.dx, topRight.dy)
//      ..close();
//
//    canvas.drawPath(path, paint);
//  }
//}
