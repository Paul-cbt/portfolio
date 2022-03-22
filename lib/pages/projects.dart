import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/pages/kjmethod.dart';
import 'package:portfolio/pages/outlearn.dart';
import 'package:portfolio/pages/robot.dart';
import 'package:portfolio/pages/teacherAtn.dart';
import 'package:portfolio/service/theme.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  PageController controller = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

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
                    height: MediaQuery.of(context).size.width <= 1000
                        ? MediaQuery.of(context).size.height - 280
                        : MediaQuery.of(context).size.height / 4 + 200,
                    width: MediaQuery.of(context).size.width,
                    child: PageView(
                      onPageChanged: (value) {
                        setState(() {
                          page = value;
                          _currentPageNotifier.value = value;
                        });
                      },
                      controller: controller,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: OutLearn()),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: KjMethod()),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: TeacherAtn()),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Robots()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 20,
                      child: CirclePageIndicator(
                        itemCount: 4,
                        currentPageNotifier: _currentPageNotifier,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: IconButton(
                            color: page > 0
                                ? Theme.of(context).primaryColorLight
                                : Colors.grey,
                            onPressed: () {
                              controller.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            icon: Icon(Icons.arrow_back)),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: IconButton(
                              color: page < 2
                                  ? Theme.of(context).primaryColorLight
                                  : Colors.grey,
                              onPressed: () {
                                controller.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              icon: Icon(Icons.arrow_forward))),
                    ],
                  ),
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
                    height: MediaQuery.of(context).size.width > 375 ? 140 : 70,
                    width: MediaQuery.of(context).size.width > 375 ? 130 : 70,
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
                  },
                  child: Image.asset(
                    "desk-lamp.png",
                    height: MediaQuery.of(context).size.width > 375 ? 130 : 70,
                    width: MediaQuery.of(context).size.width > 375 ? 130 : 70,
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
