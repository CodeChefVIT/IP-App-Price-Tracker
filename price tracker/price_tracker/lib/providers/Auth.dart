import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:price_tracker/screens/GetDaysInfo.dart';
import 'package:price_tracker/screens/Profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:price_tracker/utilities/httpEception.dart';


class Auth with ChangeNotifier
{
   static String _token;
  static String _email;
   static String _name;
 static  int _age;
   static int _income;
    static int _total;
    static int _maxapparel;
    static int _maxgro; static int _maxmed; static int _maxmis;

  static String email() 
  {
    return _email;
  }
   static String token()
{
    return _token ;
  }
   int income()
  {
    return _income;
  }
    int age()
  {
    return _age;
  }
     String  name()
  {
    return _name;
  }
  int total()
  {
    return _total;
  }
   bool get isAuth {
    return token != null;
  }
  int  gro() => _maxgro;
  int  med() => _maxmed; int  app() => _maxapparel; int  mis() => _maxmis;


  Future<void> login( Map<String, String> userData) async {
    final url='https://ipprice-tracker-api.herokuapp.com/users/login';
    try {
     
      final response = await http.post(
        url,
        body:{ "email":userData['email'],
       	"password":userData['password']},
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        final resBody = json.decode(response.body);
        
        _token =  resBody['token'];
      
        _email=  userData['email'];
        
        _age= resBody['user']['age'];
         
        _income=resBody['user']['income'];
        
        _name=resBody['user']['name'];
      
        
      
        final prefs = await SharedPreferences.getInstance();
        final _prefsData = json.encode(
          {
          'token': _token,
          'email': _email, 
          'name':_name,
          'income':_income,
          'age':_age,
        }
        
        );
        await prefs.setString('userData', _prefsData);
        print(_token);
        getMax();   
        print ('successful') ;
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
    final url = 'https://ipprice-tracker-api.herokuapp.com/users';
    try {
      print('one');
      final response = await http.post(
        url,
        body: {
	     "name":userData['name'],
	       "income":userData['income'], 	
	        "email":userData['email'],
	       "password":userData['password'],
	          "age":userData['age'],
           },
      );
       
      if (response.statusCode == 201) {
        print ('successful') ;
        final resBody = json.decode(response.body);
        _token =  resBody['_id'];
        _email=  userData['email'];
        _age= int.parse(userData['age']);
        _income= int.parse( userData['income']);
        _name=userData['name'];
      
      } 
      else {
       print('three');
       throw HttpException('Signup incomplete');
      }
    } 
    catch (e) {
      throw e;
    }
  }
  Future<void> deleteUser() async
  {
final url ='https://ipprice-tracker-api.herokuapp.com/users/me';
try{
  final response= await http.delete(url);
  if(response.statusCode==200)
  {
    logout();
  }
  else{
    print(response.statusCode);
     throw HttpException('Could not be completed');
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
  Future<void> getDetails() async
  {
    print('one');
    final url="https://ipprice-tracker-api.herokuapp.com/tasks";
    try{
      final response = await http.get(url);
    print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
       final resBody = json.decode(response.body);
       _name=resBody['name'];
       _age=resBody['age'];
       _email=resBody['email'];
       _income=resBody['income'];
       notifyListeners();
      }
       else {
        throw HttpException('Could not be completed');
      }}
    catch (e) {
      throw e;
    }
  }

  Future<void> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    print('object');
    if (!prefs.containsKey('userData')) {
      return false;
    }
     await getDetails();
    final getUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    _token = getUserData['token'];
    _email = getUserData['email'];
    _income=getUserData['income'];
    _age=getUserData['age'];
    _name=getUserData['name'];
    notifyListeners();
    return true;
  }

Future<void> tracker(Map<String, String> userdata) async {
    final url = 'https://ipprice-tracker-api.herokuapp.com/tasks';
    try {
      final response = await http.post(
        url,  
         headers: {
          'Content-Type': 'application/json',
          'Authorization':'Bearer ' +_token,
        },	
	         body: json.encode(userdata),
      );
      print(url);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
       final resBody = json.decode(response.body);
      _total =resBody['totalDaySpent'];
      notifyListeners();
      } 
      else {
        throw HttpException('Could not be completed');
      }
    } catch (e) {
      throw e;
    }
  }
  Future<void> Profile(Map<String, String> userdata) async {
    final url = 'https://ipprice-tracker-api.herokuapp.com/users/me';
    print('entered');
    try {
      final response = await http.patch(
        url,     
        headers: {
          'Content-Type': 'application/json',
          'Authorization':'Bearer ' +_token,
        },	
	         body: json.encode(userdata),

      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
      final resBody = json.decode(response.body);
      _name=resBody['name'];
      _email=resBody['email'];
      _age=resBody['age'];
      _income=resBody['income'];
      notifyListeners();
      } 
      else {
        throw HttpException('Could not be completed');
      }
    } catch (e) {
      throw e;
    }
  }
  Future<dynamic> search(String day ) async {
    final url = 'https://ipprice-tracker-api.herokuapp.com/taskDays/$day';
    print('one');
    try {
      final response = await http.get(
        url,  
        headers: 
        {
          'Content-Type': 'application/json',
          'Authorization':'Bearer ' +_token,
        }
           );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
       final resBody = json.decode(response.body);
      return resBody;
      } 
      else {
        throw HttpException('Could not be completed');
      }
    } catch (e) {
      throw e;
    }
  }

   Future<dynamic> Upload(var image ) async {
    final url = 'https://ipprice-tracker-api.herokuapp.com/users/me/avatar';
    print('one');
    try {
      final response = await http.post(
        url,   
        body:json.encode(image)
           );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
       print('successful');
      } 
      else {
        throw HttpException('Could not be completed');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> GetDaysInfo(String day ) async {
    final url = 'https://ipprice-tracker-api.herokuapp.com/tasksDays/$day';
    print('two');
    try {
      final response = await http.get(
        url,  
        headers: {
          'Authorization':'Bearer ' +_token,
        }
           );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
       final resBody = json.decode(response.body);
      return resBody;
      } 
      else {
        throw HttpException('Could not be completed');
      }
    } catch (e) {
      throw e;
    }
  }
  Future<void> getMax() async
  {
    print('one');
    final url="https://ipprice-tracker-api.herokuapp.com/budgets";
    try{
      final response = await http.get(url,
      headers: {'Authorization':'Bearer ' +_token,});
    print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
       final resBody = json.decode(response.body);
            int length = resBody.length;
            print(length);
            
       _maxapparel=resBody[length-1]['Maxapparel'];
       _maxgro=resBody[length-1]['Maxgrocery'];
       _maxmed=resBody[length-1]['Maxmedical'];
       _maxmis=resBody[length-1]['Maxmiscellaneous'];
    
       notifyListeners();
      }
       else {
        throw HttpException('Could not be completed');
      }}
    catch (e) {
      throw e;
    }
  }

  Future<void> inputMax(Map<String, String> userdata) async {
    final url = 'https://ipprice-tracker-api.herokuapp.com/budgets';
    print('entered');
    try {
      final response = await http.post(
        url,     
        headers: {
          'Content-Type': 'application/json',
          'Authorization':'Bearer ' +_token,
        },	
	         body: json.encode(userdata),

      );
      print(url);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 201) {
      final resBody = json.decode(response.body);
      notifyListeners();
      } 
      else {
        throw HttpException('Could not be completed');
      }
    } catch (e) {
      throw e;
    }
  }


}
//"name":userdata['name'],
	//       "income":userdata['income'],
	  //     "age":userdata['age'],
	    //    "email":userdata['email'],   
      // "day":userdata['day'],
    //"apparel": userdata['apparel'],
    //"grocery": userdata['grocery'],
    //"medical": userdata['medical'],
    //"miscellaneous": userdata['miscellaneous'],




