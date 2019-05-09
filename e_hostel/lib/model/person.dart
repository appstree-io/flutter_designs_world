import 'package:firebase_database/firebase_database.dart';

class Person {
  String _name;
  String _email;

//  String _image;
  String _phoneNumber;
  String _password;

//  String _address;

  Person(this._name, this._email,
//      this._image,
      this._phoneNumber,
      this._password,
//      this._address
      );

  String getName() {
    return _name;
  }

  String getEmail() {
    return _email;
  }

  String getPhoneNumber() {
    return _phoneNumber;
  }

  String getPassword(){
    return _password;
  }

  Person.fromSnapshot(Map<dynamic, dynamic> map){
    _name = map['name'];
    _email = map['email'];
    _phoneNumber = map['phoneNumber'];
    _password = map['password'];
  }
}