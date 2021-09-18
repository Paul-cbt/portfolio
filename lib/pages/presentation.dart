import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/service/swipeUp.dart';
import 'package:portfolio/service/theme.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:provider/provider.dart';

class Presentation extends StatefulWidget {
  final PageController controller;
  const Presentation({required this.controller});

  @override
  _PresentationState createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Radius radius = Radius.circular(100);
  double fontSize = 22;
  double smallFontSize = 18;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        if (MediaQuery.of(context).size.width > 1143)
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width > 1389
                    ? MediaQuery.of(context).size.width / 6
                    : MediaQuery.of(context).size.width > 1000
                        ? MediaQuery.of(context).size.width / 15
                        : 30),
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
        if (MediaQuery.of(context).size.width > 1143)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 580,
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width > 1389
                      ? MediaQuery.of(context).size.width / 8
                      : MediaQuery.of(context).size.width > 1000
                          ? MediaQuery.of(context).size.width / 15
                          : 30,
                  top: 0),
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
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "Noto",
                          ),
                          children: [
                            TextSpan(
                              text: "I'm Paul, a 17 years old developer from ",
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
                                  " I was always very passionate about programming and I started when I was arround 8\n",
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
        if (MediaQuery.of(context).size.width <= 1143)
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width > 1389
                          ? MediaQuery.of(context).size.width / 6
                          : MediaQuery.of(context).size.width > 1000
                              ? MediaQuery.of(context).size.width / 15
                              : 30),
                  child: Material(
                      color: Colors.transparent,
                      child: ZoomableImage(
                          height: MediaQuery.of(context).size.height / 3,
                          borderRadius: BorderRadius.only(
                            bottomLeft: radius,
                            topRight: radius,
                            bottomRight: radius,
                            // topLeft: radius
                          ),
                          path: "me1.jpg")),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width > 1389
                          ? MediaQuery.of(context).size.width / 8
                          : MediaQuery.of(context).size.width > 1000
                              ? MediaQuery.of(context).size.width / 15
                              : 30,
                      top: 0),
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                                color: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.color,
                                fontFamily: "Noto",
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "I'm Paul, a 17 years old developer from ",
                                  style: TextStyle(
                                    fontSize: smallFontSize,
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
                                    fontSize: smallFontSize,
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.color,
                                    fontFamily: "Noto",
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      " I was always very passionate about programming and I started when I was arround 8\n",
                                  style: TextStyle(
                                    fontSize: smallFontSize,
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
                                    fontSize: smallFontSize,
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
                                    fontSize: smallFontSize,
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
                                    fontSize: smallFontSize,
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
                                    fontSize: smallFontSize,
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
              ],
            ),
          )
      ]),
    );
  }
}
