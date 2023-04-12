import 'package:flutter/material.dart';

class ListViewGrid extends StatelessWidget {
  const ListViewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(child: Text('1',style: TextStyle(color: Colors.white),)),
            ),

            Container(
              width: 200,
              height: 200,
              color: Colors.red,
              child: const Center(child: Text('2',style: TextStyle(color: Colors.white),)),
            ),

            Container(
              width: 200,
              height: 200,
              color: Colors.black,
              child: const Center(child: Text('3',style: TextStyle(color: Colors.white),)),
            ),

            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
              child: const Center(child: Text('4',style: TextStyle(color: Colors.white),)),
            )
          ],         
        ),
      ),
    );
  }
}