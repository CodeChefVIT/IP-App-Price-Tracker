import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:price_tracker/providers/Auth.dart';
import 'package:provider/provider.dart';
import './Tracker_screen.dart';
class GetDaysInfo extends StatefulWidget {
  @override
  _GetDaysInfoState createState() => _GetDaysInfoState();
}

class _GetDaysInfoState extends State<GetDaysInfo> {
  bool _selected1 = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;
  bool _selected6 = false;
  bool _selected7 = false;
  
  bool isExpanded=false;
  bool number1=true;
  List<dynamic>Info=[];
  List<int> list;
  List<String> Days= [
  'monday',
  'tuesday',
  'wednesday',
  'thursday',
  'friday',
  'saturday',
  'sunday',
];

String _apparel,_medical, _grocery,_miscelleneous;

  
    void Listfinal()
    {
      int number =0;
      List<int>list1=[];
      if(number<= Info.length-1)
      {
      list1[number]=Info[number]['totalDaySpent'];
        number++;
      }
    list=list1;
    number1=false;
    }
  
  Future<void> searchDay(String day) async 
  {
     try {
        
     final body = await Provider.of<Auth>(context, listen: false ).GetDaysInfo(day);
      Info= body['task'];
      print(body['task']);
      Listfinal();
      
    } catch(e)
    {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
       title:Center(child: Text('Search Expenses for the past month'),),
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
          child:Column(
                           children: <Widget> [
                             Row(
                             children: <Widget>[
                               SizedBox(width:6.0),
            ChoiceChip(
           selected: _selected1,
               label: Text('Monday '),
             onSelected: (bool selected) {
                setState(() {
              _selected1 = !_selected1;
              _selected2 =_selected3=_selected4=_selected5=_selected6=_selected7=false;
              searchDay('Monday');
              });
             },
            ),
            SizedBox(width:6.0),
             ChoiceChip(
           selected: _selected2,
               label: Text('Tuesday'),
             onSelected: (bool selected) {
                setState(() {
              _selected2 = !_selected2;
              _selected1 =_selected3=_selected4=_selected5=_selected6=_selected7=false;
              searchDay('Tuesday');
              });
             },
            ),
            SizedBox(width:6.0),
             ChoiceChip(
           selected: _selected3,
               label: Text('Wednesday'),
             onSelected: (bool selected) {
                setState(() {
              _selected3 = !_selected3;
              _selected2 =_selected1=_selected4=_selected5=_selected6=_selected7=false;
              searchDay('wednesday');
              });
             },
            ),
            SizedBox(width:6.0),
             ChoiceChip(
           selected: _selected4,
               label: Text('Thursday'),
             onSelected: (bool selected) {
                setState(() {
              _selected4 = !_selected4;
              _selected2 =_selected3=_selected1=_selected5=_selected6=_selected7=false;
              searchDay('thursday');
              });
             },
            ),
                             ],),
              Row(
           children:<Widget>[
             SizedBox(width:6.0),
             ChoiceChip(
           selected: _selected5,
               label: Text('Friday'),
             onSelected: (bool selected) {
                setState(() {
              _selected5 = !_selected5;
              _selected2 =_selected3=_selected4=_selected1=_selected6=_selected7=false;
              searchDay('friday');
              });
             },
            ),
            SizedBox(width:6.0),
             ChoiceChip(
           selected: _selected6,
               label: Text('Saturday'),
             onSelected: (bool selected) {
                setState(() {
              _selected6 = !_selected6;
              _selected2 =_selected3=_selected4=_selected5=_selected1=_selected7=false;
              searchDay('Saturday');
              });
             },
            ),
            SizedBox(width:6.0),
            ChoiceChip(
           selected: _selected7,
               label: Text('Sunday'),
             onSelected: (bool selected) {
                setState(() {
              _selected7= !_selected7;
              _selected2 =_selected3=_selected4=_selected5=_selected6=_selected1=false;
              searchDay('Sunday');
              });
             },
            ),
           ],
              ),
              SizedBox(height:10.0),
              Expanded(
                              child: ListView(
                                children: <Widget>[
                                  Expense(text:'Latest Total',child:number1?null:Text(list[0].toString())),
                                  Expense(text:'Total for week3',child:number1?null:Text(list[1].toString())),
                                  Expense(text:'Total for week2',child:number1?null:Text(list[2].toString())),
                                  Expense(text:'Total for week1',child:number1?null:Text(list[3].toString())),
                                ],
                ),
              ),
          

          
                             ],
            ),
        ),
      ),

    );
      
    
  }
}
class Choicechip extends StatefulWidget {
 String text1;
  Choicechip(this.text1);
  @override
  _ChoicechipState createState() => _ChoicechipState();
}

class _ChoicechipState extends State<Choicechip> {
  String text ;

  bool _selected = false;
  
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
           selected: _selected,
                label: Text(text),
             onSelected: (bool selected) {
                 setState(() {
              _selected = !_selected;
               });
             },
            );
  }
}

class ContExp extends StatefulWidget {
  @override
  _ContExpState createState() => _ContExpState();
}

class _ContExpState extends State<ContExp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text('Total'),
        
      ],)
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
