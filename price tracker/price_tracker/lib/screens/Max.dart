import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:price_tracker/providers/Auth.dart';
import 'package:provider/provider.dart';
import './Tracker_screen.dart';

class Max extends StatefulWidget {
  @override
  _MaxState createState() => _MaxState();
}

class _MaxState extends State<Max> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String,String> userData ={};
  final apparelController =TextEditingController();
 final groceriesController =TextEditingController();
   final medicalController =TextEditingController();
   final miscellaneousController =TextEditingController();

   Future<void> submit() async
   {
     if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
      try {
        print('enter');
        print(userData);
      await Provider.of<Auth>(context, listen: false).inputMax(userData);
      print('success');
      

    } catch(e)
    {
      print(e);
    }
   }

   void initState() {
    super.initState();
    Provider.of<Auth>(context, listen: false).getMax();
    
   apparelController.text=  Provider.of<Auth>(context, listen: false).app().toString();
   groceriesController.text= Provider.of<Auth>(context, listen: false).gro().toString();
   medicalController.text=Provider.of<Auth>(context, listen: false).med().toString();
   miscellaneousController.text= Provider.of<Auth>(context, listen: false).mis().toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         title:Center(child: Text('Set Limits'),),
         leading: IconButton(
          icon:Icon(Icons.arrow_back),
        onPressed:(){ Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Tracker_screen(),),
        );},
                        ),
        backgroundColor: Colors.teal[800],
      ),
       body: SafeArea(child: 
      SingleChildScrollView(
        child:Form(
          key: _formKey,
                  child: Container(
          padding:EdgeInsets.all(15.0),
          child:
            Column(
              children: <Widget>[
                ProfileContainer(text: 'Maximum limit for Apparel',controller: apparelController,
                 onSaved: (value)
                 { userData['Maxapparel']=value ;
                 },),
                ProfileContainer(text: 'Maximum limit for Groceries',controller: groceriesController,
                onSaved: (value)
                {
                  userData['Maxgrocery']=value;
                },
                ),
      
                ProfileContainer(text: 'Maximum limit for Medical',controller: medicalController,
                onSaved: (value)
                {
                  userData['Maxmedical']=value;
                },
                ),
                ProfileContainer(text: 'Maximum limit for Miscellaneous',controller: miscellaneousController,
                onSaved: (value)
                {
                  userData['Maxmiscellaneous']=value;
                },
                ),

                SizedBox(height: 30.0,),
                 MaterialButton(
                       minWidth: 150,
                      height: 50,
                       color: Colors.cyan[100],
                      child: Text(
                        'CHANGE DETAILS',
                        style: TextStyle(
                          color: Colors.teal[700],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                      ),
                     
                      onPressed: submit,
                    
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
class ProfileContainer extends StatelessWidget {
  ProfileContainer({this.text,this.controller,this.onSaved});
  final String text;
  final TextEditingController controller;
  final Function onSaved;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: 370.0,
      
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    SizedBox(
                      height:30.0,
                    ),
                    Text(text,style :TextStyle(color:Colors.teal ,fontWeight: FontWeight.w800,fontSize: 20.0)),
                        SizedBox(height: 5.0,),
                        TextFormField(
                          
                          controller: controller,
                          decoration: InputDecoration(),
                          onSaved: onSaved,
                            
                          
                        ),

                  ],
                ),);
  }
}