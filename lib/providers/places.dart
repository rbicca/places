import 'package:flutter/foundation.dart';

import 'package:places/models/CPlace.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];
  
  List<Place> get items{
    return [..._items];
  }
  
}