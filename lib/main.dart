import 'package:flutter_course/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: GradientContainer(colors: [
        Color.fromARGB(255, 71, 119, 208),
        Color.fromARGB(255, 45, 7, 98)
      ])),
    ),
  );
}
