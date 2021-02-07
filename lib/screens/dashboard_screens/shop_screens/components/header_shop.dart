import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/components/search_text_field_grey.dart';
import 'package:xetia_shop/constants.dart';

class HeaderShop extends StatelessWidget {
  final Function onChangedShop;
  final Function onCloseShop;
  final String searchShop;
  final GlobalKey<FormState> formKeyShop;

  const HeaderShop({Key key, this.onChangedShop, this.onCloseShop, this.formKeyShop, this.searchShop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
        boxShadow: kShadow,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Halal food in Japan',
                    style: kDarkHeaderStyle,
                  ),
                ),
              ),
              Form(
                key: formKeyShop,
                child: Container(
                  child: SearchTextFieldGrey(
                    hintText: "Search halal food in Japan",
                    controller: searchShop,
                    onPressed: () {
                      if (formKeyShop.currentState.validate()) {
                        print("search");
                      }
                    },
                    onFieldSubmitted: (value) {
                      if (formKeyShop.currentState.validate()) {
                        print(value);
                      }
                    },
                    onChanged: onChangedShop,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please enter some text";
                      }
                      return null;
                    },
                    closeSearch: onCloseShop,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "3600",
                          textAlign: TextAlign.center,
                          style: kDarkBoldStyle,
                        ),
                        Text(
                          "Halal Food",
                          textAlign: TextAlign.center,
                          style: kDarkNormalStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "34",
                          textAlign: TextAlign.center,
                          style: kDarkBoldStyle,
                        ),
                        Text(
                          "Mosque",
                          textAlign: TextAlign.center,
                          style: kDarkNormalStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "210",
                          textAlign: TextAlign.center,
                          style: kDarkBoldStyle,
                        ),
                        Text(
                          "Halal Shop",
                          textAlign: TextAlign.center,
                          style: kDarkNormalStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "24",
                          textAlign: TextAlign.center,
                          style: kDarkBoldStyle,
                        ),
                        Text(
                          "Muslim Community",
                          textAlign: TextAlign.center,
                          style: kDarkNormalStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "1300",
                          textAlign: TextAlign.center,
                          style: kDarkBoldStyle,
                        ),
                        Text(
                          "Halal Restaurant",
                          textAlign: TextAlign.center,
                          style: kDarkNormalStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "3",
                          textAlign: TextAlign.center,
                          style: kDarkBoldStyle,
                        ),
                        Text(
                          "Muslim corner",
                          textAlign: TextAlign.center,
                          style: kDarkNormalStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
