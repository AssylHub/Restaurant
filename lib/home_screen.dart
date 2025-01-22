import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categoryImages = ["assets/hot-dish.png", "assets/croissant.png"];

  List categories = [];
  List popularFoodss = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/text.json');
    final data = await jsonDecode(response);

    final homePageContent =
        data.firstWhere((page) => page['name'] == "Home Page")["content"];
    final categoriesData = homePageContent.sublist(1, 4);
    final popularFoodssData = homePageContent.sublist(5);
    setState(() {
      // _foods = data["foods"];
      categories = categoriesData;
      popularFoodss = popularFoodssData;
    });

    // print(categories);
  }

  @override
  void initState() {
    // TODO: implement initState
    readJson();
    super.initState();

    // print(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   readJson();
      //   print(categories);
      //   print(popularFoodss);
      // }),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/food.jpg"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Main categories",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: categories.isEmpty
                  ? CircularProgressIndicator()
                  : Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CategoryCard(
                          assetPath: "assets/hot-dish.png",
                          text: categories[0],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CategoryCard(
                          assetPath: "assets/croissant.png",
                          text: categories[1],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CategoryCard(
                          assetPath: "assets/soup.png",
                          text: categories[2],
                        ),
                      ],
                    ),
            ),
            Text(
              "Popular food",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularFoodss.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      productAssetPath: popularFoodss[index]["image"]!,
                      productTitle: popularFoodss[index]["name"]!,
                      procuctText: popularFoodss[index]["description"]!,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen(
                                      index: index,
                                    )));
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productAssetPath,
    required this.productTitle,
    required this.procuctText,
    required this.onTap,
  });

  final String productAssetPath;
  final String productTitle;
  final String procuctText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 300,
        // height: 500,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Column(
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      productAssetPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      // alignment: Alignment.bottomRight,
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey,
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                productTitle,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Icon(
                              size: 30,
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                        Text(
                          procuctText,
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.assetPath,
    required this.text,
  });

  final String assetPath;
  final String text;
  static bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.amber,
              )),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 80,
                    child: Image.asset(assetPath),
                  ),
                ),
                Text(text)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
