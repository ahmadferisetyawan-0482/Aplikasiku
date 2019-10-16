import 'dart:async';
import 'package:email_login/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MasukPage extends StatefulWidget {
  @override
  _MasukPageState createState() => _MasukPageState();
}

class _MasukPageState extends State<MasukPage> {
  bool _isHidePassword = true;

  get formState => null;
  void _tooglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _obscureText = true;

  String _email, _password;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  Future<void> signIn() async {
    final formState = _fromKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser useremail = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DashboardPage()));
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
                  Text('Login',
                      style: TextStyle(
                        fontSize: 34,
                        fontFamily: 'Poppins-Bold',
                        letterSpacing: 3,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 65,
                  ),
                  new TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Periksa Email Anda!';
                        }
                      },
                      onSaved: (input) => _email = input,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        // icon: const Padding(
                        //   padding: const EdgeInsets.only(top:15),
                        //   child: const Icon(Icons.account_box),
                        // )
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.length < 6) {
                        return 'Periksa Password Anda!';
                      }
                    },
                    onSaved: (input) => _password = input,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    obscureText: _isHidePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                          _tooglePasswordVisibility();
                        },
                        child: Icon(
                          _isHidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: _isHidePassword ? Colors.grey : Colors.red,
                        ),
                      ),
                      isDense: true,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.transparent,
                        child: Text(
                          'Lupa kata sandi?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Poppins-Bold',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                        top: 13, left: 148, right: 148, bottom: 13),
                    color: Colors.yellow,
                    child: Text('Masuk',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins-Bold',
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onPressed: () => signIn(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
