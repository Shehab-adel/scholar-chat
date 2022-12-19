import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ContainerChatWidget extends StatelessWidget {
  ContainerChatWidget(
      {Key? key,
      required this.color,
      this.bottomLeft,
      this.bottomRight,
      required this.text,
      required this.alignment})
      : super(key: key);
  Color color;
  Radius? bottomRight;
  Radius? bottomLeft;
  String text;
  Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomRight: bottomRight ?? const Radius.circular(0),
              bottomLeft: bottomLeft ?? const Radius.circular(0),
            )),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
