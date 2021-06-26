import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/service/theme.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:provider/provider.dart';
import 'package:swipe_up/swipe_up.dart';

class Presentation extends StatefulWidget {
  final PageController controller;
  const Presentation({required this.controller});

  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  Radius radius = Radius.circular(100);
  double fontSize = 22;
  @override
  Widget build(BuildContext context) {
    return SwipeUp(
        color: Theme.of(context).primaryColorLight,
        sensitivity: 0.5,
        animate: true,
        onSwipe: () {
          widget.controller.animateToPage(2,
              duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 6),
              child: Material(
                  color: Colors.transparent,
                  child: ZoomableImage(
                      height: 400,
                      borderRadius: BorderRadius.only(
                        bottomLeft: radius,
                        topRight: radius,
                        bottomRight: radius,
                        // topLeft: radius
                      ),
                      path: "me1.jpg")),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 580,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(right: 80, top: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                            text: "About Me\n\n",
                            style: TextStyle(
                              fontSize: 35,
                              color:
                                  Theme.of(context).textTheme.headline6?.color,
                              fontFamily: "Noto",
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "I'm Paul, a 17 years old developer from ",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: "Munich, Germany.",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text:
                                    " I was alwas very passionate about programming and I started when I was arround 8\n",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: "In 2019, I teached myself ",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: "Flutter",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text:
                                    " and in the following months I also learned ",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: "React and node.js",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                            ])),
                  ],
                ),
              ),
            ),
          ]),
        ),
        child: Material(
            color: Colors.transparent,
            child: Text('Swipe Up',
                style: TextStyle(color: Theme.of(context).primaryColorLight))));
  }
}
