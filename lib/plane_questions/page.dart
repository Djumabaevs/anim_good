import 'dart:js';

import 'package:anim_good/plane_questions/item_fader.dart';
import 'package:flutter/material.dart';

class PageV extends StatefulWidget {
  PageV(
      {Key? key,
      required this.number,
      required this.question,
      required this.answers,
      required this.onOptionsSelected})
      : super(key: key);

  final int number;
  final String question;
  final List<String> answers;
  final Function onOptionsSelected;

  @override
  State<PageV> createState() => _PageVState();
}

class _PageVState extends State<PageV> {
  late List<GlobalKey<_ItemFaderState>> keys;
  int position = 1;

  @override
  void initState() {
    super.initState();
    keys = List.generate(
      5,
      (index) => GlobalKey<_ItemFaderState>(),
    );

    onInit();
  }

  void onInit() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState?.show();
    }
  }

  void show() {
    setState(() => position = 1);
    _animationController.forward();
  }

  void onTap() async {
    for (GlobalKey<_ItemFaderState> key in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      key.currentState?.hide();
    }
    widget.onOptionsSelected();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
        ),
        ItemFader(key: keys[0], child: StepNumber(number: widget.number)),
        ItemFader(
          key: keys[1],
          child: StepQuestion(question: widget.question),
        ),
        Spacer(),
        ...widget.answers.map((String answer) {
          int answerIndex = widget.answers.indexOf(answer);
          int keyIndex = answerIndex + 2;
          return ItemFader(
            key: keys[keyIndex],
            child: OptionItem(
            name: answer,
            onTap: widget.onOptionsSelected,
          );)
        }),
        SizedBox(
          height: 64,
        )
      ],
    );
  }
}

Future<void> animateDot(Offset startOffset) async {
  OverlayEntry entry = OverlayEntry(
    builder: (context) {
      double minTop = MediaQuery.of(context).padding.top + 52;
      return AnimatedBuilder(
        animation: animationController,
       builder: (context, child) {
         return Positioned(
           left: 76,
           top: minTop + 
           (startOffset.dy - minTop) * 
           (1 - animationController.value),
           child: child,
         );
       },
       child: Dot(),
       );
    },
    );
    Overlay.of(context).insert(entry);
    await animationController.forward(from: 0);
    entry.remove();
}
