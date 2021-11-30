// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
// import 'package:portfolio/service/swipeUp.dart';
import 'package:portfolio/service/theme.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:provider/provider.dart';
import 'package:swipe_up/swipe_up.dart';

class Home extends StatefulWidget {
  final PageController controller;
  const Home({@required this.controller});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  double smallFontSize = 35;
  double subSmallFontSize = 27;

  Radius radius = Radius.circular(100);
  @override
  Widget build(BuildContext context) {
    return SwipeUp(
        color: Theme.of(context).primaryColorLight,
        sensitivity: 0.3,
        expand: false,
        showArrow: true,
        animate: true,
        onSwipe: () {
          widget.controller.animateToPage(1,
              duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        },
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width > 375 ? 20 : 5),
              child: Material(
                color: Colors.transparent,
                child: HoverWidget(
                  onHover: (event) {},
                  hoverChild: GestureDetector(
                    onTap: () {
                      if (Theme.of(context).brightness == Brightness.light) {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .updateTheme(true);
                      } else {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .updateTheme(false);
                      }

                      return true;
                    },
                    child: Image.asset(
                      "ceiling-lamp.png",
                      height:
                          MediaQuery.of(context).size.width > 840 ? 140 : 75,
                      width: MediaQuery.of(context).size.width > 840 ? 130 : 70,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (Theme.of(context).brightness == Brightness.light) {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .updateTheme(true);
                      } else {
                        Provider.of<AppStateNotifier>(context, listen: false)
                            .updateTheme(false);
                      }

                      return true;
                    },
                    child: Image.asset(
                      "ceiling-lamp.png",
                      height:
                          MediaQuery.of(context).size.width > 840 ? 130 : 70,
                      width: MediaQuery.of(context).size.width > 840 ? 130 : 70,
                    ),
                  ),
                ),
              ),
            ),
            if (MediaQuery.of(context).size.width > 840)
              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width > 1250
                          ? MediaQuery.of(context).size.width / 5
                          : MediaQuery.of(context).size.width > 1000
                              ? MediaQuery.of(context).size.width / 10
                              : 30),
                  child: ZoomableImage(
                      height: 350,
                      width: 350,
                      borderRadius: BorderRadius.only(
                          bottomLeft: radius,
                          bottomRight: radius,
                          topLeft: radius),
                      path: "me3.jpg")),
            if (MediaQuery.of(context).size.width > 840)
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width > 1250
                        ? MediaQuery.of(context).size.width / 5
                        : MediaQuery.of(context).size.width > 1000
                            ? MediaQuery.of(context).size.width / 10
                            : 30),
                child: RichText(
                    text: TextSpan(
                        text: "Hello.\n",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: "Noto",
                            color: Theme.of(context).textTheme.bodyText1.color),
                        children: [
                      TextSpan(
                        text: "I'm ",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: "Paul",
                        style: TextStyle(
                          fontSize: 50,
                          color: Theme.of(context).textTheme.bodyText2?.color,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: ",\n",
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: "a ",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: "mobile",
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).textTheme.bodyText2?.color,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: " and ",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: "Web",
                        style: TextStyle(
                          fontSize: 40,
                          color: Theme.of(context).textTheme.bodyText2?.color,
                          fontFamily: "Noto",
                        ),
                      ),
                      TextSpan(
                        text: " dev",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: "Noto",
                        ),
                      )
                    ])),
              ),
            if (MediaQuery.of(context).size.width <= 840)
              Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        child: ZoomableImage(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.height / 3,
                            borderRadius: BorderRadius.only(
                                bottomLeft: radius,
                                bottomRight: radius,
                                topLeft: radius),
                            path: "me3.jpg")),
                    Container(
                      child: RichText(
                          text: TextSpan(
                              text: "Hello.\n",
                              style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontFamily: "Noto",
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .color),
                              children: [
                            TextSpan(
                              text: "I'm ",
                              style: TextStyle(
                                fontSize: smallFontSize,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: "Paul",
                              style: TextStyle(
                                fontSize: smallFontSize,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: ",\n",
                              style: TextStyle(
                                fontSize: smallFontSize,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: "a ",
                              style: TextStyle(
                                fontSize: subSmallFontSize,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: "mobile",
                              style: TextStyle(
                                fontSize: subSmallFontSize,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: " and ",
                              style: TextStyle(
                                fontSize: subSmallFontSize,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: "Web",
                              style: TextStyle(
                                fontSize: subSmallFontSize,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color,
                                fontFamily: "Noto",
                              ),
                            ),
                            TextSpan(
                              text: " dev",
                              style: TextStyle(
                                fontSize: subSmallFontSize,
                                fontFamily: "Noto",
                              ),
                            )
                          ])),
                    ),
                  ],
                ),
              )
          ]),
        ),
        child: Material(
            color: Colors.transparent,
            child: Text('Swipe Up',
                style: TextStyle(color: Theme.of(context).primaryColorLight))));
  }
}
