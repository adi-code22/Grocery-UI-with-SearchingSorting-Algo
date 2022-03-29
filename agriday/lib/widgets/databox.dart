import 'package:agriday/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

class databox extends StatefulWidget {
  databox(
    this.sort, {
    Key? key,
  }) : super(key: key);
  int sort = 2;

  @override
  State<databox> createState() => _databoxState();
}

class _databoxState extends State<databox> {
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
            var items = data.data as List<Fruit>;
            return ListView.builder(
                reverse: widget.sort == 2 || widget.sort == 4 ? true : false,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items == null ? 0 : items.length,
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
                                        style: TextStyle(fontSize: 15),
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
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  items[index]
                                                      .product
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "Product",
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
                                                      .avgweight
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  "avg weight",
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
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  items[index]
                                                      .variety
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
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
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
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
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Container(
                                                height: 30,
                                                width: 100,
                                                color: Color(0xff21212114),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "₹" +
                                                        items[index]
                                                            .price
                                                            .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff27AE60),
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
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "Boxes",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      items[index]
                                                          .boxes
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    Text(
                                                      "Delivery",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                color: Color(0xFFF4F4DD),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
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
