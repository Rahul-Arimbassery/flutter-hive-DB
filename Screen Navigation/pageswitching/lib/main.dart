import 'package:flutter/material.dart';
import 'package:pageswitching/page/page1.dart';
import 'package:pageswitching/page/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Screen NAvigation",
      theme: ThemeData(primaryColor: Colors.blue),
      home: const Page1(),
      routes: {
        'page1': (ctx) {
          return const Page1();
        },
        'page2': (ctx) {
          return const Page2();
        }
      },
    );
  }
}
