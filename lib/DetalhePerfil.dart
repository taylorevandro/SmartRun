import 'package:flutter/material.dart';
import 'package:smartrunnn/Calendar.dart'; 
import 'package:smartrunnn/perfil.dart';

class DatalhePage extends StatefulWidget {
  @override
  _DatalhePageState createState() => _DatalhePageState();
}

class _DatalhePageState extends State<DatalhePage> {
  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Datalhamento"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), 
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                 builder: (BuildContext context) => new Perfilpage()) 
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Divider(height: 18,color: Colors.white,),
              Title(color: Colors.black, child: Text('Atividades'.toUpperCase(),style: TextStyle(),)),
              Divider(height: 5,color: Colors.white,),
              Text('Conhecimento em organização de eventos esportivos modalidades de quadras, áquaticas e corrida de rua; tabelas de jogos, classificação dos times, contato com árbitros, verificação dos materiais e dependências esportivas; Experiência em compras e trocas de materiais esportivos e vistoria para manutenção dos espaços esportivos; Experiência em atendimento ao publico e/ou associados; Contratação e pagamento de serviços, como transporte, alimentação, troféus e medalhas. Trato direto com professores e responsáveis pelas modalidades, pais de atletas e atletas.'
              ,style: TextStyle(fontSize: 16),),
              expe(),
            ],
          ),
        ),
      ),
    );
  }

  expe(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
       child: Column(
         children: <Widget>[
           Divider(height: 18,color: Colors.white,),
           Title(color: Colors.black, child: Text('Experiência Profissional'.toUpperCase())),
           Divider(height: 10,color: Colors.grey,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[               
               Text('Empresa: Fitbol',textAlign: TextAlign.left,style: TextStyle(fontSize: 16)),
               Text('Periodo: 10/2018 à 02/2020',style: TextStyle(fontSize: 16)),
             ],
           ),
           Divider(height: 5,color: Colors.white,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Text('Cargo: Assessor Esportivo',style: TextStyle(fontSize: 16)),
             ],
           ),
           Divider(height: 10,color: Colors.white,),
           Divider(height: 10,color: Colors.grey,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[               
               Text('Empresa: SmartFit',textAlign: TextAlign.left,style: TextStyle(fontSize: 16)),
               Text('Periodo: 10/2018 à 02/2020',style: TextStyle(fontSize: 16)),
             ],
           ),
           Divider(height: 5,color: Colors.white,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               Text('Cargo: Assessor Esportivo'),
             ],
           )
         ],
       ),
    );
  }
  
}