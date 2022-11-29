// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/pages/projects/kjmethod.dart';
import 'package:portfolio/pages/projects/leascore/leascore.dart';
import 'package:portfolio/pages/projects/outlearn.dart';
import 'package:portfolio/pages/projects/projectUtils.dart';
import 'package:portfolio/pages/projects/robot.dart';
import 'package:portfolio/pages/projects/teacheratn/teacherAtn.dart';
import 'package:portfolio/service/theme.dart';
import 'package:provider/provider.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Projects extends StatefulWidget {
  final Project project;
  const Projects({Key? key, required this.project}) : super(key: key);

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
    Widget child = Container();
    switch (widget.project) {
      case Project.leaScore:
        child = Container(
            width: MediaQuery.of(context).size.width, child: LeaScore());
        break;
      case Project.kjMethod:
        child = Container(
            width: MediaQuery.of(context).size.width, child: KjMethod());
        break;
      case Project.outLearn:
        child = Container(
            width: MediaQuery.of(context).size.width, child: OutLearn());
        break;
      case Project.teacherATN:
        child = Container(
            width: MediaQuery.of(context).size.width, child: TeacherAtn());
        break;
      default:
    }
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width > 1000 ? 100 : 50),
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
                    height: MediaQuery.of(context).size.width > 1000 ? 40 : 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: child,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  getDescForProject(widget.project, context)
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
                    height: MediaQuery.of(context).size.width > 500 ? 140 : 70,
                    width: MediaQuery.of(context).size.width > 500 ? 130 : 70,
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
                    height: MediaQuery.of(context).size.width > 500 ? 130 : 70,
                    width: MediaQuery.of(context).size.width > 500 ? 130 : 70,
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
