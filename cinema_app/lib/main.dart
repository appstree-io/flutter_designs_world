import 'package:flutter/material.dart';
import 'detailPage.dart';
import 'route.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cinema Ticket Booking",
      theme: new ThemeData(
          primaryColor: Colors.deepPurple[300],
          scaffoldBackgroundColor: Colors.deepPurple[300]),
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String detail =
      "When Robert Londen wakes up in an Italian hospital with amnesia, he teams up with Dr. Sienna Brooks, and together they must race.";

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: new Text("Inferno"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -200,
            left: -140,
            child: new Container(
              height: queryData.size.height * 0.9,
              width: queryData.size.width * 0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple[400]
              ),
            ),
          ),

          Positioned(
            top: 100,
            left: 40,
            child: new Container(
              height: queryData.size.height * 1.3,
              width: queryData.size.width * 1.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[400]
              ),
            ),
          ),

          Positioned(
            top: 100,
            left: 40,
            child: new Container(
              height: queryData.size.height * 0.3,
              width: queryData.size.width * 0.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[400]
              ),
            ),
          ),

          Positioned(
            top: -1000,
            left: 100,
            child: new Container(
              height: queryData.size.height * 1.9,
              width: queryData.size.width * 2.2,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple[400]
              ),
            ),
          ),
          Container(
            height: queryData.size.height,
            width: queryData.size.width,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: queryData.size.height * 0.40,
                  width: queryData.size.width * .90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: new Card(
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Image.asset(
                                "assets/inferno.jpeg",
                                fit: BoxFit.cover,
                                width: queryData.size.width * 0.9,
                                height: queryData.size.height * 0.18,
                              ),
                              Positioned(
                                bottom: 40,
                                left: 10,
                                child: new Row(
                                  children: <Widget>[
                                    new Text(
                                      "Director: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    new Text(
                                      "Ron Howard",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 16,
                                left: 10,
                                child: new Row(
                                  children: <Widget>[
                                    new Text(
                                      "Writers: ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    new Text(
                                      "Dan Brown, David Koepp",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: queryData.size.height * .04,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text(
                                  "Action , Adventure, Crime",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star,
                                        size: 18, color: Colors.yellow[700]),
                                    Icon(Icons.star,
                                        size: 18, color: Colors.yellow[700]),
                                    Icon(Icons.star,
                                        size: 18, color: Colors.yellow[700]),
                                    Icon(Icons.star,
                                        size: 18, color: Colors.grey[400]),
                                    Icon(Icons.star,
                                        size: 18, color: Colors.grey[400]),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: queryData.size.height * 0.04,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: new Text(
                              detail,
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: queryData.size.height * 0.40,
                  width: queryData.size.width * .90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: ClipPath(
                      child: GestureDetector(
                        child: new Card(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: queryData.size.height * 0.15,
                                  padding: EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "SALON",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "09",
                                              style: TextStyle(fontSize: 24.0),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: VerticalDivider(),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "ROW",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "11",
                                              style: TextStyle(fontSize: 24.0),
                                            ),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: VerticalDivider(),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "SEAT",
                                            style: TextStyle(fontSize: 14.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "24",
                                              style: TextStyle(fontSize: 24.0),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.date_range),
                                                Text("  DATE")
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("26.10.2018"),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.timer),
                                                Text("  Time")
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("11:30 AM"),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: <Widget>[
                                                Icon(Icons.monetization_on),
                                                Text("  PRICE")
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("\$" + "14.99"),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Container(
//                          width: queryData.size.width * 0.90,
                                  height: queryData.size.height * .105,
                                  color: Colors.grey[100],
                                  child: Center(
                                    child: Image.asset(
                                      "assets/barCode.jpg",
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
//                            MyCustomRoute(builder: (context) => DetailPage()),
                          SlideRightRoute(widget: DetailPage()),
                          );
                        },
                      ),
                      clipper: Clipper(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 100);

    var firstControlPoint = Offset(10, size.height - 100);

    path.arcTo(
        Rect.fromCircle(
            center: Offset(firstControlPoint.dx, firstControlPoint.dy), radius: 20), 10, 5, false);

    path.lineTo(0.0, size.height);
    path.lineTo(size.height, size.width + 400);
    path.arcTo(
        Rect.fromCircle(
            center: Offset(size.width - 10, size.height - 100), radius: 20), 26, 5, false);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

