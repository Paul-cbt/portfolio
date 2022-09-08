import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/service/zoomableImage.dart';

class TeacherAtn extends StatefulWidget {
  const TeacherAtn({Key? key}) : super(key: key);

  @override
  _TeacherAtnState createState() => _TeacherAtnState();
}

class _TeacherAtnState extends State<TeacherAtn> {
  bool isBig = true;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    precacheImage(NetworkImage('assets/home.png'), context);
    precacheImage(NetworkImage('assets/watch.png.png'), context);
    precacheImage(NetworkImage('assets/random.png'), context);

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
                      text: "2021, ",
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
                      text: "Private language teacher",
                      style: TextStyle(
                          fontSize: isBig ? 24 : 15,
                          color: Theme.of(context).textTheme.bodyText1?.color),
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
                        width: 300,
                        child: Text(
                          "Fully functional language Learning app, main features are video watch with clickable caption and integrated google translate",
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: isBig ? 22 : 14),
                        )),
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
                            borderRadius: BorderRadius.circular(20),
                            path: "home.png"),
                        ZoomableImage(
                            borderRadius: BorderRadius.circular(20),
                            path: "watch.png"),
                        ZoomableImage(
                            borderRadius: BorderRadius.circular(20),
                            path: "random.png"),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1920 / 1080,
                        viewportFraction: 0.8,
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
                      "Fully functional language learning app, main features are video watch with clickable caption and integrated google translate",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: isBig ? 22 : 14),
                    )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 470),
                  child: CarouselSlider(
                      items: [
                        ZoomableImage(
                            borderRadius: BorderRadius.circular(20),
                            path: "home.png"),
                        ZoomableImage(
                            borderRadius: BorderRadius.circular(20),
                            path: "watch.png"),
                        ZoomableImage(
                            borderRadius: BorderRadius.circular(20),
                            path: "random.png"),
                      ],
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1920 / 1080,
                        viewportFraction: 0.8,
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
