import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //Navigator.of(context).pushNamed('page1');
                  Navigator.of(context).pop();
                },
                child: const Text('Go Back to Page 1'))
          ],
        ),
      ),
    );
  }
}
