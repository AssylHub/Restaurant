import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.index});

  final int index;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Icon> starIcons() {
    List<Icon> stars = [];

    for (int i = 0; i < 5; i++) {
      stars.add(const Icon(
        Icons.star,
        color: Colors.amber,
      ));
    }

    return stars;
  }

  List detailsPageItems = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/text.json');
    final data = await jsonDecode(response);

    final detailsPageContent = data.firstWhere((page) =>
        page['name'] == "Details page ${widget.index + 1}")["content"];
    setState(() {
      // _foods = data["foods"];
      // categories = categoriesData;
      // popularFoodss = popularFoodssData;
      detailsPageItems = detailsPageContent;
      print(detailsPageItems);
    });

    // print(categories);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   readJson();
      // }),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Details'),
      ),
      body: detailsPageItems.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Material(
                        elevation: 5,
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      detailsPageItems[0],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      detailsPageItems[1],
                                      style: TextStyle(
                                          color: Colors.blue.shade900,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextColumn(
                                            title: detailsPageItems[2],
                                            text: detailsPageItems[3],
                                          ),
                                          VerticalDivider(),
                                          TextColumn(
                                            title: detailsPageItems[4],
                                            text: detailsPageItems[5],
                                          ),
                                          VerticalDivider(),
                                          TextColumn(
                                            title: detailsPageItems[6],
                                            text: detailsPageItems[7],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Image.asset(
                                "assets/popular_food1.jpg",
                                fit: BoxFit.cover,
                              ))
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -15,
                        right: 20,
                        child: Material(
                          elevation: 5,
                          child: Container(
                            width: 150,
                            color: Colors.white,
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  detailsPageItems[8],
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: starIcons(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detailsPageItems[9],
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            detailsPageItems[10],
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detailsPageItems[11],
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return StepsBuilder(
                                  num: index,
                                  text: detailsPageItems[12 + index],
                                );
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
    );
  }
}

class StepsBuilder extends StatelessWidget {
  const StepsBuilder({
    super.key,
    required this.num, required this.text,
    // this.text,
  });

  final int num;
  final String text;
  // final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 3),
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "${num + 1}",
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
    required this.title,
    required this.text,
  });

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.red, fontSize: 10),
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10),
        ),
      ],
    );
  }
}
