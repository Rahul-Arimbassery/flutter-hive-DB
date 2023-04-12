import 'package:flutter/material.dart';
import 'package:hive_pjt/readsection.dart';
import 'package:hive_pjt/writesection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child:Text("Welcome to Student Data Base System")),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WriteSection()),
                );
              },
              color: Colors.blue,
              child: const Text('Write'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShowData()),
                );
              },
              color: Colors.red,
              child: const Text('Read'),
            ),
          ],
        ),
      ),
    );
  }
}
