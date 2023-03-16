// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/Intro/intro_widget1.dart';
import '../Widgets/Intro/intro_widget2.dart';
import '../Widgets/Intro/intro_widget3.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final _controller = PageController();
  bool last_page = false;

  @override
  Widget build(BuildContext context) {
    final scSize = MediaQuery.of(context).size;
    final scWidth = scSize.width;
    final scHeight = scSize.height;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                if (value == 2) {
                  last_page = true;
                } else {
                  last_page = false;
                }
              });
            },
            children: [
              Intro1(),
              Intro2(),
              Intro3(),
            ],
          ),
          Positioned(
            bottom: 0.05 * scHeight,
            child: Container(
              height: 50,
              // decoration: BoxDecoration(
              //     border: Border(
              //         top: BorderSide(width: 5),
              //         bottom: BorderSide(width: 5),
              //         left: BorderSide(width: 5),
              //         right: BorderSide(width: 5))),
              width: scWidth * 0.8,
              margin: EdgeInsets.only(left: 0.1 * scWidth),
              // alignment: Alignment(0, 0.85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  last_page
                      ? Text('     ')
                      : MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: Text(
                              'Skip',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              _controller.jumpToPage(2);
                            },
                          ),
                        ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: JumpingDotEffect(verticalOffset: 6),
                    onDotClicked: (idx) {
                      _controller.jumpToPage(idx);
                    },
                  ),
                  last_page
                      ? IconButton(
                          icon: Icon(FontAwesomeIcons.check),
                          onPressed: () {
                            Navigator.of(context)
                                .popAndPushNamed('/loginScreen');
                          },
                        )
                      : IconButton(
                          // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                          icon: FaIcon(FontAwesomeIcons.arrowRight),
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
