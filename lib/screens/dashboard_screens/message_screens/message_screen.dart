import 'package:flutter/material.dart';
import 'package:xetia_shop/components/search_text_field_grey.dart';
import 'package:xetia_shop/constants.dart';

import 'components/chat_item.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<String> tab;
  String search = "";
  GlobalKey<FormState> formKeyShop = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tab = ["All", "Unread"];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              kSliverTabBar(isDark: false, color: kYellow, tab: tab)
            ];
          },
          body: TabBarView(
            children: [
              Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Form(
                        key: formKeyShop,
                        child: Container(
                          child: SearchTextFieldGrey(
                            hintText: "Search halal food in Japan",
                            controller: search,
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
                            onChanged: (value) {
                              setState(() {
                                search = value;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please enter some text";
                              }
                              return null;
                            },
                            closeSearch: () {
                              setState(() {
                                search = "";
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    ChatItem(isDark: false, color: kYellow),
                  ]),
                ),
              ),
              Icon(Icons.directions_transit),
            ],
          ),
        ));
  }
}
