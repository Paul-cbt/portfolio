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
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 65),
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
                "home",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          TextButton(
              onPressed: () {
                widget.controller.animateToPage(2,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: Text(
                "projects",
                style: Theme.of(context).textTheme.bodyText1,
              )),
          TextButton(
              onPressed: () {
                widget.controller.animateToPage(3,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: Text(
                "contact",
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
    );
  }
}
