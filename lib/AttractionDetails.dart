import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'I18n.dart';
import 'Model/AttractionModel.dart';

// ignore: must_be_immutable
class AttractionDetails extends StatelessWidget {
  Widget titleSection(attractionName) => Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
        children: <Widget>[
          Expanded(child: Text(attractionName,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20
              ))),
          Icon(Icons.favorite_border, size: 40)
        ])
  );

  Widget ratingSection = Container(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child:  Row(
        children: <Widget>[
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star),
          Icon(Icons.star_half),
          SizedBox(width: 10),
          Text('15 262'),
          Text(' Reviews')
        ])
  );

  Widget imageSection = Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Image.network('https://media-cdn.tripadvisor.com/media/photo-s/08/c2/f8/f2/bucket-list-de-budapeste.jpg')
  );

  Widget descriptionSection(descriptionText) => Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      descriptionText,
      softWrap: true,
    ),
  );

  Widget contactSection = Container(
    padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              SizedBox(width: 10),
              Text('Szentharomsag ter 2, Budapest 1014 Hungary')
          ]),
          SizedBox(height: 15),
          Row(
              children: <Widget>[
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text('+36 1 355 5657')
              ]),
          SizedBox(height: 15),
          Row(
              children: <Widget>[
                Icon(Icons.laptop),
                SizedBox(width: 10),
                Text('http://matyas-templom.hu')
              ]),
          SizedBox(height: 15),
          Row(
              children: <Widget>[
                Icon(Icons.mail_outline),
                SizedBox(width: 10),
                Text('plebania@matyas-templom.hu')
              ])
      ]
    )
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: <Widget>[
                titleSection(AdvisorLocalizations.of(context).attractionName),
                ratingSection,
                imageSection,
                descriptionSection(AdvisorLocalizations.of(context).attractionDescription),
                contactSection
              ])),
        )),
    );
  }

}