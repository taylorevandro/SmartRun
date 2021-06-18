import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartrunnn/Listapagos.dart';
import 'package:smartrunnn/Pagamento.dart';
import 'package:smartrunnn/Calendar.dart';
import 'widgets/Compras.dart';
import 'widgets/Services_compra.dart';
import 'package:smartrunnn/awesome_card.dart';

class Pagpage extends StatefulWidget {

  Pagpage({Key key,this.title}) : super (key : key);
  final String title;

  @override
  _PagpageState createState() => _PagpageState(); 
}

class _PagpageState extends State<Pagpage>{
  
  GlobalKey<ScaffoldState> _scaffoldKey;
  List<Compra> _compras;
  TextEditingController _mes;
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  String _titleProgress;

  String meses = "";
  bool showBack = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _compras = [];
    _focusNode = new FocusNode();
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey();
    _mes = TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }
  _showProgress(String message) {
    setState(() {
      _titleProgress = message;
    });
  }
 
  _showSnackBar(context, message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

   _createTable() {
    Services.createTableComp().then((result) {
      if ('success' == result) {
        // Table is created successfully.
      }
    });
  }

  _addCompra() {
    if (_mes.text.isEmpty) {
      print('Campo vazio');
      return;
    }
    _showProgress('Adicionando Pagamento...');
    Services.addCompra(_mes.text,'MasterCard','1').then((result) {
      if ('success' == result) {
        _getCompra(); // Refresh the List after adding each employee...
        _clearValues();
      }
    });
  }

  _getCompra() {
    _showProgress('Carregando Pagamento...');
    Services.getCompra().then((compra) {
      setState(() {
        _compras = compra;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${compra.length}");
    });
  }

  _clearValues() {
    _mes.text = '';
  }

  
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titleProgress),
        centerTitle: true,
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
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            PagamentoPage(
              cardNumber: cardNumber,
              cardExpiry: expiryDate,
              cardHolderName: cardHolderName,
              cvv: cvv,
              bankName: "Pag Bank",
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
            ),
            SizedBox(
              height: 40,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Número do Cartão"),
                    keyboardType: TextInputType.number,
                    maxLength: 19,
                    onChanged: (value) {
                      setState(() {
                        cardNumber = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Data de Validade"),
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    onChanged: (value) {
                      setState(() {
                        expiryDate = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Nome Impresso"),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "CVV"),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    onChanged: (value) {
                      setState(() {
                        cvv = value;
                      });
                    },
                    focusNode: _focusNode,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: _mes,
                    decoration: InputDecoration(hintText: "Mês Referente"),
                    keyboardType: TextInputType.text,
                    //focusNode: _focusNode,
                  ),
                ),
                /*Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.only(top:10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Mês de Pagamento:     ',style: TextStyle(fontSize: 16,color: Colors.grey[600]),),
                      DropdownButton<String>( 
                        value: 'Janeiro',
                        elevation: 16,
                        style: TextStyle(
                           color: Colors.black,
                           fontSize: 18
                        ),
                        items: <String>['Janeiro', 'Fevereiro', 'Março', 'Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro']
                         .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                 value: value,
                                 child: Text(value),
                              );
                        }).toList(),
                        onChanged: (value){
                          setState(() {
                            _mes = value;
                          });
                        },                        
                      ),
                    ],
                  ),
                ),*/
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20), 
                  padding: EdgeInsets.only(left: 20.0, right: 20.0,bottom: 10.0,top: 14.0),                  
                  alignment: Alignment.center,              
                  child: RaisedButton(
                    onPressed: () {
                       _createTable();
                       _addCompra(); 
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
                      padding: const EdgeInsets.all(0.0), 
                      child: Row(                      
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.assignment_turned_in), 
                            //color: Colors.black,
                            iconSize: 30,
                            onPressed: () {
                              _createTable();
                              _addCompra(); 
                              return showDialog(
                                 context: context,
                                 builder: (context) {
                                 return AlertDialog(
                                   title: Text('Pagamento'),
                                   // Retorna o texto que foi informado
                                   // usando o TextEditingController.
                                  content: Text(_titleProgress),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                          Navigator.push(context, new MaterialPageRoute(
                                           builder: (BuildContext context) => new ListaPagos()) 
                                          );
                                      },
                                    ),
                                  ],
                                  );
                                 },
                              );
                            }),
                          Text('Salvar',style: TextStyle(fontSize: 22,),)
                        ],
                      ),
                     ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}