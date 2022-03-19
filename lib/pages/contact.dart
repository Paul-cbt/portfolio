import 'package:flutter/material.dart';
import 'package:portfolio/service/signature.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  double fontSize = 22;
  @override
  Widget build(BuildContext context) {
    fontSize = MediaQuery.of(context).size.width > 375 ? 22 : 17;
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: MediaQuery.of(context).size.width > 1300
            ? Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 5, top: 0),
                    width: 400,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "Wrapping up.\n\n",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                                children: [
                              TextSpan(
                                text: "If you're in search for a ",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: "young",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: " and ",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: "motivated",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: " creative developer,",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                              TextSpan(
                                text: " reachout!",
                                style: TextStyle(
                                  fontSize: fontSize,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.color,
                                  fontFamily: "Noto",
                                ),
                              ),
                            ])),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton.icon(
                                onPressed: () {
                                  launch("mailto:paulcbt@outlook.com");
                                },
                                icon: Icon(Icons.mail_outline,
                                    size: 30,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.color),
                                label: Text(
                                  "Mail",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton.icon(
                                onPressed: () {
                                  launch("assets/cv.pdf");
                                },
                                icon: Icon(Icons.download,
                                    size: 30,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.color),
                                label: Text(
                                  "Resume",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(height: 80, child: Signature())
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
                    child: Text(
                      "PS: Oh! And it's me you're listening to in the background",
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline1?.color),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 5, top: 0),
                    child: Image.asset(
                      "car.png",
                      height:
                          MediaQuery.of(context).size.width > 500 ? 400 : 200,
                    ),
                  )
                ],
              )
            : Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              "car.png",
                              height: MediaQuery.of(context).size.width > 500 &&
                                      MediaQuery.of(context).size.height > 800
                                  ? 350
                                  : 150,
                            ),
                          ),
                          Container(
                            height: 320,
                            alignment: Alignment.center,
                            constraints: BoxConstraints(maxWidth: 400),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        text: "Wrapping up.\n",
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                        children: [
                                      TextSpan(
                                        text: "If you're in search for a ",
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "young",
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: " and ",
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: "motivated",
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: " creative developer,",
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                      ),
                                      TextSpan(
                                        text: " reachout!",
                                        style: TextStyle(
                                          fontSize: fontSize,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.color,
                                          fontFamily: "Noto",
                                        ),
                                      ),
                                    ])),
                              ],
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton.icon(
                            onPressed: () {
                              launch("mailto:paulcbt@outlook.com");
                            },
                            icon: Icon(Icons.mail_outline,
                                size: 30,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color),
                            label: Text(
                              "Mail",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.color),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton.icon(
                            onPressed: () {
                              launch("assets/cv.pdf");
                            },
                            icon: Icon(Icons.download,
                                size: 30,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.color),
                            label: Text(
                              "Resume",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.color),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 80,
                        padding: EdgeInsets.only(left: 15, right: 5),
                        child: Signature()),
                    Spacer(),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.fromLTRB(15, 0, 0,
                          MediaQuery.of(context).size.width > 584 ? 20 : 50),
                      child: Text(
                        "PS: Oh! And it's me you're listening to in the background",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.headline1?.color),
                      ),
                    ),
                  ],
                )));
  }
}
