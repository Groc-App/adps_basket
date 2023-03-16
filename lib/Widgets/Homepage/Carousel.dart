// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scHeight = scSize.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: scHeight * 0.3,
      child: CarouselSlider(
        // ignore: sort_child_properties_last
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/categoryScreen',
                  arguments: {'maincategoryid': '63ef507a0f5f88744b7814c8'});
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/offerScreen',
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2Fc1.jpg?alt=media&token=c6c64f16-f899-4ab2-9d35-d2fa3f25bbda'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/categoryScreen',
                  arguments: {'maincategoryid': '63ef527f0f5f88744b7814ed'});
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2Fc2.jpg?alt=media&token=fa1d113b-5900-45e5-bd7e-133a03b99aea'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2Fc3.jpg?alt=media&token=235cb723-3f9b-465d-bf17-c719119a5d29'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
        slideTransform: const DepthTransform(),
        slideIndicator: CircularSlideIndicator(
            padding: const EdgeInsets.all(10),
            indicatorBackgroundColor: Theme.of(context).primaryColor,
            currentIndicatorColor: Colors.black),
        enableAutoSlider: true,
        unlimitedMode: true,
        scrollDirection: Axis.horizontal,
        autoSliderTransitionTime: const Duration(milliseconds: 500),
        autoSliderTransitionCurve: Curves.ease,
      ),
    );
  }
}
