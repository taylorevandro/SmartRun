
import 'package:flutter/material.dart';
import 'widgets/Compras.dart';
import 'widgets/Services_compra.dart';
import 'package:flutter/rendering.dart';
import 'package:smartrunnn/Calendar.dart';
import 'dart:developer';

class ListaPagos extends StatefulWidget {
  //
  ListaPagos() : super();
 
  final String title = 'Histórico de Pagamento';
 
  @override
  ListaPagosState createState() => ListaPagosState();
}
 
class ListaPagosState extends State<ListaPagos> {

  List<Compra> _compras;
  GlobalKey<ScaffoldState> _scaffoldKey;
  Compra _selectedCompra;
  bool _isUpdating;
  String _titleProgress; 
  TextEditingController _mes;
  @override
  void initState() {
    super.initState();
    _compras = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _mes = TextEditingController();
    _getCompra();
  }
 
  // Method to update title in the AppBar Title
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
    _showProgress('Creating Table...');
    Services.createTableComp().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
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
    _showProgress('Carregando...');
    Services.getCompra().then((compra) {
      setState(() {
        _compras = compra;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${compra.length}");
    });
  }

   _updateCompra(Compra compra) {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Atualizando treino...');
    Services.updateCompra(
            compra.id, _mes.text, 'MasterCard','1')
        .then((result) {
      if ('success' == result) {
        _getCompra(); // Refresh the list after update
        setState(() {
          _isUpdating = false;
        });
        _clearValues();
      }
    });
  }
 
  
  _deleteCompra(Compra compra) {
    _showProgress('Deletando Pagamento...');
    Services.deleteCompra(compra.id).then((result) {
      if ('success' == result) {
        _getCompra(); // Refresh after delete...
      }
    });
  }

  _clearValues() {
    _mes.text = '';
  }

  _showValues(Compra compra) {
    _mes.text = compra.mesreferente;

  }
 
  // Method to clear TextField values
  
 
  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: new Text(_titleProgress),
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
         // we show the progress in the title...
       // leading: IconButton(icon: Icon(FontAwesomeIcons.bars,
         //   color: Colors.white,),
        //    onPressed: () {
      //        Navigator.push(context, MaterialPageRoute(builder: (context) => MenuDashboard()));
      //      },),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getCompra();
            },
          ),
       ],
       
      ),
      
      body: 
        SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DataTable(
              sortColumnIndex: 1,
              sortAscending: true,
            columns: [
              DataColumn(
                label: Text('',style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu')),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu'),),
              ),
              // Uma coluna pra mostrar o button Delete
              DataColumn(
                label: Text('',style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu')),
              ),
              DataColumn(
                label: Text('',style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Ubuntu')),
              )
            ],
            rows: _compras
              .map(
                (compra) => DataRow(cells: [
                  DataCell(
                    Text(compra.id,
                    style: TextStyle(
                    fontFamily: 'Ubuntu'),),
                    
                    // Add tap in the row and populate the
                    // textfields with the corresponding values to update
                    onTap: () {
                      _showValues(compra);
                      // Set the Selected employee to Update
                      _selectedCompra = compra;
                      setState(() {
                         _isUpdating = true;
                         log(_selectedCompra.id);
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      compra.mesreferente.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Ubuntu'),
                    ),
                    onTap: () {
                      _showValues(compra);
                      // Set the Selected employee to Update
                      _selectedCompra = compra;
                      setState(() {
                         _isUpdating = true;
                         log(_selectedCompra.mesreferente);
                      });
                    },
                  ),
                  DataCell(                    
                    Text(
                      compra.bandeiracartao.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Ubuntu'),
                    ),
                    onTap: () {
                      _showValues(compra);
                      // Set the Selected employee to Update
                      _selectedCompra = compra;
                      setState(() {
                         _isUpdating = true;
                         log(_selectedCompra.bandeiracartao);
                      });
                    },
                  ),
                  DataCell(                    
                    Text(
                      '189,99'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Ubuntu'),
                    ),
                    onTap: () {
                      _showValues(compra);
                      // Set the Selected employee to Update
                      _selectedCompra = compra;
                      setState(() {
                         _isUpdating = true;
                         log(_selectedCompra.bandeiracartao);
                      });
                    },
                  ),
                ]),
              )
              .toList(),),
                   
          ],
          ),          
        )  
        );
  }
}
class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
              return  new Card(
                    child: new Column(
                      children: <Widget>[
                        new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
                        new Padding(
                          padding: new EdgeInsets.all(7.0),
                          child: new Row(
                            children: <Widget>[
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.thumb_up),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Icon(Icons.comment),
                             ),
                             new Padding(
                               padding: new EdgeInsets.all(7.0),
                               child: new Text('Comments',style: new TextStyle(fontSize: 18.0)),
                             )

                            ],
                          )
                        )
                      ],
                    ),
                  );}}