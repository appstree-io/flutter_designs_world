import 'package:flutter/material.dart';
import 'seats.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

TextStyle styleDate = TextStyle(color: Colors.grey, fontSize: 18.0);
TextStyle tStyleDate = new TextStyle(color: Colors.black, fontSize: 18.0);

Widget _tabCreator(int date, String day) {
  return Container(
    width: 50,
//margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
//    padding: const EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(date.toString(), style: styleDate),
        SizedBox(
          height: 4,
        ),
        Text(day, style: styleDate)
      ],
    ),
  );
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  List<Tab> myTabs = [
    Tab(child: _tabCreator(19, "Wed")),
    Tab(child: _tabCreator(20, "Thurs")),
    Tab(child: _tabCreator(21, "Fri")),
    Tab(child: _tabCreator(22, "Sat")),
    Tab(child: _tabCreator(23, "Sun")),
    Tab(child: _tabCreator(24, "Mon")),
    Tab(child: _tabCreator(25, "Tues")),
  ];

  List<seat> list1 = new List<seat>();
  List<seat> list2 = new List<seat>();
  List<seat> list3 = new List<seat>();
  List<String> selectedList = new List<String>();

  _checkList(String id) {
    for (int i = 0; i < selectedList.length; i++) {
      if (id == selectedList[i]) {
        return true;
      }
    }
    return false;
  }

  TabController _tabController;

  Widget _screenBuild(String date, String time, String price) {
    return Container(
//      height: 150,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [
            0.0,
            0.04
          ],
              colors: [
            Colors.grey[300],
            Colors.grey[50],
//                      Colors.grey[300],
//                      Colors.grey[400],
          ])),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "DATE:",
                      style: tStyleDate,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      date,
                      style: tStyleDate,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "TIME:",
                      style: tStyleDate,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      time,
                      style: tStyleDate,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Price:",
                      style: tStyleDate,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$ " + price,
                      style: tStyleDate,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 118,
                height: 350,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list1.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          size: 30,
                          color: _checkList(list1[index].getId())
                              ? Colors.deepPurple[300]
                              : Colors.grey,
//                          color: list1[index].getStatus() ? Colors.black54 : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            if (selectedList.contains(list1[index].getId())) {
                              print("Already Added");
                            } else {
                              selectedList.add(list1[index].getId());
                            }
                          });
                        },
                      );
                    }),
              ),
              Container(
                width: 118,
                height: 350,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list2.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          size: 30,
                          color: _checkList(list2[index].getId())
                              ? Colors.deepPurple[300]
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            if (selectedList.contains(list2[index].getId())) {
                              print("Already Added");
                            } else {
                              selectedList.add(list2[index].getId());
                            }
                          });
                        },
                      );
                    }),
              ),
              Container(
                width: 118,
                height: 350,
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: list3.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return IconButton(
                        icon: Icon(
                          Icons.event_seat,
                          size: 30,
                          color: _checkList(list3[index].getId())
                              ? Colors.deepPurple[300]
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            if (selectedList.contains(list3[index].getId())) {
                              print("Already Added");
                            } else {
                              selectedList.add(list3[index].getId());
                            }
                          });
                        },
                      );
                    }),
              ),
            ],
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 90,
            width: 390,
            child: ClipPath(
              clipper: tvClipper(),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        stops: [
                      0.0,
                      0.4,
                      0.8
                    ],
                        colors: [
                      Colors.grey[50],
                      Colors.grey[100],
                      Colors.grey[200],
//                      Colors.grey[300],
//                      Colors.grey[400],
                    ])),
                height: 90,
                width: 370,
              ),
            ),
          ),
          Container(
            height: 5,
            width: 310,
            decoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: myTabs.length, initialIndex: 0, vsync: this);
    for (int i = 0; i < 26; i++) {
      list1.add(seat("A" + i.toString(), false));
    }
    for (int i = 0; i < 24; i++) {
      list2.add(seat("B" + i.toString(), false));
    }
    for (int i = 0; i < 26; i++) {
      list3.add(seat("C" + i.toString(), false));
    }
    selectedList.add("");
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: queryData.size.height,
            width: queryData.size.width,
            color: Colors.deepPurple[300],
            child: SafeArea(
                child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Column(
                      children: <Widget>[
                        Text(
                          "INFERNO",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                        Text(
                          "Japan, Turkey, Hungary, USA 2016",
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14.0),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                      color: Colors.white,
                      height: queryData.size.height * 0.80,
                      width: queryData.size.width * 0.95,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100,
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: true,
                              indicatorColor: Colors.deepPurple,
                              tabs: myTabs,
                            ),
                          ),
                          Expanded(
//                        width: queryData.size.width * 0.7,
                            child: TabBarView(
                              controller: _tabController,
                              children: <Widget>[
                                _screenBuild("19", "11 30am", "14.90"),
                                _screenBuild("20", "11 30am", "14.90"),
                                _screenBuild("21", "11 00am", "14.90"),
                                _screenBuild("22", "11 00am", "14.90"),
                                _screenBuild("23", "11 00am", "14.90"),
                                _screenBuild("24", "11 30am", "14.90"),
                                _screenBuild("25", "11 30am", "14.90")
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            )),
          ),
          Positioned(
            bottom: 42,
            left: 70,
            child: GestureDetector(
              child: new Container(
//                  width: queryData.size.width / 2,
                  padding:
                      EdgeInsets.only(top: 20, bottom: 20, left: 90, right: 90),
//                color: Colors.purple[900],
                  child: new Text(
                    "Pay \$ 14.99",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[900],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(50.0))),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}

class tvClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height * 5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
