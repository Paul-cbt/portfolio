import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/pages/projects/leascore/leaScoreTitle.dart';
import 'package:portfolio/service/zommableVideo.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaScore extends StatefulWidget {
  const LeaScore({Key? key}) : super(key: key);

  @override
  _LeaScoreState createState() => _LeaScoreState();
}

class _LeaScoreState extends State<LeaScore> {
  bool isBig = true;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    isBig = MediaQuery.of(context).size.width > 436;

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
                      text: "2022, ",
                      style: TextStyle(
                        fontSize: isBig ? 20 : 13,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      children: [
                    TextSpan(
                      text: "client work    ",
                      style: TextStyle(
                          fontSize: isBig ? 16 : 10,
                          color: Theme.of(context).textTheme.headline4?.color),
                    ),
                    TextSpan(
                      text: "Health test app",
                      style: TextStyle(
                          fontSize: isBig ? 24 : 15,
                          color: Theme.of(context).textTheme.bodyText1?.color),
                    ),
                  ]))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width > 1000 ? 40 : 0,
        ),
        if (MediaQuery.of(context).size.width > 1000)
          Container(
            width: 800,
            margin: EdgeInsets.only(left: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LeaScoreTitle(isBig: isBig),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 400,
                  child: CarouselSlider(
                      items: [
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea1.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea2.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea3.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea4.png")
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        height: 300,
                        viewportFraction: 0.36,
                        enlargeCenterPage: true,
                      )),
                )
              ],
            ),
          ),
        if (MediaQuery.of(context).size.width <= 1000)
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                ),
                LeaScoreTitle(isBig: isBig),
                Container(
                  width: MediaQuery.of(context).size.width - 20 > 300
                      ? 300
                      : MediaQuery.of(context).size.width - 20,
                  child: CarouselSlider(
                      items: [
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea1.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea2.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea3.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "leascore/lea4.png")
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        height: MediaQuery.of(context).size.height / 4,
                        viewportFraction: 0.36,
                        enlargeCenterPage: true,
                      )),
                )
              ],
            ),
          )
      ],
    );
  }
}
