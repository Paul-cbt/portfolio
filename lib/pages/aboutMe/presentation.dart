import 'package:flutter/material.dart';
import 'package:portfolio/pages/aboutMe/aboutMeTextSpans.dart';
import 'package:portfolio/service/utils.dart';
import 'package:portfolio/service/zoomableImage.dart';

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
  double smallFontSize = 15;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1143) {
      radius = Radius.circular(100);
    } else {
      radius = Radius.circular(70);
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(children: [
        if (MediaQuery.of(context).size.width > 1143)
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: getMaxWidth(context) / 2 - 20,
                  height: getMaxWidth(context) / 2 - 20,
                  child: ZoomableImage(
                      borderRadius: BorderRadius.only(
                        bottomLeft: radius,
                        topRight: radius,
                        bottomRight: radius,
                        // topLeft: radius
                      ),
                      path: "me10.jpg"),
                ),
                SizedBox(
                  width: 80,
                ),
                SizedBox(
                  width: getMaxWidth(context) / 2 + 20,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
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
                                fontFamily: "QuickSand",
                              ),
                              children: aboutMeTextSpans(fontSize, context))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (MediaQuery.of(context).size.width <= 1143)
          Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(left: 15, top: 70),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Material(
                      color: Colors.transparent,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: ZoomableImage(
                            borderRadius: BorderRadius.only(
                              bottomLeft: radius,
                              topRight: radius,
                              bottomRight: radius,
                              // topLeft: radius
                            ),
                            path: "me10.jpg"),
                      )),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width > 1389
                          ? MediaQuery.of(context).size.width / 8
                          : MediaQuery.of(context).size.width > 1000
                              ? MediaQuery.of(context).size.width / 15
                              : 30,
                      top: 60),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 35,
                          color: Theme.of(context).textTheme.headline6?.color,
                          fontFamily: "QuickSand",
                        ),
                      ),
                      RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                              children: aboutMeTextSpans(fontSize, context))),
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
