import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController income = TextEditingController();
  TextEditingController spent = TextEditingController();
  TextEditingController age = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).canvasColor,
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          "Sign Up",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            textStyle: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 5 / 100,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 5 / 100,
                  right: size.width * 5 / 100,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: name,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      FontAwesomeIcons.userAlt,
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
                    hintText: "Name",
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
                height: size.height * 2 / 100,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: size.width * 5 / 100,
                  right: size.width * 5 / 100,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: income,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      FontAwesomeIcons.rupeeSign,
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
                    hintText: "Income",
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
                  controller: spent,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBill,
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
                    hintText: "Spent",
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
                  controller: age,
                  style: GoogleFonts.montserrat(
                    textStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  keyboardType: TextInputType.number,
                  cursorColor: Theme.of(context).accentColor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    prefixIcon: Icon(
                      FontAwesomeIcons.hourglassHalf,
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
                    hintText: "Age",
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
                      "Sign Up",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        textStyle: Theme.of(context).textTheme.headline2,
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
