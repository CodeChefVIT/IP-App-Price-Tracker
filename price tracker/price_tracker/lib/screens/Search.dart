import 'package:flutter/material.dart';
import './Tracker_screen.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:SafeArea(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Container(
            color: Colors.teal,
            child: Row(
                        children:<Widget>[ 
                          
                IconButton(
                
                  
            icon:Icon(Icons.arrow_back),
        onPressed:(){ Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => Tracker_screen(),),
        );},
                          ),
                          
                Container(
                color:Colors.teal,
                height:80.0,
                width:360.0,
                child: Center(
                  child: TextFormField(
                             decoration: InputDecoration(
                               filled: true,
                               fillColor: Colors.white,
                              labelText: 'Enter a day',
                               border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                               
                            ),
              ),
                ),
              ),
                        ],
            ),
          ),],
      )
      ),
      
    );
  }
}