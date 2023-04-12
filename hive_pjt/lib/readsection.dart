import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_pjt/detailsscreen.dart';
import 'package:hive_pjt/editpage.dart';
import 'package:hive_pjt/writesection.dart';

class ShowData extends StatefulWidget {
  const ShowData({Key? key}) : super(key: key);

  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final _myBox = Hive.box('mybox');
  String _searchQuery = '';

  List<Widget> _getData() {
    List<Widget> tiles = [];
    for (int i = 0; i < _myBox.length; i += 5) {
      final name = _myBox.get(i) as String?;
      final age = _myBox.get(i + 1) as String?;
      final rollNumber = _myBox.get(i + 2) as String?;
      final classValue = _myBox.get(i + 3) as String?;
      final imagePath = _myBox.get(i + 4) as String?;

      if (_searchQuery.isNotEmpty &&
          !name!.toLowerCase().contains(_searchQuery.toLowerCase())) {
        continue; // skip the tile if the name doesn't match the search query
      }

      tiles.add(ListTile(
        title: Text('Name: $name'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Age: $age'),
            Text('Roll Number: $rollNumber'),
            Text('Class: $classValue'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditScreen(
                      name: name!,
                      age: age!,
                      rollNumber: rollNumber!,
                      classValue: classValue!,
                      imagePath: imagePath,
                      index: i,
                    ),
                  ),
                ).then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                });
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  // Delete the record from the Hive database
                  _myBox.deleteAt(i + 4);
                  _myBox.deleteAt(i + 3);
                  _myBox.deleteAt(i + 2);
                  _myBox.deleteAt(i + 1);
                  _myBox.deleteAt(i);
                  j = 0;
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        leading: imagePath != null
            ? CircleAvatar(
                radius: 30,
                backgroundImage: FileImage(File(imagePath)),
              )
            : const Icon(Icons.person),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                name: name,
                age: age,
                rollNumber: rollNumber,
                classValue: classValue,
                imagePath: imagePath,
              ),
            ),
          );
        },
      ));
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _myBox.listenable(),
        builder: (context, Box box, _) {
          return ListView(
            children: _getData(),
          );
        },
      ),
    );
  }
}
