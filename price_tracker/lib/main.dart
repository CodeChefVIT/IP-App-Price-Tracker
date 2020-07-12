import 'package:flutter/material.dart';
import './screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:price_tracker/providers/Auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ), 
      ],
      child: Consumer<Auth>
      (builder: (context, auth, _) =>
       MaterialApp(
          debugShowCheckedModeBanner: false,
          home:LoginScreen(),
          ),
      ),
      );
  }
}