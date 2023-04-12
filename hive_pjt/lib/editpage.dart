import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  final int index;

  const EditScreen(
      {Key? key,
      required this.index,
      required String name,
      required String age,
      required String rollNumber,
      required String classValue,
      String? imagePath})
      : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _rollNumberController = TextEditingController();
  final _classController = TextEditingController();
  String? _imagePath;

  @override
  void initState() {
    super.initState();

    final _myBox = Hive.box('mybox');

    // Load the student details into the form fields
    _nameController.text = _myBox.get(widget.index) as String? ?? '';
    _ageController.text = _myBox.get(widget.index + 1) as String? ?? '';
    _rollNumberController.text = _myBox.get(widget.index + 2) as String? ?? '';
    _classController.text = _myBox.get(widget.index + 3) as String? ?? '';
    _imagePath = _myBox.get(widget.index + 4) as String?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ageController,
                  decoration: const InputDecoration(
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an age';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _rollNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Roll Number',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a roll number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _classController,
                  decoration: const InputDecoration(
                    labelText: 'Class',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a class';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _imagePath != null
                    ? Image.file(
                        File(_imagePath!),
                        height: 200,
                      )
                    : const SizedBox(height: 0),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () async {
                    final imagePicker = ImagePicker();
                    final pickedImage = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
        
                    if (pickedImage != null) {
                      setState(() {
                        _imagePath = pickedImage.path;
                      });
                    }
                  },
                  icon: const Icon(Icons.photo),
                  label: const Text('Choose Image'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
        // Save the student details to Hive
                      final _myBox = Hive.box('mybox');
                      _myBox.put(widget.index, _nameController.text);
                      _myBox.put(widget.index + 1, _ageController.text);
                      _myBox.put(widget.index + 2, _rollNumberController.text);
                      _myBox.put(widget.index + 3, _classController.text);
                      _myBox.put(widget.index + 4, _imagePath);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
