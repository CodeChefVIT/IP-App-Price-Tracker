import 'package:flutter/material.dart';
import 'package:price_tracker/screens/register_screen.dart';

class LoginScreen 
 extends StatefulWidget {
    static const String id ='login';
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> 
{
  final GlobalKey<FormState> _formKey = GlobalKey();
   Map<String, String> _userData = {};
   Future<void> submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(_userData);
    
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    ' Price Tracker ',
                    style: TextStyle(
                      color:Colors.teal[800],
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold

                    ),
                  
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        
                        labelText: 'Email',
                        
                      ),
                      validator: (value)
                      {
                        if (value == '')
                         {
                         return 'This field is empty.';
                        }
                        return '';
                      },
                      onSaved: (value) {
                        _userData['email'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        
                      ),
                      validator: (value) 
                       {
                        if (value == '') {
                           return 'This field is empty.';
                        }
                        return '';
                      },
                      onSaved: (value) {
                        _userData['password'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.teal[700],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    
                    ),
                    color: Colors.cyan[100],
                    minWidth: 150,
                    height: 50,
                    onPressed: submit,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    color: Colors.cyan[100],
                    minWidth: 150,
                    height: 50,
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.teal[700],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    ),
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => RegisterScreen(),
                      ),
                    ),
                      
                    
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

 