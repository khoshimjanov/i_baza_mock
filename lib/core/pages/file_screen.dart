import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';

import '../../assets/constants/icons.dart';

class Simplea extends StatefulWidget {
  const Simplea({super.key});

  @override
  State<Simplea> createState() => _SimpleaState();
}

class _SimpleaState extends State<Simplea> {
  File? avatar;

  Future<void> pickAvatar() async {
    ImagePicker imagePicker = ImagePicker();

    // final file = await imagePicker.pickImage(source: ImageSource.gallery);

    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  List<File> files = [];

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.isNotEmpty) {
      files.addAll(result.files
          .map(
            (file) => File.fromUri(
              Uri.file(file.path ?? ''),
            ),
          )
          .toList());
      setState(() {});
      // setState(() {
      //   avatar = File.fromUri(Uri.file(file.path));
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Plugins'),
      ),
      body: Column(
        children: [
          const Gap(20),
          Stack(children: [
            Align(
              child: Container(
                width: 150,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: avatar == null
                    ? const Icon(Icons.person, size: 100, color: Colors.grey)
                    : Image.file(
                        avatar!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: SvgPicture.asset(AppIcons.editPen),
            ),
          ]),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(
                files.length,
                (index) => GestureDetector(
                      onTap: () async {
                        await OpenFile.open(files[index].path);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          files[index].path.split(Platform.pathSeparator).last,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton.large(
            onPressed: pickAvatar,
            tooltip: "Pick an avatar",
            child: const Icon(Icons.add),
          ),

//
          FloatingActionButton.large(
            onPressed: pickFile,
            tooltip: "Pick file ",
            child: Icon(Icons.file_download),
          ),
        ],
      ),
    );
  }
}
