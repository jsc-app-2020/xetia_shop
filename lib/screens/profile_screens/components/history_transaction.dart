import 'package:flutter/material.dart';
import 'package:xetia_shop/screens/components/badges.dart';
import 'package:xetia_shop/screens/constants.dart';

import 'list_history.dart';

class HistoryTransaction extends StatefulWidget {
  final Color color;
  final bool isDark;

  const HistoryTransaction({Key key, this.color, this.isDark})
      : super(key: key);

  @override
  _HistoryTransactionState createState() => _HistoryTransactionState();
}

class _HistoryTransactionState extends State<HistoryTransaction> {
  DateTime selectedDate = DateTime.now();
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  bool isLoadDate = true;
  List<String> chipName;

  textInputSelectDate(
      BuildContext context, Color color, bool isDark, String text) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: text,
      cancelText: 'Cancel',
      confirmText: 'Ok',
      builder: (context, child) {
        return DatePickerTheme(child: child, color: color, isDark: isDark);
      },
    );
    if (picked != null && picked != selectedDate) {
      return picked;
    } else {
      return DateTime.now();
    }
  }

  void getDate() async {
    firstDate = await textInputSelectDate(
        context, widget.color, widget.isDark, "First date History");
    Future.delayed(const Duration(milliseconds: 1000), () async {
      lastDate = await textInputSelectDate(
          context, widget.color, widget.isDark, "Last date History");
    });
  }

  @override
  void initState() {
    super.initState();
    chipName = [
      "All",
      "Payment",
      "Acceptance",
      "Output",
      "Input",
      "Lorem",
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: false ? kBgWhite : kGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "history transaction",
              textAlign: TextAlign.center,
              style: true ? kBoldStyle : kDarkBoldStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              color: widget.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: widget.color,
                ),
                isLoadDate
                    ? Text(
                        "${firstDate.toString().substring(0, 10)} - ${lastDate.toString().substring(0, 10)}",
                        textAlign: TextAlign.center,
                        style: kCustomStyle(14, widget.color))
                    : SizedBox(height: 50),
                InkWell(
                  onTap: () async {
                    setState(() {
                      isLoadDate = false;
                    });

                    getDate();

                    setState(() {
                      isLoadDate = true;
                    });
                  },
                  child: Container(
                      child: Icon(
                    Icons.arrow_downward,
                    color: widget.color,
                  )),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  chipName.length,
                  (index) => Badges(
                    txtColor: widget.color,
                    bgColor: widget.color.withOpacity(0.1),
                    text: chipName[index],
                    color: widget.color,
                    isDark: widget.isDark,
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListHistory(
                    text: "Payment",
                    date: "1 Dec 2020",
                    price: "-21.285",
                    icon: Icons.money,
                    color: widget.color,
                    isDark: widget.isDark,
                    colorPrice: kRed),
                ListHistory(
                    text: "Cashback",
                    date: "1 Dec 2020",
                    price: "-21.285",
                    icon: Icons.money,
                    color: widget.color,
                    isDark: widget.isDark,
                    colorPrice: kGreen),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DatePickerTheme extends StatelessWidget {
  final Widget child;
  final Color color;
  final bool isDark;

  const DatePickerTheme({Key key, this.color, this.isDark, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
                primaryColorDark: Colors.white, primaryColorLight: Colors.black)
            .copyWith(
                primaryColor: color,
                colorScheme: ColorScheme.light(
                  primary: false ? kGrey : color,
                  onPrimary: Colors.white,
                  surface: color,
                  onSurface: Colors.black,
                )),
        child: child);
  }
}
