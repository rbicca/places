import 'package:flutter/foundation.dart';
import 'package:places/helpers/database.dart';
import 'dart:io';

import 'package:places/models/CPlace.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  
  List<Place> get items{
    return [..._items];
  }
  
  void addPlace(String title, File pickedImage){
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: title,
      location: null
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id, 
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async{
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map( (item) => Place(
                                  id: item['id'],
                                  title: item['title'],
                                  image: File(item['image']),
                                  location: null,
                            )).toList();
    notifyListeners();
  }


}