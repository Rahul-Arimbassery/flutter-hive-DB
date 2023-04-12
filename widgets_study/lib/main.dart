import 'package:flutter/material.dart';
import 'package:widgets_study/container.dart';
import 'package:widgets_study/listview_gridview.dart';
import 'package:widgets_study/multichild.dart';
//import 'package:widgets_study/singleChild.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'RAHUL R',
      home: Scaffold(
        body: Center(
         //child: ContainerControl(),
         //child: SingleChild(),
         //child: MultiChild(),
         child: ListViewGrid(),
        ),
      ),
    );
  }
}
