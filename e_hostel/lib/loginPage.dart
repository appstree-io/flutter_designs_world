import 'package:flutter/material.dart';
import 'signUp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'model/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'search.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

  final DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference().child("profiles");
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class _LoginPageState extends State<LoginPage> {
  MediaQueryData query;
  bool btnPressed = false;
  final email = TextEditingController();
  final password = TextEditingController();

  void _showError(BuildContext ctx, String error) {
    final scaffold = Scaffold.of(ctx);
    scaffold.showSnackBar(
        SnackBar(content: Text(error), duration: Duration(seconds: 3)));
  }

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "LOGIN",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  errorText: (email.text.isEmpty && btnPressed)
                      ? "Cannot be Empty"
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  errorText: (password.text.isEmpty && btnPressed)
                      ? "Cannot be Empty"
                      : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Builder(
              builder: (context) => GestureDetector(
                    child: Container(
                      width: query.size.width * 0.70,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                    ),
                    onTap: () async {
                      setState(() {
                        btnPressed = true;
                      });
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        showDialog(context: context,
                            builder: (BuildContext context){
                              return Center(child: CircularProgressIndicator());
                            }
                        );
                        FirebaseUser user = await firebaseAuth
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .catchError((e) {
                          _showError(context, e.toString());
                          print(e.toString());
                        });
                        if (user != null ) {
                          Person person;
                          databaseReference.child(user.uid)
                              .once()
                              .then((DataSnapshot data) {
                            print(data.value.values.toString());
                            person = Person.fromSnapshot(data.value);
//                            Map<dynamic, dynamic> map = data.value;
//                            map.forEach((k, v) {
//                              person = Person.fromSnapshot(v);
//                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search(p: person, user: user,)));
                          }).catchError((error) {
                            _showError(context, error.toString());
                            print(error);
                          });
                        }
                      }
                    },
                  ),
            ),
            SizedBox(
              height: 40.0,
            ),
            GestureDetector(
              child: Center(
                  child: Text(
                "Not Registered? Click here!",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
