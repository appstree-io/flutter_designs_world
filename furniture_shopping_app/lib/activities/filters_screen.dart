import 'package:flutter/material.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Filters",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              "Done",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.grey[100],
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Brand",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Container(
                height: 115,
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                color: Colors.white,
                child: _buildBrandTiles(),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.grey[100],
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Container(
                height: 215,
                width: double.infinity,
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 7),
                color: Colors.white,
                child: Wrap(
                    spacing: 8.0,
                    runSpacing: 3.0,
                    children:
                        List<Widget>.generate(categories?.length, (int index) {
                      return GestureDetector(
                        child: RawChip(
                          shape:
                              Border.all(color: Colors.grey[300], width: 1.5),
                          backgroundColor: selectedCategory == index ? defaultColor : Colors.transparent,
                          label: Text(categories?.elementAt(index), style: TextStyle(color: selectedCategory == index ? Colors.white: Colors.grey[600]),),
                        ),
                        onTap: () {
                          print("category");
                          setState(() {
                            selectedCategory = index;
                          });
                        },
                      );
                    }).toList()),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.grey[100],
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Colors",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Container(
                width: double.infinity,
                height: 80,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    children: List<Widget>.generate(6, (int index) {
                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        child: new Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: selectedColor == index
                                    ? colors?.elementAt(index)
                                    : Colors.transparent,
                                width: 2,
                              )),
                          child: Center(
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colors?.elementAt(index)),
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            selectedColor = index;
                            defaultColor = colors?.elementAt(index);
                          });
                        },
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  );
                }).toList()),
              ),
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.only(left: 20, right: 20),
                color: Colors.grey[100],
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Price range",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    )),
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: defaultColor,
                      inactiveTrackColor: Colors.grey[300],
                      thumbColor: defaultColor,
                      valueIndicatorColor: defaultColor,
                      trackHeight: 60,
                    ),
                    child: RangeSlider(
                      min: 0.0,
                      max: 100.0,
                      lowerValue: _lowerValue,
                      upperValue: _upperValue,
                      divisions: 20,
                      showValueIndicator: true,
                      valueIndicatorMaxDecimals: 1,
                      onChanged: (double newLowerValue, double newUpperValue) {
                        setState(() {
                          _lowerValue = newLowerValue;
                          _upperValue = newUpperValue;
                        });
                      },
                      onChangeStart:
                          (double startLowerValue, double startUpperValue) {
                        print(
                            'Started with values: $startLowerValue and $startUpperValue');
                      },
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "\$25.00",
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$500.00",
                      style: TextStyle(
                          color: Colors.grey[500], fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double _lowerValue = 20.0;
  double _upperValue = 70.0;

  Widget _buildBrandTiles() {
    return GridView.count(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 15,
      childAspectRatio: MediaQuery.of(context).size.width / 1100,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _singleBrandTile(0),
        _singleBrandTile(1),
        _singleBrandTile(2),
        _singleBrandTile(3),
        _singleBrandTile(4),
      ],
    );
  }

  List<String> imagesPath = [
    "assets/11.png",
    "assets/13.png",
    "assets/14.png",
    "assets/12.png",
    "assets/16.png"
  ];

  int selectedBrand = -1;
  Color defaultColor = Colors.red;
  int selectedCategory = -1;
  int selectedColor = 0;

  Widget _singleBrandTile(int index) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: selectedBrand == index ? defaultColor : Colors.grey[300],
            width: 1.5,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagesPath?.elementAt(index),
            color: Colors.black,
            scale: 10,
          ),
        ),
      ),
      onTap: () {
        print("brand");
        setState(() {
          selectedBrand = index;
        });
      },
    );
  }

  List<String> categories = [
    "Accent Chairs",
    "Bar Stools",
    "Garden Chairs",
    "Toddler & kids Chairs",
    "Folding Chairs",
    "Office Chairs",
    "Kitchen & dining Chairs",
    "Reclining Sectionals",
    "Stacting Chairs"
  ];

  List<Color> colors = [
    Colors.red,
    Colors.orangeAccent,
    Colors.yellow,
    Colors.brown,
    Colors.blue,
    Colors.grey[400]
  ];
}
