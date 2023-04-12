import 'package:flutter/material.dart';

class SingleChild extends StatelessWidget {
  const SingleChild({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: const Color.fromARGB(255, 28, 110, 178),
          width: 6,
        ),
      ),
      child: const Center(child: Text('hiiii...')),
    );
  }
}
