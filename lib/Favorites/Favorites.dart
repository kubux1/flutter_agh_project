import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:touristadvisor/DetailView/HotelDetails.dart';
import 'package:touristadvisor/Model/HotelModel.dart';

import 'FavoritesDB.dart';

class Favorites extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _myListView(context)
    );
  }

  Widget _myListView(BuildContext context) {
    final db = Provider.of<FavoritesDB>(context);
    return StreamBuilder(
      stream: db.favoriteHotelsDao.watchAll,
      builder: (BuildContext context, AsyncSnapshot<List<FavoriteHotel>> snapshot){
        if(!snapshot.hasData){
          return Text("error");
        }else{
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].name.toString()),
                onTap: () => onLocationTap(snapshot.data[index], context),
              );
            },
          );
        }
      },
    );
  }

  onLocationTap(FavoriteHotel data, BuildContext context) {
    final HotelModel hotelModel = new HotelModel(
      location_id: data.location_id,
      name: data.name,
      latitude: data.latitude,
      longitude: data.longitude,
      rating: data.rating,
      price: data.price,
      priceLevel: data.priceLevel,
      hotelClass: data.hotelClass,
      numReviews: data.numReviews,
      phone: data.phone,
      website: data.website,
      photoUrl: data.photoUrl,
      description: data.description,
      address: data.address,
      email: data.email,
      distance: data.distance,
    );

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HotelDetails(hotelModel)));
  }
}