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
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
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
                                  fontFamily: "QuickSand",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  child: Signature()),
                            ),
                          ],
                        )
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
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "car.png",
                        height: MediaQuery.of(context).size.width > 500 &&
                                MediaQuery.of(context).size.height > 800
                            ? 350
                            : 140,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            "Wrapping up.",
                            style: TextStyle(
                              fontSize: 35,
                              color:
                                  Theme.of(context).textTheme.headline6?.color,
                              fontFamily: "QuickSand",
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "If you're in search for a ",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontFamily: "QuickSand",
                          ),
                        ),
                        TextSpan(
                          text: "young",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "QuickSand",
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontFamily: "QuickSand",
                          ),
                        ),
                        TextSpan(
                          text: "motivated",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "QuickSand",
                          ),
                        ),
                        TextSpan(
                          text: " creative developer,",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontFamily: "QuickSand",
                          ),
                        ),
                        TextSpan(
                          text: " reachout!",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "QuickSand",
                          ),
                        ),
                      ])),
                    ),
                    Spacer(),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              height: 80,
                              padding: EdgeInsets.only(left: 0, right: 0),
                              child: Signature()),
                        ],
                      ),
                    ),
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
