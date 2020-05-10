import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expand_widget/expand_widget.dart';
import 'I18n.dart';
import 'Model/HotelModel.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text);

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => new _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: new ConstrainedBox(
              constraints: widget.isExpanded
                  ? new BoxConstraints()
                  : new BoxConstraints(maxHeight: 50.0),
              child: new Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      widget.isExpanded
          ? new ConstrainedBox(constraints: new BoxConstraints())
          : new FlatButton(
          child: const Text('...'),
          onPressed: () => setState(() => widget.isExpanded = true))
    ]);
  }
}

// ignore: must_be_immutable
class HotelDetails extends StatefulWidget {
  @override
  HotelDetailsState createState() => HotelDetailsState();
}

class HotelDetailsState extends State<HotelDetails> {
  // example hotel model object for testing purposes only
  final HotelModel hotel = new HotelModel.example();

  List<Widget> _buildStars(double count) {
    var list = <Icon>[];
    var color = Colors.black87;
    for (var star=1; star<=5; star++){
      if(count >= star) {
        list.add(Icon(Icons.star, color: color,));
        continue;
      }
      else if(star - count == 0.5){
        list.add(Icon(Icons.star_half, color: color));
      }
      else {
        list.add(Icon(Icons.star_border, color: color));
      }
    }
    return list;
  }

  Widget ratingSection(rating, reviews, priceLevel) => Container(
      padding: const EdgeInsets.only(bottom: 8),
      child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                child: Row(
                    children:
                    <Widget>[
                      ..._buildStars(rating),
                      SizedBox(width: 10),
                      Text('$reviews Reviews'),
                    ])
            ),

            Text(priceLevel, style: TextStyle(fontWeight: FontWeight.bold),)
          ])
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

  RichText _createMapsLink(String linkText, {double lat = null, double lon = null}) {
    return new RichText(
      overflow: TextOverflow.ellipsis,
      text: new TextSpan(
        text: linkText,
        style: new TextStyle(color: Colors.blueAccent),
        recognizer: new TapGestureRecognizer()
          ..onTap = () {
            if(lat != null && lon != null){
              _launchMapsUrlFromCoord(lat, lon);
            }
            else{
              _launchMapsUrlFromAddr(linkText);
            }
          },
      ),
    );
  }

  Widget contactSection(address, phone, website, email) => Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
          children: <Widget>[
            Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  SizedBox(width: 10),
                  Flexible(
                      child:
                      _createMapsLink(address)
                  )
                ]),
            SizedBox(height: 8),
            Row(
                children: <Widget>[
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Flexible(
                      child:
                      _createCallerLink(phone)
                  )
                ]),
            SizedBox(height: 8),
            Row(
                children: <Widget>[
                  Icon(Icons.laptop),
                  SizedBox(width: 10),
                  Flexible(
                      child:
                      _createLink(website, linkText:'')
                  )
                ]),
            SizedBox(height: 8),
            Row(
                children: <Widget>[
                  Icon(Icons.mail_outline),
                  SizedBox(width: 10),
                  Flexible(
                      child:
                      _createMailLink(email, linkText: '')
                  )
                ])
          ]
      )
  );


  Widget imageSection(url) => Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Image.network(url)
  );




  Widget descriptionSection(descriptionText) =>
      new ExpandText(
        descriptionText,
        textAlign: TextAlign.justify,
        maxLength: 3,
//        arrowColor: Colors.lightBlueAccent,
      );

  Widget priceAndStarSection(price, hotelClass) =>
      Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                        children:
                        <Widget>[
                          new Icon(Icons.monetization_on, color: Colors.green,),
                          SizedBox(width: 5),
                          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
                        ])
                ),

                Container(
                    child: Row(
                        children:
                        <Widget>[
                          new Icon(Icons.star, color: Colors.amber,),
                          SizedBox(width: 5),
                          Text("$hotelClass", style: TextStyle(fontWeight: FontWeight.bold)),
                        ])
                ),
              ])
      );
//      ExpandableNotifier(  // <-- Provides ExpandableController to its children
//        child: Column(
//          children: [
//            Expandable(           // <-- Driven by ExpandableController from ExpandableNotifier
//              collapsed: ExpandableButton(  // <-- Expands when tapped on the cover photo
//                child: Text(descriptionText, softWrap: true, textAlign: TextAlign.justify, maxLines: 2, overflow: TextOverflow.ellipsis,),
//
//              ),
//              expanded: Column(
//                  children: [
//                    Text(descriptionText, softWrap: true, textAlign: TextAlign.justify ),
//                    ExpandableButton(       // <-- Collapses when tapped on
//                      child: FlatButton(
//                        child: Text( 'back',
//                          style: Theme.of(context)
//                              .textTheme
//                              .button
//                              .copyWith(color: Colors.deepPurple, backgroundColor: Colors.amber),
//                        )
//                      )
//                      )
//                  ]
//              ),
//            ),
//          ],
//        ),
//      );

//      ExpandablePanel(
//        header: Container(
//          padding: const EdgeInsets.symmetric(vertical: 12),
//          child:  Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
//                Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
//              ])
//      ),
//        collapsed:  Text(descriptionText, softWrap: true, textAlign: TextAlign.justify, maxLines: 2, overflow: TextOverflow.ellipsis),
//        expanded:   Text(descriptionText, softWrap: true, textAlign: TextAlign.justify ),
//      );

  bool favouritePressed = false;
  void pressFavorite() {favouritePressed = favouritePressed ? false : true;}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(hotel.name),
        titleSpacing: 0.0,
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          // action button
          new IconButton(
              icon: new Icon(
                favouritePressed ? Icons.favorite : Icons.favorite_border,
                color:  favouritePressed ? Colors.red : null,
                size: 30
              ),
              onPressed: () {
                setState(() {
                  pressFavorite();
//                  _alreadySaved = isSaved(key); //<--update alreadSaved
                });
              }
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.hotel, size: 24),
          onPressed: () { },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
                child: Column(
                    children: <Widget>[
                      ratingSection(hotel.rating, hotel.numReviews.toString(), hotel.priceLevel),
                      imageSection(hotel.photoUrl),
                      priceAndStarSection(hotel.price, hotel.hotelClass),
                      descriptionSection(hotel.description),
                      contactSection(hotel.address, hotel.phone, hotel.website, hotel.email)
                    ])),
          ))),
    );
  }

}