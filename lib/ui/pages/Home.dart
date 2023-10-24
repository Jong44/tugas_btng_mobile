import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoes/components/CardShoes1.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shoes/components/ContainerShoes.dart';
import 'package:shoes/ui/pages/List.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List kategori = ["All Shoes", "Running", "Hiking", "Football", "Basket"];
  int kategoriIndex = 0;

  List<dynamic> data = [];
  List<dynamic> dataAll = [];
  List<dynamic> dataNew = [];

  Future<void> getData() async {
    final String jsonString =
        await rootBundle.loadString('assets/data/shoes.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);
    setState(() {
      data = jsonData;
      dataAll = jsonData;
      dataNew = jsonData.where((item) => item['new']).toList();
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
        body: ListView(
      padding: EdgeInsets.only(top: 50, left: 20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Selamat Datang, User",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "@ryokf",
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
            Icon(
              CupertinoIcons.person_crop_circle_fill,
              size: 50,
              color: Colors.greenAccent,
            )
          ],
        ),
        Container(
          width: double.infinity,
          height: 100,
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
                                .where((item) =>
                                    item['category'].contains(kategori[index]))
                                .toList();
                          } else {
                            data = dataAll;
                          }
                          kategoriIndex = index;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: kategoriIndex == index
                              ? Colors.blue
                              : Colors.white,
                          border: Border.all(width: 1, color: Colors.grey),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Popular Product",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListPage()));
              },
              child: Row(
                children: [
                  Text(
                    "See all",
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    CupertinoIcons.arrow_right,
                    size: 10,
                    color: Colors.blue,
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 285,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CardShoes1(
                    title: data[index]['name'],
                    category: data[index]['category'],
                    price: data[index]['price'],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "New Arrivals",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
            height: 115.0 * dataNew.length,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataNew.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ContainerShoes(
                          title: dataNew[index]['name'],
                          price: dataNew[index]['price'],
                          category: dataNew[index]['category']),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                }))
      ],
    ));
  }
}
