import 'package:flutter/material.dart';
import 'package:restaurant/home_screen.dart';
import 'package:restaurant/login_screen.dart';
import 'package:restaurant/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.red, // <-- your color
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/login": (context) => LoginScreen(),
        "/home": (context) => HomeScreen(),

      },
    );
  }
}
