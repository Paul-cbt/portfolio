import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/service/zoomableImage.dart';
import 'package:url_launcher/url_launcher.dart';

class OutLearn extends StatefulWidget {
  const OutLearn({Key? key}) : super(key: key);

  @override
  _OutLearnState createState() => _OutLearnState();
}

class _OutLearnState extends State<OutLearn> {
  bool isBig = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(NetworkImage('assets/1.png'), context);
    precacheImage(NetworkImage('assets/2.png'), context);
    precacheImage(NetworkImage('assets/3.png'), context);
    precacheImage(NetworkImage('assets/4.png'), context);
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
                      text: "2020-2022     ",
                      style: TextStyle(
                        fontSize: isBig ? 20 : 13,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      children: [
                    TextSpan(
                      text: "OutLearn",
                      style: TextStyle(
                          fontSize: isBig ? 24 : 15,
                          color: Theme.of(context).textTheme.bodyText1?.color),
                    ),
                    TextSpan(
                      text: ", ",
                      style: TextStyle(
                        fontSize: isBig ? 20 : 13,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                    TextSpan(
                      text: "Founder and CEO",
                      style: TextStyle(
                          fontSize: isBig ? 20 : 13,
                          color: Theme.of(context).textTheme.headline4?.color),
                    )
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
                        width: 250,
                        child: Text(
                          "I fully developed and released this studying app using Flutter & Firebase",
                          textAlign:
                              isBig ? TextAlign.justify : TextAlign.center,
                          style: TextStyle(fontSize: isBig ? 22 : 14),
                        )),
                    InkWell(
                      onTap: () {
                        launch("https://outlearnapp.com");
                      },
                      child: Text(
                        "-> Go to Site",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline4?.color),
                      ),
                    )
                  ],
                ),
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
                            path: "1.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "2.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 150),
                            path: "3.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 15),
                            path: "4.png")
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 207 / 448,
                        height: 300,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
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
                Column(
                  children: [
                    Container(
                        child: Text(
                      "I fully developed and released this studying app using Flutter & Firebase",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: isBig ? 22 : 14),
                    )),
                    InkWell(
                      onTap: () {
                        launch("https://outlearnapp.com");
                      },
                      child: Text(
                        "-> Go to Site",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline4?.color),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20 > 300
                      ? 300
                      : MediaQuery.of(context).size.width - 20,
                  child: CarouselSlider(
                      items: [
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 10),
                            path: "1.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 10),
                            path: "2.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 10),
                            path: "3.png"),
                        ZoomableImage(
                            borderRadius:
                                BorderRadius.circular(isBig ? 20 : 10),
                            path: "4.png")
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
