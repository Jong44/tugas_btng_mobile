import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoes/components/ContainerShoes.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List kategori = ["All Shoes", "Running", "Hiking", "Football", "Basket"];
  int kategoriIndex = 0;

  List<dynamic> data = [];
  List<dynamic> dataAll = [];

  Future<void> getData() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/shoes.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    setState(() {
      data = jsonData;
      dataAll = jsonData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List"),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (kategori[index] != "All Shoes") {
                                    data = dataAll;
                                    data = data
                                        .where((item) => item['category']
                                            .contains(kategori[index]))
                                        .toList();
                                  } else {
                                    data = dataAll;
                                  }
                                  kategoriIndex = index;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: kategoriIndex == index
                                      ? Colors.blue
                                      : Colors.white,
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  kategori[index],
                                  style: TextStyle(
                                    color: kategoriIndex == index
                                        ? Colors.white
                                        : Colors.grey,
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ContainerShoes(
                              title: data[index]['name'],
                              price: data[index]['price'],
                              category: data[index]['category']),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  ),
                )
              ],
            )));
  }
}
