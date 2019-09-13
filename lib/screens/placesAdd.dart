import 'package:flutter/cupertino.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {

  TextEditingController _titleControler;

  @override
  void initState() {
    super.initState();
      _titleControler = TextEditingController();  
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 60,),
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
                  SizedBox(height: 20,),
                  CupertinoTextField(
                    placeholder: 'Text Message',
                    decoration: BoxDecoration(border: Border.all(width: 0.0, color: CupertinoColors.inactiveGray,),
                    borderRadius: BorderRadius.circular(15.0),),
                  ),
                  SizedBox(height: 20,),
                  CupertinoTextField(
                    placeholder: 'Text Message',
                    decoration: BoxDecoration(border: Border.all(width: 0.0, color: CupertinoColors.inactiveGray,),
                    borderRadius: BorderRadius.circular(15.0),),
                  ),
                ],),
              ),
            ),),
            SizedBox(height: 30,),
            CupertinoButton(
              onPressed: (){},
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
