import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:price_tracker/providers/Auth.dart';
import 'package:price_tracker/screens/Tracker_screen.dart';
import 'package:provider/provider.dart';
import 'package:price_tracker/providers/Auth.dart';
import 'login_screen.dart';

class Profile extends StatefulWidget {
  @override
  
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
   final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String,String> userData ={};
  final nameController =TextEditingController();
 final ageController =TextEditingController();
   final emailController =TextEditingController();
   final incomeController =TextEditingController();

   Future<void> submit() async
   {
     if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
      try {
        print('enter');
        print(userData);
      await Provider.of<Auth>(context, listen: false).Profile(userData);
      print('success');
      

    } catch(e)
    {
      print(e);
    }
   }
   Future<void> delete() async
   {
     try {
await Provider.of<Auth>(context, listen: false).deleteUser();
print('success');
     }
     catch(e)
     {
       print(e);
     }
   }

  @override
  void initState() {
    super.initState();
   nameController.text= Provider.of<Auth>(context, listen: false).name();
   ageController.text= Provider.of<Auth>(context, listen: false).age().toString();
   emailController.text=Auth.email();
   incomeController.text= Provider.of<Auth>(context, listen: false).income().toString();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         actions: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
              icon:Icon( Icons.person_outline),
              
              onPressed: () async
              {
                 try {
            await Provider.of<Auth>(context, listen: false).logout();
             Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => LoginScreen(),
                      ),);
                 } catch(e)
               {
                print(e);
                  }
              },
            ),
            Text('Log out ',)
          ],
        )
      ],
        automaticallyImplyLeading: true,
        title:Center(child: Text('Profile'),),
        backgroundColor: Colors.teal[800],
        leading: IconButton(
          icon:Icon(Icons.arrow_back),
        onPressed:(){ Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (ctx) => Tracker_screen(),),
        );},
                        ),
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
                ProfileContainer(text: 'NAME',controller: nameController,
                 onSaved: (value)
                 { userData['name']=value ;
                 },),
                ProfileContainer(text: 'AGE',controller: ageController,
                onSaved: (value)
                {
                  userData['age']=value;
                },
                ),
      
                ProfileContainer(text: 'INCOME',controller: incomeController,
                onSaved: (value)
                {
                  userData['income']=value;
                },
                ),
                ProfileContainer(text: 'Email',controller: emailController,
                onSaved: (value)
                {
                  userData['email']=value;
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
                    SizedBox(
                      height: 15.0,
                    ),
                 MaterialButton(
                       minWidth: 150,
                      height: 50,
                       color: Colors.cyan[100],
                      child: Text(
                        'DELETE ACCOUNT',
                        style: TextStyle(
                          color: Colors.teal[700],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                      ),
                     
                      onPressed: delete,
                    
                    ),
                
              ],
            ),
          ),
        ), 
      ),),
      
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

            