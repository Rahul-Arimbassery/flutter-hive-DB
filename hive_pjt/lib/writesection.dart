import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WriteSection extends StatefulWidget {
  const WriteSection({Key? key}) : super(key: key);

  @override
  _WriteSectionState createState() => _WriteSectionState();
}

int j = 0;

class _WriteSectionState extends State<WriteSection> {
  final _myBox = Hive.box('mybox');
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _rollNumberController = TextEditingController();
  final _classController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = File(pickedFile!.path);
      });
    } catch (e) {
      //print('Error picking image: $e');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _rollNumberController.dispose();
    _classController.dispose();
    super.dispose();
  }

  void writeData(int key, dynamic value) {
    _myBox.put(key, value);
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Database Entry'),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: _image == null
                      ? ElevatedButton(
                          onPressed: () {
                            getImage();
                          },
                          child: const Text('Select Image'),
                        )
                      : Image.file(_image!),
                ),
                TextField(
                  style: const TextStyle(height: 0.1),
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: const TextStyle(height: 0.1),
                  controller: _ageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Age',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: const TextStyle(height: 0.1),
                  controller: _rollNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Roll Number',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: const TextStyle(height: 0.1),
                  controller: _classController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Class',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final name = _nameController.text;
                    final age = _ageController.text;
                    final rollNumber = _rollNumberController.text;
                    final classValue = _classController.text;

                    int i = j;
                    writeData(i, name);
                    writeData(i + 1, age);
                    writeData(i + 2, rollNumber);
                    writeData(i + 3, classValue);
                    writeData(i + 4, _image!.path);
                    _nameController.clear();
                    _ageController.clear();
                    _rollNumberController.clear();
                    _classController.clear();
                    setState(() {
                      _image = null;
                    });
                    j += 5;
                  },
                  icon: const Icon(Icons.save),
                  label: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),);
  }
}
