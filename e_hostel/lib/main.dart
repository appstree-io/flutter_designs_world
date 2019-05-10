import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'signUp.dart';
import 'search.dart';
import 'model/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Person p;
    return MaterialApp(
      title: "e-Hotel",
      home: new splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

FirebaseUser user;
FirebaseAuth auth;
String screen;
final DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference().child("profiles");

void _showError(BuildContext ctx, String error) {
  final scaffold = Scaffold.of(ctx);
  scaffold.showSnackBar(
      SnackBar(content: Text(error), duration: Duration(seconds: 3)));
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    auth = FirebaseAuth.instance;
    getCurrentUser();
  }

  getCurrentUser() async {
    user = await auth.currentUser();
    showDialog(context: context,
        builder: (BuildContext context){
          return
            new Center(child:
            CircularProgressIndicator()
            );
        }
    );
    Person person;
    if (user != null) {
      databaseReference.child(user.uid).once().then((DataSnapshot data) {
        person = Person.fromSnapshot(data.value);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Search(p: person)));
      }).catchError((error) {
        _showError(context, error.toString());
        print(error);
      });
    } else {
        Future.delayed(new Duration(seconds: 3), (){
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => homePage()));
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Center(
        child: Image.asset("assets/splash.jpg", fit: BoxFit.cover,),
      ),
    );
  }
}

class homePage extends StatelessWidget {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Search(
                                p: Person(
                                    "Guest", "guest@gmail.com", null, null))));
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
