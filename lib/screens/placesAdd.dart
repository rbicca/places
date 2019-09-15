import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import 'package:places/widgets/imageInput.dart';
import 'package:places/providers/places.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {

  TextEditingController _titleControler;
  File _pickedImage;

  @override
  void initState() {
    super.initState();
      _titleControler = TextEditingController();  
  }

  void _selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _savePlace(){
    if(_titleControler.text.isEmpty || _pickedImage == null){
      return;
    }

    Provider.of<PlacesProvider>(context, listen: false).addPlace(_titleControler.text, _pickedImage);

    Navigator.of(context).pop();

  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              CupertinoIcons.back,
              color: CupertinoColors.black,
            )),
        middle: Text('Add a New Place'),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 60,width: double.infinity,),
            Expanded(child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: <Widget>[
                  CupertinoTextField(
                    placeholder: 'Title',
                    controller: _titleControler,
                    decoration: BoxDecoration(border: Border.all(width: 0.0, color: CupertinoColors.inactiveGray,),
                    borderRadius: BorderRadius.circular(15.0),),
                  ),
                  SizedBox(height: 10,),
                  ImageInput(_selectImage),
                ],),
              ),
            ),),
            SizedBox(height: 30,),
            CupertinoButton(
              onPressed: _savePlace,
              color: CupertinoColors.activeBlue,
              child: Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(CupertinoIcons.add,color: CupertinoColors.white, ),
                  Text('Add Place', style: TextStyle(color: CupertinoColors.white),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
