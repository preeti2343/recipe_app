import 'package:flutter/material.dart';
import 'package:my_recipeapp/landing.dart';
import 'home.dart'; // Import the home page

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/', // Define the initial route
    routes: {
      '/': (context) => LandingPage(), // Define route for LandingPage
      '/home': (context) => HomePage(), // Define route for HomePage
    },
    theme: ThemeData.light(),
  ));
}
