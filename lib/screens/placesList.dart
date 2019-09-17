import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/providers/places.dart';
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
      child: FutureBuilder(
              future: Provider.of<PlacesProvider>(context, listen: false).fetchAndSetPlaces(),
              builder: (ctx, snapshot) =>  snapshot.connectionState == ConnectionState.waiting
                          ?  Center(child: CircularProgressIndicator(),)  
                          : Consumer<PlacesProvider>(
          child: Center(
            child: const Text('Got no places yet, start adding som!'),
          ),
          builder: (ctx, placesProvider, ch) =>  placesProvider.items.length <= 0 
                    ? ch
                    : ListView.builder(
                        itemCount: placesProvider.items.length,
                        itemBuilder: (ctx, i) => Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                              leading: CircleAvatar(backgroundImage: FileImage(placesProvider.items[i].image),),
                              title: Text(placesProvider.items[i].title),
                              onTap: (){
                                //Go to details...
                              },
                          ),
                        ),
                    ),
        ),
      )
    );
  }
}
