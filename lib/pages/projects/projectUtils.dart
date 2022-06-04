import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/pages/contact.dart';

Widget getDescForProject(Project project, BuildContext context) {
  double descFontSize = 14;
  switch (project) {
    case Project.leaScore:
      return Column(
        children: [
          Container(
            child: Text(
              "Main Features Include:",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyText2?.color),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "- Pdf medical export",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Animated Graphs",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Excel medical Export",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Localization",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
            ],
          ),
        ],
      );
    case Project.outLearn:
      return Column(
        children: [
          Container(
            child: Text(
              "Main Features Include:",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyText2?.color),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "- In App purchases",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Local Notifications",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Image Occlusion",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- LaTeX support",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Pdf export",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
            ],
          ),
        ],
      );
    case Project.kjMethod:
      return Column(
        children: [
          Container(
            child: Text(
              "Main Features Include:",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyText2?.color),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "- In App purchases",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Text To Speech",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Connection with Kartra",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
            ],
          ),
        ],
      );
    case Project.teacherATN:
      return Column(
        children: [
          Container(
            child: Text(
              "Main Features Include:",
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).textTheme.bodyText2?.color),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "- Youtube player",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
              Text(
                "- Dictionaries APIs",
                style: TextStyle(
                    fontSize: descFontSize,
                    color: Theme.of(context).textTheme.bodyText2?.color),
              ),
            ],
          ),
        ],
      );

    default:
      return Container();
  }
}
