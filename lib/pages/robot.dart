//@dart=2.9
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:portfolio/service/zommableVideo.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class Robots extends StatefulWidget {
  const Robots({Key key}) : super(key: key);

  @override
  _RobotsState createState() => _RobotsState();
}

class _RobotsState extends State<Robots> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Container(
                    height: 15,
                    width: 1,
                    color: Theme.of(context).textTheme.headline4?.color,
                  ),
                  Container(
                    height: 5,
                    width: 5,
                    color: Theme.of(context).textTheme.headline4?.color,
                  ),
                  Container(
                    height: 15,
                    width: 1,
                    color: Theme.of(context).textTheme.headline4?.color,
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              RichText(
                  text: TextSpan(
                      text: "2018-2020    ",
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 410 ? 20 : 14,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      children: [
                    TextSpan(
                      text: "Robotics",
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 410 ? 24 : 18,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                  ]))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 1000 ? 40 : 20,
        ),
        if (MediaQuery.of(context).size.width > 1000)
          Container(
            width: 800,
            margin: EdgeInsets.only(left: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        width: 240,
                        child: Text(
                          "I participated in robot competitions, using Arduino, Python and C++",
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.justify,
                        )),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                ZoomableVideo(
                    borderRadius: BorderRadius.circular(10), path: "robot.mp4")
              ],
            ),
          ),
        if (MediaQuery.of(context).size.width <= 1000)
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        child: Text(
                      "I participated in robot competitions, using Arduino, Python and C++",
                      style: TextStyle(
                        fontSize:
                            MediaQuery.of(context).size.width > 436 ? 24 : 14,
                      ),
                      textAlign: TextAlign.justify,
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ZoomableVideo(
                    borderRadius: BorderRadius.circular(10), path: "robot.mp4")
              ],
            ),
          )
      ],
    );
  }
}
