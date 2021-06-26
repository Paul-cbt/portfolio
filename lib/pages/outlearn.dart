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
                      text: "2020-2021     ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                      children: [
                    TextSpan(
                      text: "OutLearn",
                      style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).textTheme.bodyText1?.color),
                    ),
                    TextSpan(
                      text: ", ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                      ),
                    ),
                    TextSpan(
                      text: "Founder and CEO",
                      style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).textTheme.headline4?.color),
                    )
                  ]))
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
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
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 22),
                      )),
                  InkWell(
                    onTap: () {
                      launch("https://outlearnapp.com");
                    },
                    child: Text(
                      "-> Go to Site",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline4?.color),
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
                          borderRadius: BorderRadius.circular(20),
                          path: "1.png"),
                      ZoomableImage(
                          borderRadius: BorderRadius.circular(20),
                          path: "2.png"),
                      ZoomableImage(
                          borderRadius: BorderRadius.circular(20),
                          path: "3.png"),
                      ZoomableImage(
                          borderRadius: BorderRadius.circular(20),
                          path: "4.png")
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
        )
      ],
    );
  }
}