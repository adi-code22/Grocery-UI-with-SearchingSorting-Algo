import 'package:flutter/material.dart';

class hscroll extends StatefulWidget {
  const hscroll(
    this.url,
    this.name, {
    Key? key,
  }) : super(key: key);

  final String url;
  final String name;

  @override
  State<hscroll> createState() => _hscrollState();
}

class _hscrollState extends State<hscroll> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(widget.url)),
              color: Colors.blue,
              border: Border.all(color: Colors.white),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Text(widget.name)
        ],
      ),
    );
  }
}
