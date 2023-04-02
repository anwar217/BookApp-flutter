import 'package:bookapp/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      title: 'My Bookshelf',
      theme: ThemeData(
        
     colorScheme: ColorScheme(
        primary: Color.fromARGB(255, 21, 199, 86),
        primaryVariant: Color.fromARGB(255, 21, 199, 86),
        secondary: Color.fromARGB(255, 0, 0, 0),
        secondaryVariant: Color.fromARGB(255, 0, 0, 0),
        surface: Colors.black,
        background: Colors.black,
        error: Colors.red,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.black,
        onBackground: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
