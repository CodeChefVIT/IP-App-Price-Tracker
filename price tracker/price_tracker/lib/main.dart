import 'package:flutter/material.dart';
import 'package:price_tracker/screens/register_screen.dart';
import './screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:price_tracker/providers/Auth.dart';
import './screens/Tracker_screen.dart';
import './screens/Search.dart';
import './utilities/Loadingscreen.dart';
import './screens/GetDaysInfo.dart';

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
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.isAuth
              ? Tracker_screen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, res) {
                    if (res.connectionState == ConnectionState.waiting) {
                      return LoadingScreen();
                    } else {
                      if (res.data) {
                        return Tracker_screen();
                      } else {
                        return LoginScreen();
                      }
                    }
                  },
                ),
        ),
      ),
      );
  }
}