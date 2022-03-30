// ignore_for_file: unnecessary_const

import 'package:agriday/widgets/databox.dart';
import 'package:flutter/material.dart';

import 'widgets/hscroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sortindex = 0;
  String s = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: const Text(
            "Buy",
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[300],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 250,
                  child: TextField(
                    onChanged: (value) {
                      s = value;
                      setState(() {
                        databox(sortindex, value);
                      });
                    },
                    style: const TextStyle(
                      color: Colors.blue,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 17.0)),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return FractionallySizedBox(
                                heightFactor: 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text("Name",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    sortindex = 1;

                                                    Navigator.pop(context);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_upward,
                                                  color: sortindex != 1
                                                      ? Colors.black
                                                      : const Color(0xff219653),
                                                ),
                                              ),
                                              Text("A -> Z",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: sortindex != 1
                                                          ? Colors.black
                                                          : const Color(
                                                              0xff219653)))
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    sortindex = 2;

                                                    Navigator.pop(context);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_downward,
                                                  color: sortindex != 2
                                                      ? Colors.black
                                                      : const Color(0xff219653),
                                                ),
                                              ),
                                              Text("Z -> A",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: sortindex != 2
                                                          ? Colors.black
                                                          : const Color(
                                                              0xff219653)))
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text("Price",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    sortindex = 3;

                                                    Navigator.pop(context);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_upward,
                                                  color: sortindex != 3
                                                      ? Colors.black
                                                      : const Color(0xff219653),
                                                ),
                                              ),
                                              Text("1 -> 9",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: sortindex != 3
                                                          ? Colors.black
                                                          : const Color(
                                                              0xff219653)))
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    sortindex = 4;

                                                    Navigator.pop(context);
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_downward,
                                                  color: sortindex != 4
                                                      ? Colors.black
                                                      : const Color(0xff219653),
                                                ),
                                              ),
                                              Text("9 -> 1",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: sortindex != 4
                                                          ? Colors.black
                                                          : const Color(
                                                              0xff219653)))
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.sort,
                      ),
                      tooltip: "Sort",
                    ),
                    const Text(
                      "Sort",
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  hscroll(
                      "https://media.istockphoto.com/photos/red-apple-with-leaf-isolated-on-white-background-picture-id185262648?b=1&k=20&m=185262648&s=170667a&w=0&h=2ouM2rkF5oBplBmZdqs3hSOdBzA4mcGNCoF2P0KUMTM=",
                      "Apple"),
                  hscroll(
                      "https://media.istockphoto.com/photos/green-grape-isolated-on-white-background-picture-id489520104?k=20&m=489520104&s=612x612&w=0&h=n1_B8jn9fb4dQibPhkXftNpjKA4Rvrjp_ttgj6sq5jY=",
                      "Grapes"),
                  hscroll(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcU_mjwe_m8JGxeZEB-_XZQ5dEToGI2fHkXQ&usqp=CAU",
                      "Lemons"),
                  hscroll(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe5TtaDf-UR7zfSg9HS9dy0LoECHSaUfxlnA&usqp=CAU",
                      "Watermelon"),
                  hscroll(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKfFxG40IBSC5tufNvvFSewTs6ksVEagDbAw&usqp=CAU",
                      "Mango")
                ],
              ),
            ),
            databox(sortindex, s)
          ],
        ),
      ),
    );
  }
}
