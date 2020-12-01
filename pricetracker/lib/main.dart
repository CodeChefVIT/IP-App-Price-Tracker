import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pricetracker/screens/loginScreen.dart';

void main() {
  runApp(
    RestartWidget(
      child: MyApp(),
    ),
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        canvasColor: Color(0xff000000),
        accentColor: Color(0xffff4a4a),
        secondaryHeaderColor: Color(0xffff7070),
        backgroundColor: Color(0xff212121),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xff212121),
          ),
        ),
      ),
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        canvasColor: Color(0xffffffff),
        accentColor: Color(0xffff4a4a),
        secondaryHeaderColor: Color(0xffff7070),
        backgroundColor: Color(0xff212121),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Color(0xff212121),
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
