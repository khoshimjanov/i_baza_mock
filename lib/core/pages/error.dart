import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ibaza_mock_data/assets/constants/colors.dart';
import 'package:image_picker/image_picker.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  File? avatar;

  List<File> files = [];

  Future<void> pickAvatar() async {
    ImagePicker imagePicker = ImagePicker();

    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: pickAvatar,
        child: Container(
          width: 150,
          height: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: grey)),
          child: avatar == null
              ? const Icon(
                  Icons.person,
                  size: 100,
                )
              : Image.file(
                  avatar!,
                  fit: BoxFit.cover,
                ),
        ),
      )
          // Text("404 Page not found",style: TextStyle(fontSize: 40),),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAvatar,
        tooltip: 'Pick an avatar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
