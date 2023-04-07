import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('PAGE 1'),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('page2');
              },
              child: const Text('GO TO PAGE 2'),
            )
          ],
        ),
      ),
    );
  }
}
