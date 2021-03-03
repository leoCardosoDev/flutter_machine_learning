import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerDemo> {
  File _image;

  ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }

  Future<void> _chooseImageFromGallery() async {
    PickedFile pickedFile =
        await _imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future<void> _chooseImageFromCamera() async {
    PickedFile pickedFile =
        await _imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _image == null
                  ? Icon(
                      Icons.image,
                      size: 100,
                    )
                  : Image.file(_image),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: _chooseImageFromCamera,
              onLongPress: _chooseImageFromGallery,
              child: Text(
                "Choose/capture",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
