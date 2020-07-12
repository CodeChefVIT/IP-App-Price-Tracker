import 'package:price_tracker/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:price_tracker/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
   
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return  Scaffold(
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
                    ' Register here',
                    style: TextStyle(
                      color:Colors.teal[800],
                      fontSize: 38.0,
                      fontWeight: FontWeight.bold

                    ),
                  
                  ),
                  SizedBox(
                    height: 50,
                  ),
                 
                 
                  Container(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                      
                      ),
                      validator: (value) 
                      {
                        if (value == '') {
                          return 'This field is required.';
                        }
                        else
                        {
                          return '';
                        }
                      },
                      onSaved: (value) {
                        _userData['name'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                        else
                        {
                          return '';
                        }
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
                      validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                        else
                        {
                          return '';
                        }
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
                     minWidth: 150,
                    height: 50,
                     color: Colors.cyan[100],
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        color: Colors.teal[700],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    ),
                   
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
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.teal[700],
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => LoginScreen(),
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