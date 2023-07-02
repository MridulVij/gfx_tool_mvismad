// import 'package:flutter/material.dart';

// class ManualConfig extends StatefulWidget {
//   const ManualConfig({super.key});

//   @override
//   State<ManualConfig> createState() => _ManualConfigState();
// }

// class _ManualConfigState extends State<ManualConfig> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: TextButton(
//         onPressed: () {},
//         child: Text('Select Active.sav'),
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileManagerScreen extends StatefulWidget {
  @override
  _FileManagerScreenState createState() => _FileManagerScreenState();
}

class _FileManagerScreenState extends State<FileManagerScreen> {
  String _selectedFilePath = '';

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['sav'],
    );

    if (result != null) {
      setState(() {
        _selectedFilePath = result.files.single.path!;
      });

      // Move the selected file to the desired folder
      String desiredFolderPath = '/storage/emulated/0/Android/';
      String newFilePath = desiredFolderPath + result.files.single.name;
      await File(_selectedFilePath).copy(newFilePath);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File moved successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _openFilePicker,
              child: Text('Select .sav File'),
            ),
            SizedBox(height: 20),
            Text('Selected file: $_selectedFilePath'),
          ],
        ),
      ),
    );
  }
}
