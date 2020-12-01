import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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
        accentColor: Color(0xff5effa7),
        backgroundColor: Color(0xff212121),
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
            color: Color(0xff5effa7),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline2: GoogleFonts.montserrat(
            color: Color(0xff000000),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: GoogleFonts.montserrat(
            color: Color(0xfff0f0f0),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      theme: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        canvasColor: Color(0xffffffff),
        accentColor: Color(0xff43e0a7),
        backgroundColor: Color(0xfff0f0f0),
        textTheme: TextTheme(
          headline1: GoogleFonts.montserrat(
            color: Color(0xff43e0a7),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headline2: GoogleFonts.montserrat(
            color: Color(0xffffffff),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          bodyText1: GoogleFonts.montserrat(
            color: Color(0xff141414),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}
//00ed6c
