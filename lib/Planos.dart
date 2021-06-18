import 'package:smartrunnn/Calendar.dart';
import 'package:smartrunnn/Listapagos.dart';
import 'package:smartrunnn/sobre.dart';
import 'package:smartrunnn/perfil.dart';
import 'package:smartrunnn/Pagos.dart';
import 'package:smartrunnn/homePagamento.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/rendering.dart';

class Planos extends StatefulWidget {
  @override
  _PlanosState createState() => _PlanosState();
}

class _PlanosState extends State<Planos> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: backgroundColor,
        centerTitle: true,        
        title: Text("Planos"),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.coins), onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Pagos()) ) ;        }),
        ],
      ),
      drawer: drawer(),
      body: Center(
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height - 60.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Text('Acessoria Mortal', style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          //subText
                          Container(
                            child: Text(
                              'Aproveite 1 mês grátis de Premium',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 15.0,
                              ),),
                          ),
                          //Circle Avatar
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                width: 150.0,
                                height: 130.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        '\u0024189.99', style: TextStyle(
                                        fontSize: 30.0,
                                        color: Color(0xff8d70fe),
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    Container(
                                      child: Text('/mês', style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff8d70fe),
                                      ),),),
                                  ],)
                            ),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(
                                          FontAwesomeIcons.users, "Turmas"),
                                    ),
                                    DataCell(
                                      Text('20',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(
                                          FontAwesomeIcons.user,
                                          "Controle de Alunos"),
                                    ),
                                    DataCell(
                                      Text('200', style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(
                                          FontAwesomeIcons.phone,
                                          "24/7 Suporte"),
                                    ),
                                    DataCell(
                                      Text('Sim', style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(FontAwesomeIcons.coins,
                                          "Pagamento"),
                                    ),
                                    DataCell(
                                      Text('Sim', style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ]
                              ),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text('Escolher Plano',
                                  style: TextStyle(
                                    color: new Color(0xff6200ee),
                                  ),),
                                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => Pagpage(title: 'Dados do Cartão')) ) ;},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0),)
                            ),
                          ),

                        ],),
                    ],),
                ),
              ),
              //Second ListView
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [ Color(0xffebac38), Color(0xffde4d2a)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -2.0)
                    ), //Gradient
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Text('Acessoria Titã', style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                          //subText
                          Container(
                            child: Text(
                              'Aproveite 1 mês grátis de Premium',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 15.0,
                              ),),
                          ),
                          //Circle Avatar
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                width: 150.0,
                                height: 130.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Text(
                                        '\u0024989,99', style: TextStyle(
                                        fontSize: 30.0,
                                        color: Color(0xff8d70fe),
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    ),
                                    Container(
                                      child: Text('/semestre', style: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xff8d70fe),
                                      ),),),
                                  ],)
                            ),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(
                                          FontAwesomeIcons.users, "Turmas"),
                                    ),
                                    DataCell(
                                      Text('50',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),),
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(
                                          FontAwesomeIcons.user,
                                          "Controle de Alunos"),
                                    ),
                                    DataCell(
                                      Text('2000', style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(
                                          FontAwesomeIcons.phone,
                                          "24/7 Suporte"),
                                    ),
                                    DataCell(
                                      Text('Sim', style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      myRowDataIcon(FontAwesomeIcons.coins,
                                          "Pagamento"),
                                    ),
                                    DataCell(
                                      Text('Sim', style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                    ),
                                  ]
                              ),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text('Obtenha Preium',
                                  style: TextStyle(
                                    color: new Color(0xffde4d2a),
                                  ),),
                                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Pagpage(title: 'Dados do Cartão')) ) ;},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0),)
                            ),
                          ),

                        ],),
                    ],),

                ),
              ),
              //Third ListView
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Color(0xff5a348b),
                    gradient: LinearGradient(
                        colors: [ Color(0xffcb3a57), Color(0xffcb3a57)],
                        begin: Alignment.centerRight,
                        end: Alignment(-1.0, -1.0)
                    ), //Gradient
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          //Text
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceEvenly,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Icon(FontAwesomeIcons.soundcloud,
                                              color: new Color(0xffffffff),
                                              size: 40.0,),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              'Divina', style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30.0,
                                            ),),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: Text(
                                              '\u00241379/ano', style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30.0
                                            ),),),
                                        ),
                                      ],),
                                  ),
                                ],

                              ),
                            ),
                          ),

                          //Two Column Table
                          DataTable(
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(''),
                              ),
                              DataColumn(
                                label: Text(''),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Icon(FontAwesomeIcons.check,
                                        color: Colors.white,),
                                    ),
                                    DataCell(
                                      Text('Turma ilimitadas',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Icon(FontAwesomeIcons.check,
                                        color: Colors.white,),
                                    ),
                                    DataCell(
                                      Text('Alunos ilimitados', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Icon(FontAwesomeIcons.check,
                                          color: new Color(0xffffffff)),
                                    ),
                                    DataCell(
                                      Text('Relatórios estatíticos',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Icon(FontAwesomeIcons.check,
                                          color: new Color(0xffffffff)),
                                    ),
                                    DataCell(
                                      Text(
                                        '24/7 Suporte', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),),
                                    ),

                                  ]
                              ),
                              DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Icon(FontAwesomeIcons.check,
                                          color: new Color(0xffffffff)),
                                    ),
                                    DataCell(
                                      Text('Pagamento na plataforma',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                        ),),
                                    ),

                                  ]
                              ),
                            ],
                          ),

                          //Button
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                                color: new Color(0xffffffff),
                                child: Text('Adquira já',
                                  style: TextStyle(
                                    color: new Color(0xffcb3a57),
                                  ),),
                                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Pagpage(title: 'Dados do Cartão')) ) ;},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      30.0),)
                            ),
                          ),

                        ],),
                    ],),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  drawer(){
    var assetsImage = new AssetImage('lib/assets/perfilmay.jpg');
    return Drawer(
        child: Container(
          color: backgroundColor,
          child: ListView(
            children: <Widget>[ 
              new UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                   color: backgroundColor,
                ),
                accountName: new Text('Jessicamedeiros'),
                accountEmail: new Text('jessmayumi@hotmail.com'),
                currentAccountPicture: new Image(image: assetsImage,),
              ),
              //new Image(image: assetsImage, width: 60.0, height: 60.0, ),
              //new Divider(color: Colors.blueGrey, height: 3.0,),
               new ListTile(
                leading: Icon(Icons.contacts,color: Colors.white),
                title: new Text("Inicio",style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new DataTableDemo()) 
                      );
                  },
                
              ),
              new Divider(color: Colors.blueGrey, height: 3.0,),
              new ListTile(
                leading: Icon(Icons.contacts,color: Colors.white),
                title: new Text("Perfil",style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new Perfilpage()) 
                      );
                  },
                
              ),
              new Divider(color: Colors.blueGrey, height: 3.0,),
              new ListTile(
                leading: Icon(Icons.assignment,color: Colors.white),
                title: new Text("Planos",style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new Planos()) 
                      );
                  },
              ),
              new Divider(color: Colors.blueGrey, height: 3.0,),
              new ListTile(
                leading: Icon(Icons.monetization_on,color: Colors.white),
                title: new Text("Histórico de Pagamento",style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new ListaPagos()) 
                      );
                  },
              ),
              new Divider(color: Colors.blueGrey, height: 3.0,),
              new ListTile(
                leading: Icon(Icons.payment,color: Colors.white),
                title: new Text("Dados de Pagamento",style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new Pagpage(title: 'Dados do Cartão')) 
                      );
                  },
              ),
              new Divider(color: Colors.blueGrey, height: 3.0,),
              new ListTile(
                leading: Icon(Icons.people,color: Colors.white),
                title: new Text("Sobre Nós",style: TextStyle(color: Colors.white, fontSize: 18)),
                  onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new sobrePage()) 
                      );
                  },
              ),
              new Divider(color: Colors.blueGrey, height: 3.0,),              
            ],
          ),
        ),
      );
  }
}

ListTile myRowDataIcon(IconData iconVal, String rowVal) {
  return ListTile(
    leading: Icon(iconVal,
        color: new Color(0xffffffff)),
    title: Text(rowVal, style: TextStyle(
      color: Colors.white,
    ),),
  );

  
}

