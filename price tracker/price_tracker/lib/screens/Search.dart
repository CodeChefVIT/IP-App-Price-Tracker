import 'package:flutter/material.dart';
import './Tracker_screen.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:price_tracker/providers/Auth.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String _day;
 String _apparel,_medical, _grocery,_miscelleneous;
 final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Future<void> search(String day) async 
  {
     try {
        
     final body = await Provider.of<Auth>(context, listen: false ).search(day);
     _apparel=body['apparel'];
     _grocery=body['grocery'];
     _medical=body['medical'];
     _miscelleneous=body['miscellaneous'];
      
    } catch(e)
    {
      print(e);
    }
       
  }
    List<String> Days = [
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
];
String selectedDay = 'monday';
  DropdownButton<String> androidDropdown() {
    _day='monday';
    List<DropdownMenuItem<String>> dropdownItems = [];
    
    for (String Day in Days) {
      var newItem = DropdownMenuItem(
        child: Text(Day),
        value: Day,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedDay,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedDay = value;
          _day=selectedDay;
          search(_day);
        });
      },
    );
  }
  CupertinoPicker iOSPicker() {
    _day='monday';
    List<Text> pickerItems = [];
    for (String Day in Days) {
      pickerItems.add(Text(Day));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
        setState(() {
          selectedDay = Days[selectedIndex]; 
            _day=selectedDay;
            search(_day);
        });
      },
      children: pickerItems,
    );
  }
  

  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
       title:Center(child: Text('Search Expenses'),),
        backgroundColor: Colors.teal[800],
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
        onPressed:(){ Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Tracker_screen(),),
        );},
                        ),
      ),
      body: SafeArea(
        child:  Container(
          child:SingleChildScrollView(
            
                      child: Form(
                        key: _formKey,
               child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[ Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(' CHOOSE DAY',
                    style: TextStyle(
                        fontSize:18.0,
                        fontWeight: FontWeight.w800,
                        color:Colors.teal,
                    ),),
                    SizedBox(
                        width:50.0,
                    ),
                
                 Container(
                height: 100.0,
                alignment: Alignment.center,
                padding: EdgeInsets.all(30.0),
                
                child: Platform.isIOS ? iOSPicker() : androidDropdown(),
            ),],
            ),
            Expense(text: 'APPAREL', ),
            SizedBox(height: 10.0),
            Expense(text: 'MEDICAL', ),
            SizedBox(height: 10.0),
            Expense(text: 'GROCERY', ),
            SizedBox(height: 10.0),
            Expense(text: 'MISCELLANEOUS', ),

                  ],
              ),
               ),
                      ),
          ),
        ),
      ),

    );
      
    
  }
}
class Expense extends StatelessWidget {
  Expense({this.text,this.amount});
  final String text;
  final String amount;
  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
        
      title: Text(text,style: TextStyle(color: Colors.teal),),
      
      ),
    );
  }
}
//Container(
    //            color:Colors.teal,
  //              height:80.0,
      //          width:360.0,
        //        child: Center(
          //        child: TextFormField(
            //                 decoration: InputDecoration(
              //                 filled: true,
                //               fillColor: Colors.white,
                  //            labelText: 'Enter a day',
                    //           border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                               
                      //      ),
             // ),
               // ),
            // )
//
//
//
//
//
//
//
//
//
