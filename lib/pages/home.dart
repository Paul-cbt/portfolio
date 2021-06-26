// @dart=2.9
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
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
  Radius radius = Radius.circular(100);
  @override
  Widget build(BuildContext context) {
    return SwipeUp(
        color: Theme.of(context).primaryColorLight,
        sensitivity: 0.5,
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
              margin: EdgeInsets.only(left: 20),
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
                      height: 140,
                      width: 130,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<AppStateNotifier>(context, listen: false)
                          .updateTheme(false);

                      return true;
                    },
                    child: Image.asset(
                      "ceiling-lamp.png",
                      height: 130,
                      width: 130,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 5),
                child: ZoomableImage(
                    height: 350,
                    width: 350,
                    borderRadius: BorderRadius.only(
                        bottomLeft: radius,
                        bottomRight: radius,
                        topLeft: radius),
                    path: "me3.jpg")),
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 5),
              child: RichText(
                  text: TextSpan(
                      text: "Hello.\n",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: "Noto",
                      ),
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
            )
          ]),
        ),
        child: Material(
            color: Colors.transparent,
            child: Text('Swipe Up',
                style: TextStyle(color: Theme.of(context).primaryColorLight))));
  }
}
