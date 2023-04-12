import 'package:flutter/material.dart';
import 'package:widgets_study/singleChild.dart';

class ContainerControl extends StatelessWidget {
  const ContainerControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .5,
      margin: const EdgeInsets.all(20),
      //color: Colors.red,
      decoration: BoxDecoration(
          color: Colors.yellow,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                color: Colors.black,
                spreadRadius: 10,
                blurRadius: 10,
                offset: Offset(20, 20))
          ]),
      child: const Center(
        //child: Text('RAHUL R'),
        child: SingleChild(),
      ),
    );
  }
}
