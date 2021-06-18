import 'package:smartrunnn/Calendar.dart';
import 'package:smartrunnn/perfil.dart';
import 'package:smartrunnn/sobre.dart';
import 'package:smartrunnn/Planos.dart';
import 'package:smartrunnn/Listapagos.dart';
import 'package:flutter/material.dart';
import 'package:smartrunnn/homePagamento.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';




class Pagos extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text("Transações"),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.creditCard), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Pagpage(title: 'Dados do Cartão')) ) ;
          }),
        ],
      ),
      body:Stack(
        children: <Widget>[
          dashboard(context),
        ],
      ),
    );

  }
  Widget dashboard(context) {
    return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                      title: Text("Visa"),
                      subtitle: Text("Abril/2020"),
                      trailing: Text("183,99"),
                    ),
                  ListTile(
                      title: Text("Mastercard"),
                      subtitle: Text("Junho/2020"),
                      trailing: Text("183,99"),
                    ),
                  ListTile(
                      title: Text("Mastercard"),
                      subtitle: Text("Agosto/2020"),
                      trailing: Text("183,99"),
                    ),
                  ListTile(
                      title: Text("Mastercard"),
                      subtitle: Text("Setembro/2020"),
                      trailing: Text("183,99"),
                    ),
                ],
              ),
            ),
         
      );

   
  }
  
  }

  
