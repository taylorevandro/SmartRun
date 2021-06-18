


import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:smartrunnn/Listapagos.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:smartrunnn/Pagos.dart';
import 'widgets/Employee.dart';
import 'widgets/Services.dart';
import 'package:flutter/rendering.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Items.dart';
import 'package:smartrunnn/perfil.dart';
import 'package:smartrunnn/homePagamento.dart';
import 'package:smartrunnn/Planos.dart';
import 'package:smartrunnn/sobre.dart';
import 'Add.dart';
import 'dart:developer';
void main() {
  runApp(DataTableDemo());
}


final Color backgroundColor = Color(0xFF1A237E);
final Color appbar = Color(0xFFFFFFFF);

class DataTableDemo extends StatefulWidget {
  //
  DataTableDemo() : super();
 
  final String title = 'Bem Vindo, Instrutor';
 
  @override
  DataTableDemoState createState() => DataTableDemoState();
}
 
class DataTableDemoState extends State<DataTableDemo> {
  DateTime _currentDate = DateTime(2019, 2, 3);
  DateTime _currentDate2 = DateTime(2019, 2, 3);
  String _currentMonth = DateFormat.yMMM().format(DateTime(2019, 2, 3));
  DateTime _targetDateTime = DateTime(2019, 2, 3);

  static Widget _eventIcon = new Container(
    decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(1000)),
        border: Border.all(color: Colors.blue, width: 2.0)),
    child: new Icon(
      Icons.person,
      color: Colors.amber,
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {
      new DateTime(2019, 2, 10): [
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 1',
          icon: _eventIcon,
          dot: Container(
            margin: EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.red,
            height: 5.0,
            width: 5.0,
          ),
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 2',
          icon: _eventIcon,
        ),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 3',
          icon: _eventIcon,
        ),
      ],
    },
  );

  CalendarCarousel _calendarCarousel, _calendarCarouselNoHeader;

  CalendarController _controller;
  List<Employee> _employees;
  GlobalKey<ScaffoldState> _scaffoldKey;
  // controller for the First Name TextField we are going to create.
  TextEditingController _firstNameController;
  // controller for the Last Name TextField we are going to create.
  TextEditingController _lastNameController;
  TextEditingController _data_treino;
  Employee _selectedEmployee;
  bool _isUpdating;
  String _titleProgress;
  TextEditingController textFieldController;
  @override
  void initState() {
    _markedDateMap.add(
        new DateTime(2019, 2, 25),
        new Event(
          date: new DateTime(2019, 2, 25),
          title: 'Event 5',
          icon: _eventIcon,
        ));

    _markedDateMap.add(
        new DateTime(2019, 2, 10),
        new Event(
          date: new DateTime(2019, 2, 10),
          title: 'Event 4',
          icon: _eventIcon,
        ));

    _markedDateMap.addAll(new DateTime(2019, 2, 11), [
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 1',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 2',
        icon: _eventIcon,
      ),
      new Event(
        date: new DateTime(2019, 2, 11),
        title: 'Event 3',
        icon: _eventIcon,
      ),
    ]);

    super.initState();
    _controller = CalendarController();
    _employees = [];
    _isUpdating = false;
    _titleProgress = widget.title;
    _scaffoldKey = GlobalKey(); // key to get the context to show a SnackBar
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _data_treino = TextEditingController();
    textFieldController = TextEditingController();
    _getEmployees();
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
    _showProgress('Criando Tabela...');
    Services.createTable().then((result) {
      if ('success' == result) {
        // Table is created successfully.
        _showSnackBar(context, result);
        _showProgress(widget.title);
      }
    });
  }
 
  // Now lets add an Employee
  _addEmployee() {
    if (_firstNameController.text.isEmpty || _lastNameController.text.isEmpty ||  _data_treino.text.isEmpty ) {
      print('Campo Vazio');
      return;
    }
    _showProgress('Adicionando Treino...');
    Services.addEmployee(_firstNameController.text, _lastNameController.text, _data_treino.text)
        .then((result) {
      if ('success' == result) {
        _getEmployees(); // Refresh the List after adding each employee...
        _clearValues();
      }
    });
  }
 
  _getEmployees() {
    _showProgress('Carregando...');
    Services.getEmployees().then((employees) {
      setState(() {
        _employees = employees;
      });
      _showProgress(widget.title); // Reset the title...
      print("Length ${employees.length}");
    });
  }
 
  _updateEmployee(Employee employee) {
    setState(() {
      _isUpdating = true;
    });
    _showProgress('Atualizando treino...');
    Services.updateEmployee(
            employee.id, _firstNameController.text, _lastNameController.text,_data_treino.text)
        .then((result) {
      if ('success' == result) {
        _getEmployees(); // Refresh the list after update
        setState(() {
          _isUpdating = false;
        });
        _clearValues();
      }
    });
  }
 
  _deleteEmployee(Employee employee) {
    _showProgress('Deletando treino...');
    Services.deleteEmployee(employee.id).then((result) {
      if ('success' == result) {
        _getEmployees(); // Refresh after delete...
      }
    });
  }
 
  // Method to clear TextField values
  _clearValues() {
    _firstNameController.text = '';
    _lastNameController.text = '';
    _data_treino.text = '';
  }
 
  _showValues(Employee employee) {
    _firstNameController.text = employee.firstName;
    _lastNameController.text = employee.lastName;
    _data_treino.text = employee.datatreino;
  }
 
  _sendDataToItems(BuildContext context){
    String textToSend = textFieldController.text;
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => Items(),),
      );
  }
  // Let's create a DataTable and show the employee list in it.
 
  // UI
  @override
  Widget build(BuildContext context) {    
     var assetsImage = new AssetImage('lib/assets/perfilmay.jpg');

      _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate = date);
        events.forEach((event) => print(event.title));
      },
      weekendTextStyle: TextStyle(
        color: Colors.indigo[900],
      ),
      thisMonthDayBorderColor: Colors.grey,
