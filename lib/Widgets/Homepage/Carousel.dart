// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    // final scSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 190,
      child: CarouselSlider(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2FNew%20Customised%2Fc2.png?alt=media&token=e066aa14-d925-414a-aaf7-60690df67018'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2FNew%20Customised%2Fc1.png?alt=media&token=7fe9ca1d-6123-4a43-a49c-528df9453ecb'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2FNew%20Customised%2Fc3.png?alt=media&token=8367a667-7c2e-4d97-9b72-3c2a2d2a4847'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.black12),
          //     borderRadius: BorderRadius.circular(10.0),
          //     image: const DecorationImage(
          //       image: CachedNetworkImageProvider(
          //           'https://firebasestorage.googleapis.com/v0/b/your-basket-515fc.appspot.com/o/CarouselImage%2FNew%20Customised%2Fc4.png?alt=media&token=ab0dcde9-662e-4273-8145-1c11de0dbd70'),
          //       fit: BoxFit.contain,
          //     ),
          //   ),
          // ),
        ],
        slideTransform: const DepthTransform(),
        slideIndicator: CircularSlideIndicator(
            padding: const EdgeInsets.all(10),
            indicatorBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
