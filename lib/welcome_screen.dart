import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Hero(
              tag: "logo",
              child: SizedBox(
                width: 200,
                child: Image.asset("assets/logo.png"),
              ),
            ),
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/screen1_back_enhanced.png"),
            fit: BoxFit.cover,
          )),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
          shape: CircleBorder(),
          child: Text(
            "Skip",
            style: TextStyle(color: Colors.amber.shade700),
          ),
        ),
        // appBar: ,
      );
  }
}