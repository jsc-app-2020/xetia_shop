import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xetia_shop/screens/sign_up_name.dart';

import 'components/my_button.dart';
import 'components/my_textfield.dart';
import 'components/my_textfield_password.dart';
import 'constants.dart';

class SignInScreen extends StatefulWidget {
  static const name = "/signIn";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "";
  String password = "";
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: kOrange,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    blurRadius: 4,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: Center(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.language,
                                      size: 28,
                                      color: Colors.white,
                                    ))),
                          ),
                          SizedBox(height: 40),
                          Text("Welcome",
                              style: kCustomBoldStyle(50, Colors.black)),
                          Text("Sign in to Continue",
                              style: kCustomBoldStyle(24, Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 60),
                      Column(
                        children: [
                          MyTextField(
                            isDark: false,
                            textInputType: TextInputType.emailAddress,
                            controller: email,
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value.toString());
                              if (value.isEmpty) {
                                return "Please enter some text";
                              } else if (!emailValid) {
                                return "The email is not valid";
                              } else {
                                return null;
                              }
                            },
                            hintText: "email",
                            iconData: Icons.email,
                            onChanged: (value) {
                              email = value;
                            },
                            color: kYellow,
                          ),
                          SizedBox(height: 30),
                          MyTextFieldPassword(
                            isDark: false,
                            controller: password,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter some text";
                              }
                            },
                            onChanged: (value) {
                              password = value;
                            },
                            hintText: "your password",
                            isObscure: isObscure,
                            onObscure: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Column(
                        children: [
                          MyButton(
                            color: kGreen,
                            onTap: () {
                              Navigator.pushNamed(context, "/home");
                              // if (email.isEmpty || password.isEmpty) {
                              //   Fluttertoast.showToast(
                              //     msg: "fill_your_data",
                              //     backgroundColor: kRed,
                              //   );
                              //   return;
                              // }
                            },
                            text: "sign in",
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                              child: Text("forgot password", style: kGreyStyle),
                              onTap: () {}),
                        ],
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "or_sign_in_with",
                                  textAlign: TextAlign.center,
                                  style: kCustomBoldStyle(16, Colors.white),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                child: SvgPicture.asset(
                                  "assets/svg/google.svg",
                                  height: 30,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                child: SvgPicture.asset(
                                  "assets/svg/twitter.svg",
                                  height: 30,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                child: SvgPicture.asset(
                                  "assets/svg/github.svg",
                                  height: 30,
                                ),
                              ),
                              CircleAvatar(
                                radius: 30,
                                child: SvgPicture.asset(
                                  "assets/svg/facebook.svg",
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          MyButton(
                            color: kOrange,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignUpNameScreen.name);
                            },
                            text: "Create a Account",
                          ),
                          SizedBox(height: 75),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
