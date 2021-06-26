import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/pages/outlearn.dart';
import 'package:portfolio/pages/robot.dart';
import 'package:portfolio/service/theme.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  PageController controller = PageController();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Web and Mobile dev",
                      style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).textTheme.bodyText2?.color),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 400,
                    child: Stack(
                      children: [
                        PageView(
                          onPageChanged: (value) {
                            setState(() {
                              page = value;
                            });
                          },
                          controller: controller,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: OutLearn()),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Robots()),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          alignment: Alignment.centerRight,
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: page < 1
                                ? IconButton(
                                    onPressed: () {
                                      controller.nextPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    },
                                    icon: Icon(Icons.arrow_forward))
                                : Container(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment.centerLeft,
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child: page > 0
                                ? IconButton(
                                    onPressed: () {
                                      print("yes pressed");
                                      controller.previousPage(
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    },
                                    icon: Icon(Icons.arrow_back))
                                : Container(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Container(
            alignment: Alignment.bottomLeft,
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
                  },
                  child: Image.asset(
                    "desk-lamp.png",
                    height: 140,
                    width: 130,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Provider.of<AppStateNotifier>(context, listen: false)
                        .updateTheme(false);
                  },
                  child: Image.asset(
                    "desk-lamp.png",
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}