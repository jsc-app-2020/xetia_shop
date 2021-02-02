import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/constants.dart';

//Ini adalah TextField yang baru yang sesuai design dari UI/UX
class SearchTextFieldGrey extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final ValueChanged<String> validator;
  final String controller;
  final Function onPressed;
  final Function onFieldSubmitted;
  final Function closeSearch;

  const SearchTextFieldGrey(
      {Key key,
      this.hintText,
      this.onChanged,
      this.validator,
      this.controller,
      this.onPressed,
      this.closeSearch,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: onPressed,
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            flex: 5,
            child: TextFormField(
              controller: TextEditingController.fromValue(new TextEditingValue(
                  text: controller,
                  selection:
                      new TextSelection.collapsed(offset: controller.length))),
              validator: validator,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                suffixIcon: controller.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.close_rounded),
                        color: kOrange,
                        onPressed: closeSearch,
                      )
                    : SizedBox(),
                hintText: hintText,
                hintStyle: TextStyle(color: kGrey, fontSize: 12),
                focusColor: kOrange,
              ),
              onFieldSubmitted: onFieldSubmitted,
              cursorColor: kOrange,
              style: kDarkBoldStyle,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
