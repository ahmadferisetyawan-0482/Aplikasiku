import 'package:email_login/pages/daftar_page.dart';
import 'package:email_login/pages/masuk_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        resizeToAvoidBottomPadding: true,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(left: 0, right: 0, top: 80),
                child: Column(
                  children: <Widget>[
                    // Image.asset('assets/logo.png', width: 90),
                    Text(
                      'HELLO',
                      style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'Poppins-Bold',
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text('Selamat datang!',
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 15,
                          fontFamily: 'Poppins-Bold',
                          color: Colors.black,
                        )),
                    SizedBox(
                      height: 400,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          // new OutlineButton(
                          //   child: new Text('Login'),
                          //   onPressed: () {},
                          //   padding: EdgeInsets.only(left: 97, right: 97, top: 20, bottom: 20),
                          //   shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          // ),
                          RaisedButton(
                            padding: EdgeInsets.only(
                                left: 155, right: 155, top: 20, bottom: 20),
                            color: Colors.white,
                            child: Text(
                              'Masuk',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins-Bold',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return MasukPage();
                              }));
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButton(
                            color: Colors.transparent,
                            child: Text(
                              'Daftar?',
                              style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Poppins-Bold',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DaftarPage();
                              }));
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
