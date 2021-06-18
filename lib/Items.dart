

import 'package:smartrunnn/widgets/Employee.dart';
import 'Calendar.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Items());
}



class Items extends StatelessWidget {
  final Employee employee;

  const Items({Key key, this.employee}) : super(key: key);
  

  // controller for the First Name TextField we are going to create.
 

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Turma"),
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                 builder: (BuildContext context) => new DataTableDemo()) 
            );
          },
        ),
      ),
      body: 
        SingleChildScrollView(
        child:Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/6,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16)
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(employee.firstName.toUpperCase(),style: TextStyle(color: Colors.white,fontSize: 25,fontFamily: 'RobotoMono',),textAlign: TextAlign.center,),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('lib/assets/gif/animacaogif.gif'), 
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left:15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                   Divider(height: 8,color: Colors.white,),
                   Text('Data: '+employee.datatreino.toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'RobotoMono',),),
                   Divider(height: 8,color: Colors.white,),
                   Text('Descrição: '+employee.lastName,style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'RobotoMono',),),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}