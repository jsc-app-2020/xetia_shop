import 'package:flutter/material.dart';
import 'package:xetia_shop/constants.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final Color color;
  final bool isDark;
  final Function onChanged;
  final ValueChanged<String> validator;
  final String controller;
  final TextInputType textInputType;

  const MyTextField(
      {Key key,
      this.hintText,
      this.iconData,
      this.onChanged,
      this.color,
      this.isDark,
      this.validator,
      this.controller,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              width: 40,
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: kGrey,
              ),
            ),
            Container(
              width: 40,
              height: 55,
              decoration: kBoxDecoration(color.withOpacity(0.5)),
              child: Center(
                child: Icon(
                  iconData,
                  color: color,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: TextEditingController.fromValue(new TextEditingValue(
                text: controller,
                selection:
                    new TextSelection.collapsed(offset: controller.length))),
            validator: validator,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: color),
                borderRadius: BorderRadius.circular(5),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: color.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(5),
              ),
              hintText: hintText,
              hintStyle: TextStyle(color: kGrey),
              focusColor: color,
            ),
            cursorColor: color,
            style: TextStyle(color: isDark ? Colors.white : Colors.black),
            onChanged: onChanged,
            keyboardType: textInputType,
          ),
        )
      ],
    );
  }
}
