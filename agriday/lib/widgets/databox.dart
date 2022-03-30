import 'package:agriday/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

class databox extends StatefulWidget {
  databox(
    this.sort,
    this.keyword, {
    Key? key,
  }) : super(key: key);
  int sort = 2;
  String keyword = "hi";

  @override
  State<databox> createState() => _databoxState();
}

class _databoxState extends State<databox> {
  // List<Fruit> _personList = [];
  // List<Fruit> _filteredList = [];
  // String filter = "";

  // @override
  // void initState() {
  //   Fruit pdb = new Fruit();
  //   //List<Fruit> tmpList = <Fruit>[];

  //   setState(() {
  //     _personList = [];
  //     _filteredList = _personList;
  //   });
  //   if (widget.keyword.isEmpty) {
  //     setState(() {
  //       _filteredList = _personList;
  //     });
  //   } else {
  //     setState(() {
  //       filter = widget.keyword;
  //     });
  //   }
  //   super.initState();
  // }
  // if((filter.isNotEmpty)) {
  //     List<Fruit> tmpList = <Fruit>[];
  //     for(int i = 0; i < _filteredList.length; i++) {
  //       if(_filteredList[i].product!.toLowerCase().contains(filter.toLowerCase())) {
  //         tmpList.add(_filteredList[i]);
  //       }
  //     }
  //     _filteredList = tmpList;
  //   }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _functiondecider(widget.sort),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            List<Fruit> items = data.data as List<Fruit>;

            List<Fruit> searchList = <Fruit>[];
            List<Fruit> tmpList = <Fruit>[];
            for (var element in items) {
              if (element.product!
                      .toLowerCase()
                      .contains(widget.keyword.toLowerCase()) ||
                  element.price!
                      .toString()
                      .contains(widget.keyword.toString())) {
                tmpList.add(element);
              }
              if (tmpList.length != 0) {
                items = tmpList;
              } else {
                items = [];
              }
            }
            return items.isNotEmpty
                ? ListView.builder(
                    reverse:
                        widget.sort == 2 || widget.sort == 4 ? true : false,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 180,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.white,
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              items[index].seller.toString(),
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            ),
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        items[index]
                                                            .product
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      const Text(
                                                        "Product",
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        items[index]
                                                            .avgweight
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      const Text(
                                                        "avg weight",
                                                        style: const TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        items[index]
                                                            .variety
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      const Text(
                                                        "Variety",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        items[index]
                                                                .perbox
                                                                .toString() +
                                                            "kg",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      const Text(
                                                        "per Box",
                                                        style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 10),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Container(
                                                      height: 30,
                                                      width: 100,
                                                      color: const Color(
                                                          0xff21212114),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          "₹" +
                                                              items[index]
                                                                  .price
                                                                  .toString(),
                                                          style: const TextStyle(
                                                              color: const Color(
                                                                  0xff27AE60),
                                                              fontSize: 20),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            items[index]
                                                                .boxes
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          ),
                                                          const Text(
                                                            "Boxes",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 10),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 25,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            items[index]
                                                                .boxes
                                                                .toString(),
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          ),
                                                          const Text(
                                                            "Delivery",
                                                            style:
                                                                const TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        10),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )),
                                      color: const Color(0xFFF4F4DD),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    })
                : Column(
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "No Search Results!",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ],
                  );
          } else {
            return const Center(child: const CircularProgressIndicator());
          }
        });
  }

  Future<List<Fruit>> readJson() async {
    final jsondata = await rootBundle.rootBundle.loadString('lib/Fruits.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Fruit.fromJson(e)).toList();
  }

  Future<List<Fruit>> ascendingProduct() async {
    try {
      final jsondata =
          await rootBundle.rootBundle.loadString('lib/Fruits.json');
      final list = json.decode(jsondata) as List<dynamic>;

      List<Fruit> ascendinglist =
          list.map((d) => new Fruit.fromJson(d)).toList();

      ascendinglist.sort((a, b) {
        return a.product!.toLowerCase().compareTo(b.product!.toLowerCase());
      });

      return ascendinglist;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Fruit>> ascendingPrice() async {
    try {
      final jsondata =
          await rootBundle.rootBundle.loadString('lib/Fruits.json');
      final list = json.decode(jsondata) as List<dynamic>;

      List<Fruit> ascendinglist =
          list.map((d) => new Fruit.fromJson(d)).toList();

      ascendinglist.sort((a, b) {
        return a.price!.compareTo(b.price!);
      });

      return ascendinglist;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<Fruit>> _functiondecider(int x) {
    switch (x) {
      case 0:
        return readJson();
      case 1:
        return ascendingProduct();
      case 2:
        return ascendingProduct();
      case 3:
        return ascendingPrice();
      case 4:
        return ascendingPrice();
    }
    throw (Error e) {
      print(e);
    };
  }
}