//          weekDays: null, /// for pass null when you do not want to render weekDays
      headerText: 'Custom Header',
      weekFormat: true,
      markedDatesMap: _markedDateMap,
      height: 200.0,
      selectedDateTime: _currentDate2,
      showIconBehindDayText: true,
//          daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 2,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      markedDateIconBuilder: (event) {
        return event.icon;
      },
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      todayButtonColor: Colors.transparent,
      todayBorderColor: Colors.indigo[900],
      markedDateMoreShowTotal:
          true, // null for not showing hidden events indicator
//          markedDateIconMargin: 9,
//          markedDateIconOffset: 3,
    );

    /// Example Calendar Carousel without header and custom prev & next button
    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.indigo[900],
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
        events.forEach((event) => print(event.title));
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      thisMonthDayBorderColor: Colors.grey,
      weekFormat: false,
//      firstDayOfWeek: 4,
      markedDatesMap: _markedDateMap,
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder: CircleBorder(
        side: BorderSide(color: Colors.yellow)
      ),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      showHeader: false,
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      // markedDateShowIcon: true,
      // markedDateIconMaxShown: 2,
      // markedDateIconBuilder: (event) {
      //   return event.icon;
      // },
      // markedDateMoreShowTotal:
      //     true,
      todayButtonColor: Colors.yellow,
      selectedDayTextStyle: TextStyle(
        color: Colors.yellow,
      ),
      minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: 16,
        color: Colors.pinkAccent,
      ),
      inactiveDaysTextStyle: TextStyle(
        color: Colors.tealAccent,
        fontSize: 16,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        actionsIconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(_titleProgress,style: TextStyle(color: Colors.black)), 
        backgroundColor: appbar ,// we show the progress in the title...
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.black,
            onPressed: () {
              _getEmployees();
            },
          )
       ],
      ),
      drawer: new Drawer(
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
          onPressed: (){
            _createTable();
            Navigator.push(context, MaterialPageRoute(builder: (context) => Add())
            );
          },
          child: Icon(Icons.add)) ,
      body: 
        SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            /* Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: _calendarCarousel,
              ),*/
             Divider(height: 15.0,),
             Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                //margin: EdgeInsets.only(top:30.0,bottom:16.0,left:16.0,right:16.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[                    
                    FlatButton(
                      child: Icon(Icons.navigate_before,size: 35,),
                      onPressed: (){
                        setState(() {
                          _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month -1);
                          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                        });
                      },                      
                    ),
                    //Spacer(flex: 1,),
                    Expanded(child: 
                      Center(child: Text(_currentMonth,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0,),)),
                    ),
                    FlatButton(
                        child: Icon(Icons.navigate_next,size: 35,),
                        onPressed: (){
                         setState(() {
                          _targetDateTime = DateTime(_targetDateTime.year, _targetDateTime.month +1);
                          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
                        });
                        }, 
                    )
                  ],
                ),
             ),
             Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: _calendarCarouselNoHeader,
             ),
            /*TableCalendar(
              calendarStyle: CalendarStyle(
                todayColor: Colors.amber
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true
              ),
              calendarController: _controller,),*/
            DataTable(
              sortColumnIndex: 1,
              sortAscending: true,
            columns: [
              DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: Text(
                  'Turmas',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Ubuntu'),),
              ),
              // Uma coluna pra mostrar o button Delete
              DataColumn(
                label: Text(''),
              )
            ],
            rows: _employees
              .map(
                (employee) => DataRow(cells: [
                  DataCell(
                    Text(employee.datatreino,
                    style: TextStyle(
                    fontFamily: 'Ubuntu'),),
                    
                    // Add tap in the row and populate the
                    // textfields with the corresponding values to update
                    onTap: () {
                       
                      _showValues(employee);
                      // Set the Selected employee to Update
                      _selectedEmployee = employee;
                      setState(() {
                        _isUpdating = true;
                      log(_selectedEmployee.firstName);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Items(employee: _selectedEmployee,)));
                      });
                    },
                  ),
                  DataCell(
                    Text(
                      employee.firstName.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Ubuntu'),
                    ),
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Items(employee: _selectedEmployee,)));
                      _showValues(employee);
                      // Set the Selected employee to Update
                      _selectedEmployee = employee;
                      // Set flag updating to true to indicate in Update Mode
                      setState(() {
                        _isUpdating = true;
                      });
                    },
                  ),
                  DataCell(IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteEmployee(employee);
                    },
                  ))
                ]),
              )
              .toList(),), 
            _isUpdating
                ? Row(
                    children: <Widget>[
                      OutlineButton(
                        child: Text('UPDATE'),
                        onPressed: () {
                          _updateEmployee(_selectedEmployee);
                        },
                      ),
                      OutlineButton(
                        child: Text('CANCEL'),
                        onPressed: () {
                          setState(() {
                            _isUpdating = false;
                          });
                          _clearValues();
                        },
                      ),
                    ],
                  )
                : Container(), 
                   
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