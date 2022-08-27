import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class SignInBackground extends StatelessWidget {
  /// Here is your constructor
  SignInBackground();

  @override
  Widget build(BuildContext context) {
    return _buildSignInBackground(context);
  }

  Widget _buildSignInBackground(BuildContext context) {
    return Container(
      color: TinyColor(Theme.of(context).cardColor).darken(12).color,
      width: MediaQuery.of(context).size.width,
      height: (MediaQuery.of(context).size.height / 3 * 2 +
          ((MediaQuery.of(context).size.height / 3) -
              ((MediaQuery.of(context).size.height / 3) - 150))),
      // color: Colors.yellow,
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            // color: Colors.white,
            margin: EdgeInsets.only(left: 30),
            height: 25,
            width: 110,
            // alignment: Alignment.topCenter,
            child: Image.asset('assets/images/microsoftlogo.png',
                fit: BoxFit.fill),
          ),
          SizedBox(
            height: 625,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 30, right: 20),
                child: Text(
                  'Terms of Use',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Text(
                  'Privacy and Cookies',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Text(
                  '...',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
