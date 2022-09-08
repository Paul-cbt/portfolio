// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/pages/quoteBuilder.dart';
// import 'package:portfolio/service/swipeUp.dart';
import 'package:portfolio/service/theme.dart';
import 'package:portfolio/service/utils.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:provider/provider.dart';
import 'package:swipe_up/swipe_up.dart';
import 'package:universal_html/html.dart' as uni;

class Home extends StatefulWidget {
  final PageController controller;
  const Home({@required this.controller});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    var loader = uni.document.getElementsByClassName('container');
    if (loader.isNotEmpty) {
      loader.first.remove();
      //remove the loading in the html file
    }
    super.initState();
  }

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
    precacheImage(NetworkImage('assets/homeMeDark.jpeg'), context);

    if (MediaQuery.of(context).size.width > 1143) {
      radius = Radius.circular(100);
    } else {
      radius = Radius.circular(70);
    }
    return SwipeUp(
        color: Theme.of(context).primaryColorLight,
        sensitivity: 0.9,
        expand: false,
        showArrow: true,
        animate: true,
        onSwipe: () {
          widget.controller.animateToPage(1,
              duration: Duration(milliseconds: 500), curve: Curves.easeOut);
        },
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            constraints: BoxConstraints(maxWidth: 1500),
            child: Stack(children: [
              if (MediaQuery.of(context).size.width > 1143)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: getMaxWidth(context) / 2 + 20,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "Hello.\n",
                                    style: TextStyle(
                                        fontSize: 50,
                                        fontFamily: "QuickSand",
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .color),
                                    children: [
                                  TextSpan(
                                    text: "I'm ",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Paul",
                                    style: TextStyle(
                                      fontSize: 50,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: ",\n",
                                    style: TextStyle(
                                      fontSize: 50,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "a ",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "mobile",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Web",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                      fontFamily: "QuickSand",
                                    ),
                                  ),
                                  TextSpan(
                                    text: " dev",
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontFamily: "QuickSand",
                                    ),
                                  )
                                ])),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 0),
                              child: QuoteBuilder(
                                  maxWidth: getMaxWidth(context) / 2 - 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        width: getMaxWidth(context) / 2 - 20,
                        height: getMaxWidth(context) / 2 - 20,
                        child: ZoomableImage(
                          showShimmerLoading: false,
                          // borderRadius: BorderRadius.circular(20),
                          borderRadius: BorderRadius.only(
                              bottomLeft: radius,
                              bottomRight: radius,
                              topLeft: radius),
                          path: 'homeMeDark.jpeg',
                        ),
                      )
                    ],
                  ),
                ),
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
                        width:
                            MediaQuery.of(context).size.width > 840 ? 130 : 70,
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
                        width:
                            MediaQuery.of(context).size.width > 840 ? 130 : 70,
                      ),
                    ),
                  ),
                ),
              ),
              if (MediaQuery.of(context).size.width <= 1143)
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.height / 3,
                          child: ZoomableImage(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: radius,
                                  bottomRight: radius,
                                  topLeft: radius),
                              path: "homeMeDark.jpeg")),
                      Container(
                        child: RichText(
                            text: TextSpan(
                                text: "Hello.\n",
                                style: TextStyle(
                                    fontSize: smallFontSize,
                                    fontFamily: "QuickSand",
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .color),
                                children: [
                              TextSpan(
                                text: "I'm ",
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
                                ),
                              ),
                              TextSpan(
                                text: ",\n",
                                style: TextStyle(
                                  fontSize: smallFontSize,
                                  fontFamily: "QuickSand",
                                ),
                              ),
                              TextSpan(
                                text: "a ",
                                style: TextStyle(
                                  fontSize: subSmallFontSize,
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
                                ),
                              ),
                              TextSpan(
                                text: " and ",
                                style: TextStyle(
                                  fontSize: subSmallFontSize,
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
                                ),
                              ),
                              TextSpan(
                                text: " dev",
                                style: TextStyle(
                                  fontSize: subSmallFontSize,
                                  fontFamily: "QuickSand",
                                ),
                              )
                            ])),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: QuoteBuilder(
                          maxWidth: 280,
                          center: true,
                        ),
                      ))
                    ],
                  ),
                )
            ]),
          ),
        ),
        child: Material(
            color: Colors.transparent,
            child: Text('Swipe Up',
                style: TextStyle(color: Theme.of(context).primaryColorLight))));
  }
}
