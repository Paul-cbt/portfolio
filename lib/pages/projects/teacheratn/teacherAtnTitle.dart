import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TeacherAtnTitle extends StatelessWidget {
  final bool isBig;
  const TeacherAtnTitle({super.key, required this.isBig});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Text(
          "Fully functional language learning app, main features are video watch with clickable caption and integrated google translate",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: isBig ? 22 : 14),
        )),
      ],
    );
  }
}
