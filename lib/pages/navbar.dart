import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatefulWidget {
  final PageController controller;
  const NavBar({required this.controller});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 450
        ? Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 65),
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.topRight,
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: MediaQuery.of(context).size.width > 375 ? 15 : 5,
              children: [
                TextButton(
                    onPressed: () {
                      widget.controller.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Home",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                TextButton(
                    onPressed: () {
                      widget.controller.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Projects",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                TextButton(
                    onPressed: () {
                      widget.controller.animateToPage(3,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      "Contact",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                TextButton(
                    onPressed: () {
                      launch("https://www.fiverr.com/cpaul08");
                    },
                    child: Text(
                      "Fiverr",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                TextButton(
                    onPressed: () {
                      launch("https://github.com/Paul-cbt/portfolio");
                    },
                    child: Text(
                      "GitHub",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
              ],
            ),
          )
        : IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          );
  }
}

class EndNavBar extends StatefulWidget {
  final PageController controller;
  const EndNavBar({Key? key, required this.controller}) : super(key: key);

  @override
  State<EndNavBar> createState() => _EndNavBarState();
}

class _EndNavBarState extends State<EndNavBar> {
  @override
  Widget build(BuildContext context) {
    TextStyle elementStyle = TextStyle(fontSize: 20, color: Colors.white);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        color: Theme.of(context).textTheme.headline6!.color,
      ),
      width: 200,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close, color: Colors.white))
            ],
          ),
          SizedBox(
            height: 70,
          ),
          TextButton(
              onPressed: () {
                widget.controller.animateToPage(0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Home",
                      style: elementStyle,
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
            width: 100,
            child: Divider(
              thickness: 1,
            ),
          ),
          TextButton(
              onPressed: () {
                widget.controller.animateToPage(2,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Projects", style: elementStyle),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
            width: 100,
            child: Divider(
              thickness: 1,
            ),
          ),
          TextButton(
              onPressed: () {
                widget.controller.animateToPage(3,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Icon(
                      Icons.alternate_email,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Contact", style: elementStyle),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
            width: 100,
            child: Divider(
              thickness: 1,
            ),
          ),
          TextButton(
              onPressed: () {
                launch("https://www.fiverr.com/cpaul08");
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("Fiverr", style: elementStyle),
                  ],
                ),
              )),
          SizedBox(
            height: 10,
            width: 100,
            child: Divider(
              thickness: 1,
            ),
          ),
          TextButton(
              onPressed: () {
                launch("https://github.com/Paul-cbt/portfolio");
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 120,
                child: Row(
                  children: [
                    Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("GitHub", style: elementStyle),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
