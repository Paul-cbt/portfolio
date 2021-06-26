import 'package:flutter/material.dart';
import 'package:portfolio/service/signature.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  double fontSize = 22;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
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
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "Noto",
                          ),
                          children: [
                        TextSpan(
                          text: "If you're in search for a ",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontFamily: "Noto",
                          ),
                        ),
                        TextSpan(
                          text: "young",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "Noto",
                          ),
                        ),
                        TextSpan(
                          text: " and ",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontFamily: "Noto",
                          ),
                        ),
                        TextSpan(
                          text: "motivated",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "Noto",
                          ),
                        ),
                        TextSpan(
                          text: " creative developer,",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline1?.color,
                            fontFamily: "Noto",
                          ),
                        ),
                        TextSpan(
                          text: " reachout!",
                          style: TextStyle(
                            fontSize: fontSize,
                            color: Theme.of(context).textTheme.headline6?.color,
                            fontFamily: "Noto",
                          ),
                        ),
                      ])),
                  SizedBox(
                    height: 30,
                  ),
                  TextButton.icon(
                      onPressed: () {
                        launch("mailto:paulcbt@outlook.com");
                      },
                      icon: Icon(Icons.mail_outline,
                          size: 30,
                          color: Theme.of(context).textTheme.bodyText2?.color),
                      label: Text(
                        "Mail",
                        style: TextStyle(
                            fontSize: 20,
                            color:
                                Theme.of(context).textTheme.bodyText2?.color),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Signature()
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
                height: 400,
              ),
            )
          ],
        ));
  }
}
