import 'package:flutter/material.dart';

class MessageOut extends StatefulWidget {
  MessageOut(
    this.s, {
    Key? key,
  }) : super(key: key);

  String s = "";

  @override
  State<MessageOut> createState() => _MessageOutState();
}

class _MessageOutState extends State<MessageOut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.s,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            color: const Color(0xff27AE60),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: const Radius.circular(10)),
            border: Border.all(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
