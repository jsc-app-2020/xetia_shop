import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xetia_shop/components/carousel_card_container.dart';
import 'package:xetia_shop/components/my_button.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/screens/dashboard_screens/profile_screens/business_card_item.dart';
import 'package:xetia_shop/screens/dashboard_screens/profile_screens/components/budgeting.dart';
import 'package:xetia_shop/screens/dashboard_screens/profile_screens/components/history_transaction.dart';
import 'package:xetia_shop/screens/dashboard_screens/profile_screens/components/my_balance.dart';
import 'package:xetia_shop/screens/dashboard_screens/profile_screens/components/profile_card.dart';
import 'package:xetia_shop/screens/signin_screens/sign_in_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = [
      BusinessCardItem(color: kYellow),
      BusinessCardItem(color: kYellow),
      BusinessCardItem(color: kYellow),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ProfileCard(),
          MyBalance(color: kYellow, isDark: false),
          SizedBox(height: 25),
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Budgeting(color: kGrey, isDark: false)),
          SizedBox(height: 25),
          Container(
              width: MediaQuery.of(context).size.width * 0.95,
              child: HistoryTransaction(color: kYellow, isDark: false)),
          SizedBox(height: 25),
          CarouselCardContainer(
            color: kYellow,
            isDark: false,
            list: list,
          ),
          SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: MyButton(
              color: kGreen,
              onTap: () {
                Navigator.pushNamed(context, SignInScreen.name);
              },
              text: "Logout",
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
