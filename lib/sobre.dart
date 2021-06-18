import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartrunnn/Calendar.dart';


class sobrePage extends StatefulWidget {
  @override
  _sobrePageState createState() => _sobrePageState();
}

class _sobrePageState extends State<sobrePage> {
  double screenHeight, screenWidth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
          Text('SmartRun',style:TextStyle(fontFamily: 'RobotoMono',fontSize: 15,color: Colors.white)),
          Text('Version 1.0',style:TextStyle(fontFamily: 'RobotoMono',fontSize: 15,color: Colors.white)),
          SizedBox(height: 20.0,),
          Image.asset('lib/assets/logo/Logo.png',width: 80.0,),
          SizedBox(height: 20.0,),
          Text('© 2020 SmartRun Inc.',style:TextStyle(fontFamily: 'RobotoMono',fontSize: 15,color: Colors.white)), 
        ],
      ),
    );
   
  }
  

  
}