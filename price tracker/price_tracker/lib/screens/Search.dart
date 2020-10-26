import 'package:flutter/material.dart';
import './Tracker_screen.dart';
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:price_tracker/providers/Auth.dart';
import 'package:provider/provider.dart';
import './GetDaysInfo.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool number = false ;
  String _day;
 int _apparel,_medical, _grocery,_miscelleneous;
 final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Future<void> search(String day) async 
  {
     try {
        
     final body = await Provider.of<Auth>(context, listen: false ).search(day);

     print('came back');
     setState(() {
      _apparel= body['task']['apparel'];
     _grocery=body['task']['grocery'];
     _medical=  body['task']['medical'];
     _miscelleneous=  body['task']['miscellaneous'];
      });
     number =true ;
     print('true');
     print(_apparel);
     print(_grocery);
     print(_medical);
     print(_miscelleneous);

      
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
             actions: <Widget>[
               IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: ()  => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => GetDaysInfo(),
                      ),
                      )
            ),
             ],           
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
            Expense(text: 'APPAREL',child: number?Text(_apparel.toString()):null ),
            SizedBox(height: 10.0),
            Expense(text: 'MEDICAL',child: number?Text(_medical.toString()):null, ),
            SizedBox(height: 10.0),
            Expense(text: 'GROCERY',child:number? Text(_grocery.toString()):null),
            SizedBox(height: 10.0),
            Expense(text: 'MISCELLANEOUS',child:number? Text(_miscelleneous.toString()):null ),

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
  Expense({this.text,this.amount,this.child});
  final String text;
  final String amount;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
        
      title: Text(text,style: TextStyle(color: Colors.teal),),
      trailing: child,
      
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
