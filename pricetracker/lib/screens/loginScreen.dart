import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 10 / 100,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "This is Primary Text",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: size.height * 5 / 100,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              "This is Secondary Text",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          SizedBox(
            height: size.height * 2 / 100,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.width * 5 / 100),
            height: 1,
            color: Theme.of(context).backgroundColor,
          ),
          SizedBox(
            height: size.height * 2 / 100,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).accentColor,
            ),
            alignment: Alignment.center,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: size.width * 15 / 100),
            child: FlatButton(
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: size.height * 2 / 100),
                child: Text(
                  "Press Me",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
