import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:touristadvisor/Favorites/FavoriteWidget.dart';
import 'package:touristadvisor/Favorites/FavoritesDB.dart';
import 'package:touristadvisor/Favorites/Hotels/AddFavoriteHotelCommand.dart';
import 'package:touristadvisor/Networking/HotelNetworking.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/HotelModel.dart';

// ignore: must_be_immutable
class HotelDetails extends StatefulWidget {
  int locationId;

  HotelDetails(int locationId) {
    this.locationId = locationId;
  }

  @override
  HotelDetailsState createState() => HotelDetailsState(locationId);
}

class HotelDetailsState extends State<HotelDetails> {
  HotelModel hotel = null;

  HotelDetailsState(int locationId) {
    getHotel(locationId);
  }

  Future<void> getHotel(int locationId) async{
//    print(context);
//    Locale myLocale = Localizations.localeOf(context);
//    print(myLocale.languageCode);
    final db = FavoritesDB();
    final data = await db.favoriteHotelsDao.getByLocationId(locationId);
    if(data != null){
      hotel = new HotelModel(
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
    }else{
      hotel = await fetchHotel(locationId, "en_US");
    }
    setState((){
    });
  }

//  Widget titleSection(hotelName) => Container(
//      padding: const EdgeInsets.symmetric(vertical: 5),
//      child: Row(children: <Widget>[
//        Expanded(
//            child: Text(hotelName,
//                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
//        Icon(Icons.favorite_border, size: 40)
//      ]));

  List<Widget> _buildStars(double count) {
    var list = <Icon>[];
    for (var i = 0; i < count.floor(); i++) {
      list.add(Icon(Icons.star));
    }
    if (count - count.floorToDouble() != 0.0) {
      list.add(Icon(Icons.star_half));
    }
    if(list.length < 5){
      for(var i = list.length; i < 5; i++ ){
        list.add(Icon(Icons.star_border));
      }
    }
    return list;
  }

  Widget ratingSection(rating, reviews) => Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: <Widget>[
        ..._buildStars(rating),
        SizedBox(width: 10),
        Text(reviews),
        Text(' Reviews')
      ]));

  RichText _createLink(String linkUrl, {String linkText = ''}) {
    if (linkText == '') {
      linkText = linkUrl;
    }
    return new RichText(
      overflow: TextOverflow.ellipsis,
      text: new TextSpan(
        text: linkText,
        style: new TextStyle(color: Colors.blue),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            launch(linkUrl);
          },
      ),
    );
  }

  void _launchMail(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  RichText _createMailLink(String linkUrl, {String linkText = ''}) {
    if (linkText == '') {
      linkText = linkUrl;
    }
    return new RichText(
      overflow: TextOverflow.ellipsis,
      text: new TextSpan(
        text: linkText,
        style: new TextStyle(color: Colors.blue),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            _launchMail(linkUrl, 'Subject', 'Hello! ...');
          },
      ),
    );
  }

  void _launchCaller(String phone) async {
    String url = "tel:$phone";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  RichText _createCallerLink(String linkUrl, {String linkText = ''}) {
    if (linkText == '') {
      linkText = linkUrl;
    }
    return new RichText(
      overflow: TextOverflow.ellipsis,
      text: new TextSpan(
        text: linkText,
        style: new TextStyle(color: Colors.blue),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            _launchCaller(linkUrl);
          },
      ),
    );
  }

  void _launchMapsUrlFromCoord(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMapsUrlFromAddr(String address) async {
    final url = 'https://www.google.com/maps/search/${Uri.encodeFull(address)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  RichText _createMapsLink(String linkText,
      {double lat = null, double lon = null}) {
    return new RichText(
      overflow: TextOverflow.ellipsis,
      text: new TextSpan(
        text: linkText,
        style: new TextStyle(color: Colors.blue),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            if (lat != null && lon != null) {
              _launchMapsUrlFromCoord(lat, lon);
            } else {
              _launchMapsUrlFromAddr(linkText);
            }
          },
      ),
    );
  }

  Widget contactSection(address, phone, website, email) => Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(children: <Widget>[
        Divider(height: 50, thickness: 2),
        Row(children: <Widget>[
          Text(
              'Location & Contact',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, )
          )
        ]),
        SizedBox(height: 15),
        Row(children: <Widget>[
          Icon(Icons.location_on),
          SizedBox(width: 10),
          Flexible(child: _createMapsLink(address))
        ]),
        SizedBox(height: 8),
        Row(children: <Widget>[
          Icon(Icons.phone),
          SizedBox(width: 10),
          Flexible(child: _createCallerLink(phone))
        ]),
        SizedBox(height: 8),
        Row(children: <Widget>[
          Icon(Icons.laptop),
          SizedBox(width: 10),
          Flexible(child: _createLink(website, linkText: ''))
        ]),
        SizedBox(height: 8),
        Row(children: <Widget>[
          Icon(Icons.mail_outline),
          SizedBox(width: 10),
          Flexible(child: _createMailLink(email, linkText: ''))
        ])
      ]));

  Widget imageSection(url) => Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Image.network(url));

  Widget descriptionSection(descriptionText) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          descriptionText,
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
      );

  bool favouritePressed = false;

  void pressFavorite() {
    if (favouritePressed)
      favouritePressed = false;
    else
      favouritePressed = true;
  }

  @override
  Widget build(BuildContext context) {
    if (hotel == null) {
//      backgroundColor: Colors.lightBlueAccent;
      return new Container(
        decoration: new BoxDecoration(color: Colors.lightBlueAccent),
        child: new Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      final db = Provider.of<FavoritesDB>(context);
      return Scaffold(
        appBar: AppBar(
          title: Text(hotel.name),
          titleSpacing: 0.0,
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            FutureBuilder<bool>(
              future: db.favoriteHotelsDao.exists(hotel.location_id),
              builder:  (BuildContext context, AsyncSnapshot<bool> snapshot){
                if (snapshot.hasData) {
                  return FavoriteWidget(
                      checked: snapshot.data,
                      onAdd: () => AddFavoriteHotelCommand(db, hotel).execute(),
                      onRemove: () => {
                        db.favoriteHotelsDao
                            .deleteByLocationId(hotel.location_id)
                      });
                } else {
                  return Container();
                }
              },
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.hotel, size: 24),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Column(children: <Widget>[
                        ratingSection(
                            hotel.rating, hotel.numReviews.toString()),
                        imageSection(hotel.photoUrl),
                        descriptionSection(hotel.description),
                        contactSection(
                            hotel.address, hotel.phone, hotel.website,
                            hotel.email)
                      ])),
                ))),
      );
    }
  }
}
