import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class MyTextFieldPassword extends StatelessWidget {
  final String hintText;
  final bool isDark;
  final Function onChanged;
  final ValueChanged<String> validator;
  final String controller;
  final Function onObscure;
  final bool isObscure;

  MyTextFieldPassword(
      {Key key,
      this.hintText,
      this.isDark,
      this.onChanged,
      this.validator,
      this.controller,
      this.onObscure,
      this.isObscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 55,
          decoration: kBoxDecoration(kRed.withOpacity(0.5)),
          child: Center(
            child: Icon(
              Icons.lock,
              color: kRed,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            controller: TextEditingController.fromValue(new TextEditingValue(
                text: controller,
                selection:
                    new TextSelection.collapsed(offset: controller.length))),
            validator: validator,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kRed.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kRed),
                borderRadius: BorderRadius.circular(5),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: kRed.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: kGrey),
              focusColor: kGreen,
              suffixIcon: IconButton(
                icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility,
                    color: kRed),
                onPressed: onObscure,
              ),
            ),
            cursorColor: kRed,
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            obscureText: isObscure,
          ),
        )
      ],
    );
  }
}
