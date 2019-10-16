import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key, googleSignIn}) : super(key: key);

  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Dashboard'),
       ),
    );
  }
}