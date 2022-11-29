import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaScoreTitle extends StatelessWidget {
  final bool isBig;
  const LeaScoreTitle({super.key, required this.isBig});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: isBig ? 250 : null,
            child: Text(
              "Psychological & metabolic health risk profile",
              textAlign: isBig ? TextAlign.justify : TextAlign.center,
              style: TextStyle(fontSize: isBig ? 22 : 14),
            )),
        InkWell(
          onTap: () {
            launch("https://www.leascore.com");
          },
          child: Text(
            "-> Go to leascore.com",
            style:
                TextStyle(color: Theme.of(context).textTheme.headline4?.color),
          ),
        )
      ],
    );
  }
}
