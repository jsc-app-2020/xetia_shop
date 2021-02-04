import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselCardContainer extends StatefulWidget {
  final bool isDark;
  final Color color;
  final List<Widget> list;

  const CarouselCardContainer({Key key, this.isDark, this.color, this.list})
      : super(key: key);

  @override
  _CarouselCardContainerState createState() => _CarouselCardContainerState();
}

class _CarouselCardContainerState extends State<CarouselCardContainer> {
  int _currentIndex = 0;

  //Dot Indicator
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //CarouselSlider
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              //AutoSlide
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              enlargeCenterPage: true,
              scrollPhysics: BouncingScrollPhysics(),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.list.map((card) {
              return Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: card,
              );
            }).toList(),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(widget.list, (index, url) {
                return Container(
                  width: _currentIndex == index ? 30 : 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _currentIndex == index
                        ? widget.color
                        : widget.color.withOpacity(0.3),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
