import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xetia_shop/components/carousel_card_container.dart';
import 'package:xetia_shop/components/my_button.dart';
import 'package:xetia_shop/constants.dart';
import 'package:xetia_shop/core/db/model/user.dart';
import 'package:xetia_shop/core/db/user_database_provider.dart';
import 'package:xetia_shop/core/network/user/auth_network.dart';
import 'package:xetia_shop/core/provider/ThemeProvider.dart';
import 'package:xetia_shop/screens/signin_screens/sign_in_screen.dart';

import 'business_card_item.dart';
import 'components/budgeting.dart';
import 'components/history_transaction.dart';
import 'components/my_balance.dart';
import 'components/product_review.dart';
import 'components/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  final bool isDark;

  const ProfileScreen({Key key, this.isDark}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<Widget> list;
  bool isLoading = false;
  User user;

  void getUserData() async {
    final user = await UserProvider.db.getUser();
    print(user.id);
    print(user.accessToken);
    print(user.refreshToken);
    setState(() {
      this.user = user;
    });
  }

  Future funLogout() async {
    Future.delayed(Duration(seconds: 1));
    await logout(user.accessToken, user.refreshToken);
    await UserProvider.db.deleteUser(user.id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  void initState() {
    super.initState();
    list = [
      BusinessCardItem(
        color: kYellow,
        isDark: widget.isDark,
      ),
      BusinessCardItem(color: kYellow, isDark: !widget.isDark),
      BusinessCardItem(color: kYellow, isDark: !widget.isDark),
    ];
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: !widget.isDark ? kBgBlack : kBgWhite,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ProfileCard(isDark: !widget.isDark),
              MyBalance(color: kYellow, isDark: !widget.isDark),
              SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Budgeting(color: kGrey, isDark: !widget.isDark)),
              SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: HistoryTransaction(
                      color: kYellow, isDark: !widget.isDark)),
              SizedBox(height: 25),
              ProductReview(isDark: !widget.isDark),
              SizedBox(height: 25),
              CarouselCardContainer(
                color: kYellow,
                isDark: !widget.isDark,
                list: list,
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: MyButton(
                  color: kGreen,
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await funLogout();
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.pushNamed(context, SignInScreen.name);
                  },
                  text: "Logout",
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
