import 'package:price_tracker/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:price_tracker/screens/login_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
   
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _userData = {};
  Map<String,int> _userData2={};
  bool passwordVisible= true;
  void submit() async {
    if (! _formKey.currentState.validate()) {
      print('fddf');
      return;
    }
    _formKey.currentState.save();
    print(_userData);
     try {
      await Provider.of<Auth>(context, listen: false).signUp(_userData);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => LoginScreen(),
        ),
      );
    } catch (e) {
      await showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Error'),
          content: Text('Signup Could not be completed.'),
        ),
      );
    }
    
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
                    height: 30,
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
                       
                      },
                      onSaved: (value) {
                        _userData['name'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
              
                  Container(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Income',
                        
                      ),
                      validator: (value) {
                        if (value == '') {
                          return 'This field is required.';
                        }
                        
                      },
                      onSaved: (value) {
                        _userData['income'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Age',
                        
                      ),
        
                      onSaved: (value) {
                        _userData['age'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                       
                      },
                      onSaved: (value) {
                        _userData['email'] = value;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(
                      
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(icon: Icon(passwordVisible ? Icons.visibility_off : Icons.visibility,),
                                     onPressed:() {
                                   setState(() {
                                    passwordVisible = !passwordVisible;
                                });
                                },
                                ), 
                        
                      ),
                      validator: (value) {
                        if(value.length<8) {
                                  return 'Minimum 8 characters required';
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