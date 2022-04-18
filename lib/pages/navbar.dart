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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        color: Theme.of(context).textTheme.headline6!.color,
      ),
      width: 200,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
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
      )),
    );
  }
}
