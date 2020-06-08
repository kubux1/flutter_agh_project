import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:touristadvisor/Locale/I18n.dart';
import 'package:touristadvisor/Model/AttractionModel.dart';
import 'package:touristadvisor/Networking/AttractionNetworking.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class AttractionDetails extends StatefulWidget {
  int locationId;

  AttractionDetails(int locationId) {
    this.locationId = locationId;

  }

  @override
  AttractionDetailsState createState() => AttractionDetailsState(locationId);
}

class AttractionDetailsState extends State<AttractionDetails> {
  AttractionModel attraction = null;

  AttractionDetailsState(int locationId) {
    super.initState();
    //Locale myLocale = Localizations.localeOf(context);
    //print(myLocale.languageCode);

    getAttraction(locationId);
  }

  Future<void> getAttraction(int locationId) async{

//    Locale myLocale = Localizations.localeOf(context);
//    print(myLocale.languageCode);
    attraction = await fetchAttractions(locationId, "en_US");
    setState((){
//      attraction = value as Future<AttractionModel>;
    });
  }


//  Widget titleSection(attractionName) => Container(
//      padding: const EdgeInsets.symmetric(vertical: 5),
//      child: Row(children: <Widget>[
//        Expanded(
//            child: Text(attractionName,
//                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
//        Icon(Icons.favorite_border, size: 40)
//      ]));

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
      child: Image.network(url));

  Widget descriptionSection(descriptionText) => Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          descriptionText,
          softWrap: true,
          textAlign: TextAlign.justify,
        ),
      );

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
    if (attraction == null) {
//      backgroundColor: Colors.lightBlueAccent;
      return new Container(
        decoration: new BoxDecoration(color: Colors.lightBlueAccent),
        child: new Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return new Scaffold(
        appBar: AppBar(
          title: Text(attraction.name ?? "Attraction"),
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
            icon: Icon(Icons.account_balance, size: 24),
            onPressed: () {},
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Center(
                      child: Column(children: <Widget>[
                        ratingSection(attraction.rating,
                            attraction.numReviews.toString()),
                        imageSection(attraction.photoUrl ?? ""),
                        descriptionSection(attraction.description ?? ""),
                        contactSection(
                            attraction.address, attraction.phoneNumber,
                            attraction.website, attraction.email)
                      ])),
                ))),
      );
    }
  }
}
