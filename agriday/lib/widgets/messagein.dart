import 'package:flutter/material.dart';

class MessageIn extends StatefulWidget {
  MessageIn(
    this.s, {
    Key? key,
  }) : super(key: key);

  String s = "";

  @override
  State<MessageIn> createState() => _MessageInState();
}

class _MessageInState extends State<MessageIn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.s,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
