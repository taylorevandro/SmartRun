import 'dart:convert';
import 'package:http/http.dart'
    as http; // add the http plugin in pubspec.yaml file.
import 'Compras.dart';
 
class Services {
  static const ROOT = 'http://192.168.1.8/EmployeesDB/compras.php';
  static const _CREATE_TABLE_COMP_ACTION = 'CREATE_TABLE_COMP';
  static const _GET_ALL_COMP_ACTION = 'GET_ALL_COMP';
  static const _ADD_COMP_ACTION = 'ADD_COMP';
  static const _UPDATE_COMP_ACTION = 'UPDATE_COMP';
  static const _DELETE_COMP_ACTION = 'DELETE_COMP';
  
  // Method to create the table Employees.
  static Future<String> createTableComp() async {
    try {
      // add the parameters to pass to the request.
      var map = Map<String, dynamic>();
      map['action'] = _CREATE_TABLE_COMP_ACTION;
      final response = await http.post(ROOT, body: map);
      print('Create Table Comp Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } 
      catch (e) 
      {
      return "error";
    }
  }
 
  static Future<List<Compra>> getCompra() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _GET_ALL_COMP_ACTION;
      final response = await http.post(ROOT, body: map);
      print('getCompra Response: ${response.body}');
      if (200 == response.statusCode) {
        List<Compra> list = parseResponse(response.body);
        return list;
      } else {
        return List<Compra>();
      }
    } catch (e) {
      return List<Compra>(); // return an empty list on exception/error
    }
  }
 
  static List<Compra> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Compra>((json) => Compra.fromJson(json)).toList();
  }
 
  // Method to add employee to the database...
  static Future<String> addCompra(String mesreferente, String bandeiracartao, String pago) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _ADD_COMP_ACTION;
      map['mes_referente'] = mesreferente;
      map['bandeira_cartao'] = bandeiracartao;
      map['pago'] = pago;
      final response = await http.post(ROOT, body: map);
      print('addCompra Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 
  // Method to update an Employee in Database...
  static Future<String> updateCompra(
      String compId, String mesreferente, String bandeiracartao, String pago) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _UPDATE_COMP_ACTION;
      map['comp_id'] = compId;
      map['mes_referente'] = mesreferente;
      map['bandeira_cartao'] = bandeiracartao;
      map['pago'] = pago;
      final response = await http.post(ROOT, body: map);
      print('updateCompra Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
 
  // Method to Delete an Employee from Database...
  static Future<String> deleteCompra(String compId) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = _DELETE_COMP_ACTION;
      map['comp_id'] = compId;
      final response = await http.post(ROOT, body: map);
      print('deleteCompra Response: ${response.body}');
      if (200 == response.statusCode) {
        return response.body;
      } else {
        return "error";
      }
    } catch (e) {
      return "error"; // returning just an "error" string to keep this simple...
    }
  }
}