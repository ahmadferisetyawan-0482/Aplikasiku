import 'dart:async';
import 'package:email_login/pages/masuk_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DaftarPage extends StatefulWidget{
  @override
  _DaftarPageState createState() => _DaftarPageState();
}

class _DaftarPageState extends State<DaftarPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _obscureText = true;

  String _email, _password;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    final formState = _fromKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser useremail = (await FirebaseAuth.instance
                .createUserWithEmailAndPassword(email: _email, password: _password))
            .user;
            useremail.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MasukPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Form(
            key: _fromKey,
            child: Padding(
              padding: EdgeInsets.only(top: 130, left: 30, right: 30),
              child: ListView(
                children: <Widget>[
                  Text('Daftar',
                  style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 34,
                    letterSpacing: 3,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  )),
                  SizedBox(
                    height: 65,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty){
                        return 'Periksa Email kembali';
                      }
                    },
                    onSaved: (input) => _email = input,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.length < 6){
                        return 'Periksa Password Kembali';
                      }
                    },
                    onSaved: (input) => _password = input,
                    autofocus: false,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Poppins-Bold',
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(top: 13, left: 148, right: 148, bottom: 13), 
                    onPressed: () => signUp(),
                    color: Colors.yellow,
                    child: Text('Daftar',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins-Bold',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}