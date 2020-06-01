import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:touristadvisor/Model/RestaurantModel.dart';
import 'package:touristadvisor/Networking/RestaurantNetworking.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class RestaurantDetails extends StatefulWidget {
  int locationId;

  RestaurantDetails(int locationId){
    this.locationId = locationId;
  }

  @override
  RestaurantDetailsState createState() => RestaurantDetailsState(locationId);
}

class RestaurantDetailsState extends State<RestaurantDetails> {
  RestaurantModel restaurant = null ;

  RestaurantDetailsState(int locationId) {
   getRestaurant(locationId);
  }

  Future<void> getRestaurant(int locationId) async{
//    Locale myLocale = Localizations.localeOf(context);

    restaurant = await fetchRestaurant(locationId,"en_US");
    setState((){

    });
  }

  List<Widget> _buildStars(double count) {
    var list = <Icon>[];
    for (var i = 0; i < count.floor(); i++){
      list.add(Icon(Icons.star));
    }
    if(count - count.floor().toDouble() != 0.0){
      list.add(Icon(Icons.star_half));
    }
    if(list.length < 5){
      for(var i = list.length; i < 5; i++ ){
        list.add(Icon(Icons.star_border));
      }
    }
    return list;
  }

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

//  Sections  -------------------------------------------------------

  Widget ratingSection (rating, reviews) => Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: <Widget>[
        ..._buildStars(rating),
        SizedBox(width: 10),
        Text(reviews),
        Text(' Reviews')
      ]));

  Widget imageSection(url) => Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Image.network(url)
  );

  Widget detailsSection(priceLevel, price, List<String> cuisine, menu) => Container(
//      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(children: <Widget>[
        Divider(height: 50, thickness: 2),
        Row(children: <Widget>[
          Text(
              'Details',
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, )
          )
        ]),
        SizedBox(height: 15),
        ListView(shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              ListTile(
                  title: Text('Price level:'),
                  subtitle: Text(priceLevel),
                  dense: true
              ),
              ListTile(
                  title: Text('Price range: '),
                  subtitle: Text(price),
                  dense: true
              ),
              ListTile(
                title: Text('Cuisine:'),
                subtitle: Text(cuisine.join(", ")),
                dense: true
              ),
              ListTile(
                  leading: Icon(Icons.restaurant_menu),
                  title: Text('Menu'),
                  subtitle: _createLink(menu, linkText: 'Click here'),
                  dense: true
              )
            ])
      ])
  );

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
        SizedBox(height: 15),
        Row(children: <Widget>[
          Icon(Icons.phone),
          SizedBox(width: 10),
          Flexible(child: _createCallerLink(phone))
        ]),
        SizedBox(height: 15),
        Row(children: <Widget>[
          Icon(Icons.laptop),
          SizedBox(width: 10),
          Flexible(child: _createLink(website, linkText: ''))
        ]),
        SizedBox(height: 15),
        Row(children: <Widget>[
          Icon(Icons.mail_outline),
          SizedBox(width: 10),
          Flexible(child: _createMailLink(email, linkText: ''))
        ])
      ]));

  bool favouritePressed = false;

  void pressFavorite() {
    if (favouritePressed)
      favouritePressed = false;
    else
      favouritePressed = true;
  }

  @override
  Widget build(BuildContext context) {
    if (restaurant == null) {
      return new Container(
        decoration: new BoxDecoration(color: Colors.lightBlueAccent),
        child: new Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(restaurant.name),
          titleSpacing: 0.0,
          backgroundColor: Colors.lightBlueAccent,
          actions: [
            // action button
            new IconButton(
                icon: new Icon(
                    favouritePressed ? Icons.favorite : Icons.favorite_border,
                    color: favouritePressed ? Colors.red : null,
                    size: 30),
                onPressed: () {
                  setState(() {
                    pressFavorite();
//                  _alreadySaved = isSaved(key); //<--update alreadSaved
                  });
                }),
          ],
          leading: IconButton(
            icon: Icon(Icons.restaurant, size: 24),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Column(children: <Widget>[
                        ratingSection(restaurant.rating,
                            restaurant.numReviews.toString()),
                        imageSection(restaurant.photoUrl),
                        detailsSection(restaurant.priceLevel, restaurant.price,
                            restaurant.cuisine, restaurant.menu),
                        contactSection(
                            restaurant.address, restaurant.phoneNumber,
                            restaurant.website, restaurant.email)
                      ])),
                ))),
      );
    }
  }
}