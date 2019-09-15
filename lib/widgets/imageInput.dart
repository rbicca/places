import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  const ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {

  File _storedImage; 

  Future<void> _takePicture() async {
    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600
    );
    if(imageFile == null) { return; }
    
    setState(() {
      _storedImage = imageFile;
    });

    final fileName = path.basename(imageFile.path);
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);

  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 170,
        height: 170,
        alignment: Alignment.center,
        decoration: BoxDecoration(border: Border.all(width: 1, color: CupertinoColors.darkBackgroundGray)),
        child: _storedImage != null ? Image.file(_storedImage, fit: BoxFit.cover, width: double.infinity,) 
                                    : Text('No image taken', textAlign: TextAlign.center,),
      ),
      Container(
        width: 150,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CupertinoButton(
                onPressed: _takePicture,
                color: CupertinoColors.activeBlue,
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                        Icon(CupertinoIcons.photo_camera,color: CupertinoColors.white, ),
                        SizedBox(width: 5,),
                        Text('Take Picture', style: TextStyle(color: CupertinoColors.white),),
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    ],
    );
  }
}