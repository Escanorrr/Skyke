import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../controllers/welcome_controller.dart';

class signInOptions extends StatelessWidget {
  var controller = Get.find<WelcomeController>();
  @override
  Widget build(BuildContext context) {
    var signInBackgroungHeight = (MediaQuery.of(context).size.height / 3 * 2 +
        ((MediaQuery.of(context).size.height / 3) -
            ((MediaQuery.of(context).size.height / 3) - 150)));
    return Container(
      //color: Colors.red,
      width: MediaQuery.of(context).size.width,
      height: signInBackgroungHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 85,
          ),
          Container(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Text(
              'Sign-in options',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          //add a button size the whole width of the screen
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: RaisedButton(
                color: Theme.of(context).cardColor.darken(15),
                onPressed: () {
                  // Get.to(PhoneSignUp());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/github_logo.png'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Sign in with Github',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Icon(Icons.question_mark),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            child: RaisedButton(
                color: TinyColor(Theme.of(context).cardColor).darken(12).color,
                elevation: 0,
                //color: Colors.transparent,
                onPressed: () {
                  // Get.to(PhoneSignUp());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      size: 60,
                      Icons.question_mark,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot my username',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: 0,
                      child: SizedBox(
                        height: 60,
                        child: Icon(Icons.question_mark),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(left: 30, right: 30),
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Theme.of(context).cardColor.darken(13),
              child: Text(
                'Back',
              ),
              onPressed: () {
                controller.switchSignInOptionsBool();
                Future.delayed(Duration(milliseconds: 300), () {
                  controller.switchSignInMenuOpacity();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
