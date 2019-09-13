import 'package:flutter/cupertino.dart';
import 'package:places/screens/placesAdd.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Your Places'),
        trailing: GestureDetector(
          onTap: () { Navigator.of(context).pushNamed(AddPlacesScreen.routeName); },  
          child: Icon(
            CupertinoIcons.add,
            color: CupertinoColors.black,
          ),
        ),
      ),
      child: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
