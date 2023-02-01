import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: sc_height * 0.3,
      child: CarouselSlider(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blue,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.green,
            ),
          ),
        ],
        slideTransform: DepthTransform(),
        slideIndicator: CircularSlideIndicator(
            padding: EdgeInsets.all(10),
            indicatorBackgroundColor: Theme.of(context).primaryColor,
            currentIndicatorColor: Colors.white),
        enableAutoSlider: true,
        unlimitedMode: true,
        scrollDirection: Axis.horizontal,
        autoSliderTransitionTime: Duration(milliseconds: 500),
        autoSliderTransitionCurve: Curves.ease,
      ),
    );
  }
}
