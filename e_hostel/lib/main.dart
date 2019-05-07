import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'signUp.dart';
import 'search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "e-Hotel",
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MediaQueryData querydata;

  @override
  Widget build(BuildContext context) {
    querydata = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: new Container(
        height: querydata.size.height,
        width: querydata.size.width,
        child: new Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
//              right: 0,
              child: Opacity(
                  opacity: 0.7,
                  child: Image.asset(
                    "assets/background.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              width: querydata.size.width,
              top: querydata.size.height * 0.1,
//              left: 20,
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 50, top: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "The E-Hostel",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: querydata.size.width * .10,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Finding an appartment has never been easier until now",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 60.0,
              child: new Container(
                width: querydata.size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: querydata.size.width * .4,
                      height: 50,
                      child: Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                    MaterialButton(
                      minWidth: querydata.size.width * .4,
                      height: 50,
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              width: querydata.size.width,
              bottom: 30,
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Text(
                    "Not creating an account? Explore the App",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Search()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
