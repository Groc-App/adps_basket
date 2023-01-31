import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/Intro/intro_screen1.dart';
import '../Widgets/Intro/intro_screen2.dart';
import '../Widgets/Intro/intro_screen3.dart';

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
    final sc_size = MediaQuery.of(context).size;
    final sc_width = sc_size.width;
    final sc_height = sc_size.height;

    // print(_controller.initialPage);

    return Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              if (value == 2)
                last_page = true;
              else
                last_page = false;
            });
          },
          children: [
            Intro1(),
            Intro2(),
            Intro3(),
          ],
        ),
        Positioned(
          bottom: 0.05 * sc_height,
          child: Container(
            height: 50,
            // decoration: BoxDecoration(
            //     border: Border(
            //         top: BorderSide(width: 5),
            //         bottom: BorderSide(width: 5),
            //         left: BorderSide(width: 5),
            //         right: BorderSide(width: 5))),
            width: sc_width * 0.8,
            margin: EdgeInsets.only(left: 0.1 * sc_width),
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
                          Navigator.of(context).popAndPushNamed('/homepage');
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
    );
  }
}
