import 'package:flutter/material.dart';
import 'loginPage.dart';

class SignUp extends StatelessWidget {
  MediaQueryData query;

  @override
  Widget build(BuildContext context) {
    query = MediaQuery.of(context);
    TextEditingController name, email, phoneNumber, password, address;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Register", style: TextStyle(color: Colors.black),),
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
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    labelText: "Password",
                  ),
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
              GestureDetector(
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
                onTap: () {

                },
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
