import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:xetia_shop/components/my_button.dart';
import 'package:xetia_shop/components/my_textfield_password.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/network/signup/register.dart';

class SignUpPasswordScreen extends StatefulWidget {
  final String first;
  final String last;
  final String email;

  static const String name = "/signUpPassword";

  SignUpPasswordScreen({Key key, this.first, this.last, this.email})
      : super(key: key);

  @override
  _SignUpPasswordScreenState createState() => _SignUpPasswordScreenState();
}

class _SignUpPasswordScreenState extends State<SignUpPasswordScreen> {
  String password = "";
  String rePassword = "";
  bool isLoading = false;
  bool isObscureFirst = true;
  bool isObscureSecond = true;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
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
                                onPressed: () {},
                                icon: Icon(
                                  Icons.language,
                                  size: 28,
                                  color: Colors.white,
                                ))),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "hello",
                        style: kDarkHeaderStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      MyTextFieldPassword(
                        controller: password,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "please enter some text";
                          } else if (password != rePassword) {
                            return "the password are not same";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        hintText: "create password",
                        isDark: false,
                        isObscure: isObscureFirst,
                        onObscure: () {
                          setState(() {
                            isObscureFirst = !isObscureFirst;
                          });
                        },
                      ),
                      SizedBox(height: 30),
                      MyTextFieldPassword(
                        controller: rePassword,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "please enter some text";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          rePassword = value;
                        },
                        hintText: "repeat password",
                        isDark: false,
                        isObscure: isObscureSecond,
                        onObscure: () {
                          setState(() {
                            isObscureSecond = !isObscureSecond;
                          });
                        },
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
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                registerReq();
                              }
                            },
                            color: kOrange,
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
        ),
      ),
    );
  }

  void registerReq() async {
    setState(() {
      isLoading = true;
    });

    final res =
        await register(widget.first, widget.last, widget.email, password);

    setState(() {
      isLoading = false;
    });
    if (res.meta.code == 200) {
      Fluttertoast.showToast(
          msg: "sign up successful",
          backgroundColor: kGreen,
          toastLength: Toast.LENGTH_LONG);
      Navigator.pushReplacementNamed(context, "/signIn");
    } else if (res.meta.code == 500) {
      Fluttertoast.showToast(
          msg: "email already exists",
          backgroundColor: kRed,
          toastLength: Toast.LENGTH_LONG);
    }
    print(res);
    // res.then((value) => print(value.meta));
  }
}
