import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pricetracker/animations/BounceIn.dart';
import 'package:pricetracker/screens/signupScreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 25 / 100,
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: size.width * 5 / 100),
                width: double.infinity,
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                height: size.height * 4 / 100,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 5 / 100,
                  right: size.width * 5 / 100,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: email,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      color: Theme.of(context).accentColor,
                      size: 20,
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).backgroundColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).backgroundColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Email-ID",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: size.height * 2 / 100,
                      fontWeight: FontWeight.w300,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 2 / 100,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 5 / 100,
                  right: size.width * 5 / 100,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: password,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  obscureText: _isHidden,
                  obscuringCharacter: "*",
                  keyboardType: TextInputType.text,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      FontAwesomeIcons.lock,
                      color: Theme.of(context).accentColor,
                      size: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isHidden ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                        color: Theme.of(context).accentColor,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Theme.of(context).backgroundColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).backgroundColor,
                        width: 1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      gapPadding: 1,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        color: Theme.of(context).accentColor,
                        width: 1,
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.montserrat(
                      fontSize: size.height * 2 / 100,
                      fontWeight: FontWeight.w300,
                      textStyle: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 5 / 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).accentColor,
                ),
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width * 25 / 100),
                child: FlatButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: size.height * 2 / 100),
                    child: Text(
                      "Login",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        textStyle: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 3 / 100,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "--- OR ---",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 3 / 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).canvasColor,
                  border: Border.all(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.width * 25 / 100),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      BounceIn(
                        widget: SignUpScreen(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: size.height * 2 / 100),
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textStyle: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
