import 'package:agriday/widgets/messagein.dart';
import 'package:agriday/widgets/messageout.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  String? seller;
  String? product;
  String? variety;
  int? price;
  int? avgweight;
  int? perbox;
  int? boxes;
  String? delivery;
  Chat(this.seller, this.product, this.variety, this.price, this.avgweight,
      this.perbox, this.boxes, this.delivery,
      {Key? key})
      : super(key: key);
  List<String> messages = <String>["How fast can you deliver?"];
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.seller.toString(),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Lot Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
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
                                  widget.seller.toString(),
                                  style: const TextStyle(fontSize: 15),
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
                                            widget.product.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          const Text(
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
                                            widget.avgweight.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          const Text(
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
                                            widget.variety.toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
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
                                            widget.perbox.toString() + "kg",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
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
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          color: const Color(
                                              // ignore: use_full_hex_values_for_flutter_colors
                                              0xff21212114),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "₹" + widget.price.toString(),
                                              style: const TextStyle(
                                                  color: Color(0xff27AE60),
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                widget.boxes.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              const Text(
                                                "Boxes",
                                                style: TextStyle(
                                                    color: Colors.grey,
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
                                                widget.boxes.toString(),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              const Text(
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
                          color: const Color(0xFFF4F4DD),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            MessageIn("Hello Buyer we have " +
                widget.product.toString() +
                " ready to ship"),
            MessageIn("Do let me know"),
            ListView.builder(
                itemCount: widget.messages.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return MessageOut(widget.messages[index]);
                })
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 15,
              height: 55,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(3),
                    hintText: "Message",
                    hintStyle: TextStyle(color: Colors.black54),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff27AE60),
                ),
                onPressed: () {
                  setState(() {
                    widget.messages.add(_controller.text);
                  });
                },
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
