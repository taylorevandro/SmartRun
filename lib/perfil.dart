
import 'package:flutter/material.dart';
import 'package:smartrunnn/Calendar.dart';
import 'package:smartrunnn/DetalhePerfil.dart';
import 'package:smartrunnn/sobre.dart';
import 'package:smartrunnn/Listapagos.dart';
import 'package:smartrunnn/homePagamento.dart';
import 'package:smartrunnn/Planos.dart';
class Perfilpage extends StatefulWidget {
  @override
  _PerfilpageState createState() => _PerfilpageState();
}

class _PerfilpageState extends State<Perfilpage> {
  double screenHeight, screenWidth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: new Text("Perfil Instrutor"),
        elevation: 0,
        backgroundColor: backgroundColor,        
      ),
      drawer: drawer(),
      body: 
        SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  corpo(context),
                  quadro1(),
                  opcoes('Editar Perfil','DatalhePage'),
                  opcoes('Configuração de Sistema','sobrePage'),
                ],
              ),
            ],
          ),
        ),
    );
  }
  
  Widget corpo(context){
    return Column(
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
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: circleImage()
                    ),
                    Column(
                      children: <Widget>[
                        Text('   ')
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Nome: Jessica Mayumi',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'RobotoMono'),textAlign: TextAlign.left,),
                        Text('Nascimento: 12/12/2000',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'RobotoMono'),textAlign: TextAlign.left,),
                        Text('Email: jessmayumi@hotmail.com',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'RobotoMono'),textAlign: TextAlign.left,),
                        Text('CPF: 000.938.298-23',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'RobotoMono'),textAlign: TextAlign.left,),
                        Text('Telefone: (91) 9283-7472',style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'RobotoMono'),textAlign: TextAlign.left,)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
 
 circleImage() {
    return Center(
      child : new Container(
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('lib/assets/perfilmay.jpg')
            )
        ),
     ),
    );
  }

  quadro1(){
    return Padding(
      padding: EdgeInsets.only(left: 12.0,top: 7.0,right: 12.0,bottom: 12.0),
       child: Material(
         color: backgroundColor,
         borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40))
            ),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Informações Pessoais',textAlign: TextAlign.left,),
                  //subtitle: Text('Meu curriculo detalhado'),
                ),
                  Container(
                    padding: EdgeInsets.only(left:15.0),
                    child: Container(
                      child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Nome: Jessica Mayumi Tanisue Medeiros',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'RobotoMono',fontSize: 14)),
                              Divider(height: 10.0,),
                              Text('Idade: 19',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'RobotoMono',fontSize: 14)),
                              Divider(height: 10.0,),
                              Text('Sexo: Feminino ',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'RobotoMono',fontSize: 14)),
                              Divider(height: 10.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(' ...',textAlign: TextAlign.left,style: TextStyle(fontFamily: 'RobotoMono',fontSize: 14)),
                                  ButtonBar(
                                    children: <Widget>[                   
                                      FlatButton( 
                                        color: backgroundColor,
                                        child: Text('Ver mais'),                                    
                                        onPressed: () {
                                          Navigator.push(context, new MaterialPageRoute(
                                            builder: (BuildContext context) => new DatalhePage()) 
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  } 

  opcoes(String op, String janela ){
    return Container(
      padding: EdgeInsets.all(0.0),              
                  alignment: Alignment.center,              
                  child: FlatButton(
                    onPressed: () {
                      if (janela == 'DatalhePage'){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new DatalhePage()));
                      } else if (janela == 'sobrePage'){
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new sobrePage()));                      
                      }                    
                                          
                     },
                    //textColor: Colors.blueGrey,
                    padding: const EdgeInsets.all(0.0),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                    child: Container(                      
                        decoration:  BoxDecoration( 
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          color: Colors.white
                        ),
                      padding: const EdgeInsets.only(left: 13.0,bottom: 3.0,top:3.0,right: 13.0), 
                      child: Row(                      
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(op,style: TextStyle(fontSize: 14,color: Colors.black)),                          
                          Container(                            
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_forward_ios,color: Colors.grey,size: 30),
                              ],
                            )
                          )
                        ],
                      ),
                     ),
                  )
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
                leading: Icon(Icons.contacts,color: Colors.white,),
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