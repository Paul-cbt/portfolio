import 'dart:async';

import 'package:flutter/material.dart';

class QuoteBuilder extends StatefulWidget {
  final double maxWidth;
  final bool center;
  const QuoteBuilder({Key? key, required this.maxWidth, this.center = false})
      : super(key: key);

  @override
  State<QuoteBuilder> createState() => _QuoteBuilderState();
}

class _QuoteBuilderState extends State<QuoteBuilder> {
  double fontSize = 14;
  late Timer timer;
  PageController controller = PageController();

  List<String> quotes = [
    'Amazing as always',
    'He is very good and talented! Merci paul!',
    'Amazing seller, I had to book him again for his quality work',
    'I highly recommend his skills and willingness to help you create your project'
  ];
  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 8000), (timer) {
      setState(() {
        if (controller.page == quotes.length - 1) {
          controller.animateToPage(0,
              duration: Duration(milliseconds: 1300), curve: Curves.easeInOut);
        } else {
          controller.nextPage(
              duration: Duration(milliseconds: 1300), curve: Curves.easeInOut);
        }
      });
    });
    quotes.shuffle();
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
      height: 100,
      width: widget.maxWidth,
      child: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            constraints:
                BoxConstraints(maxWidth: widget.maxWidth, maxHeight: 50),
            child: RichText(
              text: TextSpan(
                  text: '"',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Theme.of(context).textTheme.headline6?.color,
                    fontFamily: "Noto",
                  ),
                  children: [
                    TextSpan(text: quotes[index]),
                    TextSpan(text: '"')
                  ]),
              textAlign: widget.center ? TextAlign.center : TextAlign.left,
            ),
          );
        },
        itemCount: quotes.length,
      ),
    );
  }
}
