import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:xetia_shop/screens/components/my_textfield.dart';
import 'package:xetia_shop/screens/constants.dart';
import 'package:xetia_shop/screens/sign_up_password.dart';

import 'components/my_button.dart';

class SignUpNameScreen extends StatefulWidget {
  static const name = "/signUpName";

  @override
  _SignUpNameScreenState createState() => _SignUpNameScreenState();
}

class _SignUpNameScreenState extends State<SignUpNameScreen> {
  final _formKey = GlobalKey<FormState>();

  String first = "";
  String last = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: kBoxDecoration(kOrange),
                    child: Center(
                        child: IconButton(
                            onPressed: () {
                              // showLanguage(context, isDark, Colors.white);
                            },
                            icon: Icon(
                              Icons.language,
                              size: 28,
                              color: Colors.white,
                            ))),
                  ),
                  SizedBox(height: 40),
                  Text("hello", style: false ? kHeaderStyle : kDarkHeaderStyle),
                ],
              ),
              Column(
                children: [
                  MyTextField(
                    textInputType: TextInputType.name,
                    controller: first,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter some text";
                      }
                      return null;
                    },
                    hintText: "first name",
                    iconData: Icons.person,
                    onChanged: (value) {
                      first = value;
                    },
                    color: kOrange,
                    isDark: false,
                  ),
                  SizedBox(height: 15),
                  MyTextField(
                    textInputType: TextInputType.name,
                    controller: last,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "please enter some text";
                      }
                      return null;
                    },
                    hintText: "last name",
                    iconData: Icons.person,
                    onChanged: (value) {
                      last = value;
                    },
                    color: kOrange,
                    isDark: false,
                  ),
                  SizedBox(height: 15),
                  MyTextField(
                    textInputType: TextInputType.name,
                    controller: email,
                    validator: (value) {
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.toString());
                      if (value.isEmpty) {
                        return "please enter some text";
                      } else if (!emailValid) {
                        return "the email is invalid";
                      } else {
                        return null;
                      }
                    },
                    hintText: "email",
                    iconData: Icons.email,
                    onChanged: (value) {
                      email = value;
                    },
                    color: kOrange,
                    isDark: false,
                  ),
                ],
              ),
              Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ButtonIcon(
                        color: kOrange,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        icon: Icons.arrow_left,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: MyButton(
                        color: kOrange,
                        onTap: () {
                          if (!_formKey.currentState.validate()) {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: SignUpPasswordScreen(
                                    first: first, last: last, email: email),
                              ),
                            );
                          }
                        },
                        text: "next",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
