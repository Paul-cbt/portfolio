import 'package:flutter/material.dart';
import 'package:portfolio/pages/aboutMe/tooltipSpan.dart';

List<InlineSpan> aboutMeTextSpans(double fontSize, BuildContext context) {
  return [
    TextSpan(
      text: "I'm Paul, a 19 years old developer from ",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline1?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: "Munich, Germany.",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline6?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: " I have ",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline1?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: "2.5 years",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline6?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: " of experience working with Flutter.\n",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline1?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: "In fact, I developed my first app (OutLearn) when I was 16",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline1?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: " and thanks to my multiple professional projects I've become ",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline1?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: " fluent",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline6?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TextSpan(
      text: " in it and learned to work well with",
      style: TextStyle(
        fontSize: fontSize,
        color: Theme.of(context).textTheme.headline1?.color,
        fontFamily: "QuickSand",
      ),
    ),
    TooltipSpan(
      message: 'Firebase, node.js and various kinds of APIs',
      inlineSpan: TextSpan(
        text: " surrounding technologies",
        style: TextStyle(
          fontSize: fontSize,
          color: Theme.of(context).textTheme.headline6?.color,
          fontFamily: "QuickSand",
        ),
      ),
    )
  ];
}
