import 'package:flutter/cupertino.dart';

import 'package:places/screens/placesAdd.dart';
import 'package:places/screens/placesList.dart';

import 'package:provider/provider.dart';
import 'package:places/providers/places.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: CupertinoApp(
        title: 'Great Places',
        theme:  CupertinoThemeData(
          primaryColor: Color(0x999999),
          primaryContrastingColor: Color(0x123456),
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName: (ctx) => AddPlacesScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
