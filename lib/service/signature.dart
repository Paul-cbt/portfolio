// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class Signature extends StatefulWidget {
  const Signature({Key? key}) : super(key: key);

  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> with TickerProviderStateMixin {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  late Timer timer;
  late Timer timer2;

  bool show = false;
  bool showGif = false;

  late GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);

    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        show = true;
      });
      timer.cancel();
    });
    timer2 = Timer.periodic(Duration(milliseconds: 2500), (timer) {
      setState(() {
        showGif = true;
      });
      timer2.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: show
          ? FadeIn(
              duration: Duration(milliseconds: 200),
              child: Row(
                children: [
                  Container(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Sincerely,',
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              fontSize: MediaQuery.of(context).size.width > 1200
                                  ? 20
                                  : 15,
                              fontFamily: "QuickSand",
                              color: Theme.of(context)
                                  .canvasColor
                                  .withOpacity(0.6)),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                      onTap: () {},
                    ),
                  ),
                  Container(
                    height: 65,
                    child: showGif
                        ? Image(
                            image: AssetImage(
                              "oneLoop.gif",
                            ),
                            height: 60,
                            gaplessPlayback: false,
                            repeat: ImageRepeat.noRepeat,
                          )
                        : Container(),
                  )
                ],
              ),
            )
          : Container(),
    );
  }
}
