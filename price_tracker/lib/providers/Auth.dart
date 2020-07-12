import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:price_tracker/utilities/httpEception.dart';


class Auth with ChangeNotifier
{
  String _token;
  String _email;

  String email() 
  {
    return _email;
  }
  String  token() 
{
    return _token ;
  }


  Future<void> login( Map<String, String> userData) async {
    final url='';
    try {
      final response = await http.post(
        url,
      );
      print(response.body);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        _token =  resBody['token'];
        _email=  userData['email'];
        final prefs = await SharedPreferences.getInstance();
        final _prefsData = json.encode({
          'token': _token,
          'email': _email, 
        });
        await prefs.setString('userData', _prefsData);
        notifyListeners();
      } 
      else {
        throw HttpException('Login Failed');
      }
    } 
    catch (e) {
      throw e;
    }
  }
  Future<void> signUp (Map<String, String> userData) async
   {
    final url = '';
    try {
      final response = await http.post(
        url,
      );
      print(response.body);
      if (response.statusCode == 200) {
        print ('successful') ;
      } 
      else {
       throw HttpException('Signup incomplete');
      }
    } 
    catch (e) {
      throw e;
    }
  }
   Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _token = null;
    _email = null;
    notifyListeners();
  }
}


