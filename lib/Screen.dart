import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartrunnn/Login.dart';

import 'package:smartrunnn/extra/loader_animator.dart';

class ScreenPage extends StatefulWidget {
  @override
  _ScreenPageState createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  double screenHeight, screenWidth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return LoginPage();
    })));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //color: Color(0xff01579b),
            gradient: LinearGradient(
              colors: [Color(0xff1a237e), Color(0xff0277bd)],
              begin: Alignment.centerRight,
              end: Alignment(-1.0, -1.0)
            ), //Gradient
      ),
      //color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('lib/assets/logo/Logo.png',width: 80.0,),
          Loading(
            radius: 15.0,
            dotRadius: 6.0,
          )
        ],
      ),
    );
  }
  

  
}