import 'package:flutter/material.dart';

class ContainerControl extends StatelessWidget {
  const ContainerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(20),
      //color: Colors.red,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.green,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Center(
        child: Text('RAHUL R'),
      ),
    );
  }
}
