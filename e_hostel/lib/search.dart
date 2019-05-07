import 'package:flutter/material.dart';
import 'model/place.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:cupertino_range_slider/cupertino_range_slider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  MediaQueryData queryData;
  List<Place> listPlaces = new List<Place>();
  List<Place> listBuilding = new List<Place>();
  PanelController _controller = new PanelController();
  List<String> buttons = new List();
  double _minValue, _maxValue;

  @override
  void initState() {
    super.initState();
    listPlaces.add(Place("assets/places/1.jpeg", "Cottage", "65 Lac",
        "38HK-2400sqft-2bath", null));
    listPlaces.add(Place("assets/places/1.jpeg", "Cottage", "65 Lac",
        "38HK-2400sqft-2bath", null));
    listPlaces.add(Place("assets/places/1.jpeg", "Cottage", "65 Lac",
        "38HK-2400sqft-2bath", null));

    listBuilding.add(Place("assets/places/building1.jpg", "Hostel", "65 Lac",
        "38HK-2400sqft-2bath", "San Halen, CA"));
    listBuilding.add(Place("assets/places/building1.jpg", "Hostel", "65 Lac",
        "38HK-2400sqft-2bath", "San Halen, CA"));
    listBuilding.add(Place("assets/places/building1.jpg", "Hostel", "65 Lac",
        "38HK-2400sqft-2bath", "San Halen, CA"));
    _minValue = 1.0;
    _maxValue = 65.0;
    
    buttons.add("Elevator");
    buttons.add("Pool");
    buttons.add("GYM");
    buttons.add("UPS");
    buttons.add("Garden");
  }

  Widget slidingPanel() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              child: new Container(
                height: 10.0,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              onTap: (){
                setState(() {
                  _controller.close();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Type",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              Text("Reset",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                    onPressed: (){},
                child: Text("1BHK"),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("2BHK"),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: (){},
                  child: Text("3BHK"),),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Text("Amenities",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              ],
            ),
          ),
          Container(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: buttons.length,
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text(buttons[index]),
                        onPressed: (){

                        }),
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            width: queryData.size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Price",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  width: queryData.size.width * .9,

                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(_minValue.round().toString(), style: TextStyle(color: Colors.black,fontSize: 15),),
                          Text(_maxValue.round().toString(), style: TextStyle(color: Colors.blue,fontSize: 15),),
                        ],
                      ),
                      Container(
                        width: queryData.size.width * .9,
                        child: GestureDetector(
                          child: CupertinoRangeSlider(
                            minValue: _minValue,
                            maxValue: _maxValue,
                            activeColor: Colors.blue,
                            min: 0,
                            max: 65,
                            onMinChanged: (v){
                              setState(() {
                                _minValue = v;
                              });
                            },
                            onMaxChanged: (v){
                              setState(() {
                                _maxValue = v;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Container(
              height: 50,
              width: queryData.size.width * .85,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Center(child: Text("View Properties", style: TextStyle(color: Colors.white, fontSize: 17),)),
            ),
            onTap: (){
              
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        Container(
          width: queryData.size.width,
          height: queryData.size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: queryData.size.height * .18,
                color: Colors.blue,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Discover",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 23.0),
                          ),
                          MaterialButton(
                              child: Text(
                                "Filter",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.open();
                                });
                              })
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      height: 50.0,
                      width: queryData.size.width * .95,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: TextField(
                        textAlign: TextAlign.start,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText:
                                'Search Homes, locations to discover more',
                            border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: queryData.size.width,
                height: queryData.size.height * .43,
                child: Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Homes Near You",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        MaterialButton(
                            child: Text(
                              "View all",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                            onPressed: () {})
                      ],
                    ),
                    Container(
                      width: queryData.size.width,
                      height: queryData.size.height * .35,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: PageController(
                              viewportFraction: 0.9, initialPage: 1),
//                      controller:
//                          PageController(viewportFraction: 0.9, initialPage: 1),
//                        shrinkWrap: true,
                          itemCount: listPlaces.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                              width: queryData.size.width * 0.99,
                              child: new Card(
                                margin: (index == 0 ||
                                        index == (listPlaces.length + 1))
                                    ? EdgeInsets.only(left: 0, right: 10)
                                    : EdgeInsets.only(left: 10, right: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
//                                elevation: 2,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset(
                                        listPlaces[index].getImage(),
                                        fit: BoxFit.cover,
                                        height: queryData.size.height * .245,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              listPlaces[index].getName(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              listPlaces[index].getPrice(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.blue),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          listPlaces[index].getDetail(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.all(10.0),
                  height: queryData.size.height * .35,
                  width: queryData.size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: queryData.size.height * .05,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Trending Homes",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            MaterialButton(
                                child: Text(
                                  "View all",
                                  style: TextStyle(color: Colors.blue, fontSize: 16.0),
                                ),
                                onPressed: () {})
                          ],
                        ),
                      ),
                      Container(
                        width: queryData.size.width,
                        height: queryData.size.height * 0.22,
                        child: PageView.builder(
                          pageSnapping: true,
                            controller: PageController(
                                viewportFraction: 0.6, initialPage: 1),
                            itemCount: listBuilding.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                height: queryData.size.height * .8,
                                width: queryData.size.width * 0.96,
                                child: Card(
                                    margin: index == 0 ||
                                            index == (listBuilding.length + 1)
                                        ? EdgeInsets.only(top: 0)
                                        : EdgeInsets.only(top: 10),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Row(
                                        children: <Widget>[
                                          Image.asset(
                                            listBuilding[index].getImage(),
                                            fit: BoxFit.cover,
                                            width: queryData.size.width * .40,
                                            height: queryData.size.height * .20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  listBuilding[index].getName(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(listBuilding[index]
                                                    .getDetail()),
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                Text(listBuilding[index]
                                                    .getName()),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                              );
                            }),
                      ),
                    ],
                  )),
            ],
          ),
        ),
        SlidingUpPanel(
          panel: slidingPanel(),
          borderRadius: BorderRadius.circular(30.0),
          controller: _controller,
          backdropEnabled: true,
          backdropOpacity: 0.4,
          minHeight: 0,
          backdropTapClosesPanel: true,

        ),
      ]),
    );
  }
}