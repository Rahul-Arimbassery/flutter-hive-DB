import 'package:flutter/material.dart';

class MultiChild extends StatelessWidget {
  const MultiChild({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('1',style: TextStyle(color: Colors.white),)),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.red,
              child: const Center(child: Text('2',style: TextStyle(color: Colors.white),)),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.black,
              child: const Center(child: Text('3',style: TextStyle(color: Colors.white),)),
            ),

            Container(
              width: 100,
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('4',style: TextStyle(color: Colors.white),)),
            )
          ],         
        ),
      ),
    );
  }
}