import 'package:flutter/material.dart';
import 'loginPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

void _showError(BuildContext ctx, String error) {
  final scaffold = Scaffold.of(ctx);
  scaffold.showSnackBar(
      SnackBar(content: Text(error), duration: Duration(seconds: 3)));
}

final DatabaseReference databaseReference =
    FirebaseDatabase.instance.reference().child("profiles");
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

class _SignUpState extends State<SignUp> {
  MediaQueryData query;

  final name = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  bool btnPressed = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Register",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    errorText: (name.text.isEmpty && btnPressed)
                        ? "Cannot be Empty"
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Name",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  scrollPadding: EdgeInsets.all(10.0),
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
                  controller: phoneNumber,
                  decoration: InputDecoration(
                    errorText: (phoneNumber.text.isEmpty && btnPressed)
                        ? "Cannot be Empty"
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Phone Number",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    errorText: (password.text.isEmpty && btnPressed)
                        ? "Cannot be Empty"
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Password",
                  ),
                  obscureText: true,
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: TextField(
//                  controller: address,
//                  decoration: InputDecoration(
//                    border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(20.0)),
//                    labelText: "Address",
//                  ),
//                ),
//              ),
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
                      "Register",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )),
                  ),
                  onTap: () async {
                    setState(() {
                      btnPressed = true;
                    });
                    if (name.text.isNotEmpty &&
                        email.text.isNotEmpty &&
                        phoneNumber.text.isNotEmpty &&
                        password.text.isNotEmpty) {
                      FirebaseUser user =
                          await firebaseAuth.createUserWithEmailAndPassword(
                              email: email.text, password: password.text).catchError((error){
                                _showError(context, error.toString());
                          });
                      String id;
                      if (user != null) {
                        id = user.uid;
                        databaseReference.child(id).set({
                          "name": name.text,
                          "email": email.text,
                          "password": password.text,
                          "phoneNumber": phoneNumber.text
                        }).then((vo) {
                          _showError(context, "Registration Successful");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                  "Already Registered! Login",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                )),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
