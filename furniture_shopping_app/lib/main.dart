import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furniture_shopping_app/utils/rounded_clipper.dart';

import 'data_model/single_category_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:furniture_shopping_app/activities/filters_screen.dart';

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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: CustomPaint(
                              painter: _ArcPainter(),
                            ),
                          ),
                        )
                      ],
                    ),
                    clipper: RoundedClipper(30),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
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
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        "Spring Bestsellers",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16),
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  _buildBestSellersItemsUsingCarousel(),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "New Product",
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
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                    width: double.infinity,
                    height: 150,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 20,
                        ),
                        Container(
                          height: 130,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 20),
                          child: Card(
                            color: Colors.white,
                            elevation: 2.5,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  top: 12, left: 125, right: 10, bottom: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Alinium Chair",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Buy products related to lazy boy chair products and see what customers",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400]),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "\$870",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[400]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.grey[200],
                          height: 150,
                          width: 100,
                          margin: EdgeInsets.only(left: 15, bottom: 10),
                          child: Image.asset(
                            "assets/10.png",
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.menu),
                    Stack(
                      children: <Widget>[
                        Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle),
                            child: Icon(Icons.shopping_cart)),
                        Positioned(
                          left: 18,
                          child: Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red
                            ),
                            child: Center(child: Text("2", style: TextStyle(color: Colors.white, fontSize: 12), )),
                          ),
                        )
                      ],
                    )
                  ],
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
      ),
    );
  }

  List<SingleCategoryItem> items = [
    SingleCategoryItem(
      "assets/5.png",
      "Accent Chairs",
      "${1500} items",
      Colors.amber[100],
    ),
    SingleCategoryItem(
      "assets/1.png",
      "Living Room Furniture",
      "${742} items",
      Colors.pink[100],
    ),
    SingleCategoryItem(
      "assets/3.png",
      "Unfinished Furniture",
      "${53} items",
      Colors.lightGreen[100],
    ),
    SingleCategoryItem(
      "assets/4.png",
      "Office Furniture",
      "${35} items",
      Colors.cyan[100],
    ),
    SingleCategoryItem("assets/1.png", "Bed Room Furniture", "${40} items",
        Colors.greenAccent[100]),
  ];

  @override
  Widget _buildCategoriesList(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, top: 12, right: 20),
        height: 175.0,
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 125,
              delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildSingleCategoryItem(context, index),
                  childCount: 5),
            ),
          ],
        ));
  }

  @override
  Widget _buildSingleCategoryItem(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          margin:
              EdgeInsets.fromLTRB(index != 0 ? 5 : 0, 0, index != 4 ? 5 : 0, 5),
          child: GestureDetector(
            onTap: () {
              print("Tapped");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FiltersScreen()));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey[300], width: 0.5)),
              color: items?.elementAt(index)?.color,
              child: Container(
                  height: 110,
                  child: Center(
                    child: Image.asset(
                      items?.elementAt(index)?.imagePath,
                      height: 75,
                      width: 75,
                    ),
                  )),
            ),
          ),
        ),
        _buildSingleItemName(context, index),
      ],
    );
  }

  @override
  Widget _buildSingleItemName(BuildContext context, int index) {
    return Expanded(
      child: Container(
        margin:
            EdgeInsets.fromLTRB(index != 0 ? 5 : 5, 0, index != 4 ? 5 : 5, 0),
        padding: EdgeInsets.only(left: index != 0 ? 5 : 0, right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              items?.elementAt(index)?.itemName,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              items?.elementAt(index)?.itemQuantity,
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  var _selectedIndex = 0;
  List<Widget> images = [
    Image.asset(
      "assets/6.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
    Image.asset(
      "assets/7.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
    Image.asset(
      "assets/8.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
    Image.asset(
      "assets/9.jpg",
      fit: BoxFit.cover,
      width: double.infinity,
    ),
  ];

  @override
  Widget _buildBestSellersItemsUsingCarousel() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 180,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: Stack(
          children: <Widget>[
            CarouselSlider(
              items: images,
              height: 180,
              aspectRatio: 16 / 9,
              viewportFraction: 1.0,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (int index) {
                print(index);
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  margin: EdgeInsets.only(left: 20, top: 150),
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    slivers: <Widget>[
                      SliverFixedExtentList(
                        itemExtent: 13,
                        delegate: SliverChildBuilderDelegate(
                            (c, index) => _buildSelectors(c, index),
                            childCount: images?.length),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectors(BuildContext c, int index) {
    return Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _selectedIndex == index ? Colors.red : Colors.blueGrey[100]));
  }
}

class _ArcPainter extends CustomPainter {
  _ArcPainter();

  @override
  bool shouldRepaint(_ArcPainter oldDelegate) {
    return true;
  }

  double AVATAR_RADIUS = 160 * 0.35;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.orangeAccent[400];

    Offset circleCenter = Offset(size.width / 2, size.height - AVATAR_RADIUS);

    Offset topLeft = Offset(0, 0);
    Offset bottomLeft = Offset(0, size.height * 0.25);
    Offset topRight = Offset(size.width, 0);
    Offset bottomRight = Offset(size.width, size.height * 0.25);

    Offset leftCurveControlPoint =
        Offset(circleCenter.dx * 0.35, size.height - AVATAR_RADIUS * 1.5);
    Offset rightCurveControlPoint =
        Offset(circleCenter.dx * 1.6, size.height - AVATAR_RADIUS);

    final arcStartAngle = 200 / 180 * pi;
    final avatarLeftPointX =
        circleCenter.dx + AVATAR_RADIUS * cos(arcStartAngle);
    final avatarLeftPointY =
        circleCenter.dy + AVATAR_RADIUS * sin(arcStartAngle);
    Offset avatarLeftPoint =
        Offset(avatarLeftPointX, avatarLeftPointY); // the left point of the arc

    final arcEndAngle = -5 / 180 * pi;
    final avatarRightPointX =
        circleCenter.dx + AVATAR_RADIUS * cos(arcEndAngle);
    final avatarRightPointY =
        circleCenter.dy + AVATAR_RADIUS * sin(arcEndAngle);
    Offset avatarRightPoint = Offset(
        avatarRightPointX, avatarRightPointY); // the right point of the arc

    Path path = Path()
      ..moveTo(topLeft.dx,
          topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..quadraticBezierTo(leftCurveControlPoint.dx, leftCurveControlPoint.dy,
          avatarLeftPoint.dx, avatarLeftPoint.dy)
      ..quadraticBezierTo(rightCurveControlPoint.dx, rightCurveControlPoint.dy,
          bottomRight.dx, bottomRight.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }
}
