import 'package:flutter/material.dart';
import 'package:smartrunnn/Calendar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usuario = "";
  String senha = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1a237e), Color(0xff0277bd)
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Image.asset('lib/assets/logo/Logo.png',width: 80.0,),
                  SizedBox(height: 20.0,),
                  /*Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  ),*/
                  //Spacer(),

                  Align(
                    alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(32.0
                        ),
                        child: Text('Instrutor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 62),
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    padding: EdgeInsets.only(
                      top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.people,
                            color: Colors.grey,
                        ),
                          hintText: 'Usuario',
                      ),
                      onChanged: (value) {
                      setState(() {
                        usuario = value;
                      });
                    },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    height: 45,
                    margin: EdgeInsets.only(top: 32),
                    padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(50)
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.vpn_key,
                          color: Colors.grey,
                        ),
                        hintText: 'Senha',
                      ),
                      onChanged: (value) {
                      setState(() {
                        senha = value;
                      });
                    },
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16, right: 32
                      ),
                      child: Text('Esqueceu a Senha ?',
                        style: TextStyle(
                          color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                  Spacer(),

                  Container( 
                  padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10.0),                  
                  alignment: Alignment.center,              
                  child: RaisedButton(
                    onPressed: (){
                        Navigator.push(context, new MaterialPageRoute(
                         builder: (BuildContext context) => new DataTableDemo()) 
                         );   
                                  },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                    child: Container(                      
                        decoration:  BoxDecoration(                                
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                      padding: EdgeInsets.only(left:130,right: 130.0,top: 12.0,bottom: 12.0),
                      child: Text('Entrar'.toUpperCase(), style: TextStyle(fontSize: 20)),
                    ),
                  )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );


  
  } 

  Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => DataTableDemo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
}