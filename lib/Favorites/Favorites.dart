import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FavoritesDB.dart';

class Favourites extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myListView(context)
    );
  }

  Widget _myListView(BuildContext context) {
    final db = Provider.of<FavoritesDB>(context);
    return StreamBuilder(
      stream: db.favoriteAttractionsDao.watchAll,
      builder: (BuildContext context, AsyncSnapshot<List<FavoriteAttraction>> snapshot){
        if(!snapshot.hasData){
          return Text("error");
        }else{
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].name.toString()),
              );
            },
          );
        }
      },
    );
  }
}