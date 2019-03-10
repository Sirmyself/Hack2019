import 'package:flutter/material.dart';
import 'Classes/Activity/Activity.dart';

class FlashCard extends StatefulWidget {
  final String titre;
  final String heure;
  final String prix;
  final String date;
  final String location;
  final int image;
  Activity activity;

  @override
  _FlashCardState createState() => _FlashCardState();

  FlashCard(this.activity, this.titre, this.heure, this.prix, this.date, this.location, this.image);
}

class _FlashCardState extends State<FlashCard> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
  decoration: new BoxDecoration(
    color: Colors.transparent,
    borderRadius: new BorderRadius.all(
      const Radius.circular(25)
    ),
  ),
  
  child: Container(
    decoration: new BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.blueAccent[100],
        blurRadius: 20,
        spreadRadius: 5,
        offset: Offset(10, 10),
      )
    ],
    borderRadius: new BorderRadius.all(
      const Radius.circular(25)
    ),
    color: Colors.white,
  ),
    child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            new ClipRRect(
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
              ),
              child: Image.asset('assets/images/'+ getReleventPicture(widget.activity)  +'.jpg', fit: BoxFit.fitWidth, width: 500,)),
            Container(
              decoration: new BoxDecoration(
                color: Colors.transparent,
                borderRadius: new BorderRadius.all(
                const Radius.circular(25)
              ),
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                widget.titre,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )
              )
              ),
            location(widget.location),
            infoImportanteSection(widget.date, widget.prix, widget.heure)
          ],
        )
        )
    ],
    )
)
    )
    );
    return scaffold;
  }
}

String getReleventPicture(Activity activity){
  return "team";
  
}

Widget infoImportanteSection(String date, String prix, String heure)
{
  return new Container(
    padding: EdgeInsets.only(
      top: 5
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        construireInfo(Colors.blueAccent, Icons.date_range, date),
        construireInfo(Colors.blueAccent, Icons.access_time, heure),
        construireInfo(Colors.blueAccent, Icons.attach_money, prix)
      ],
    ),
  );
}

Widget location(String nom) {
  return new Container(
    padding: EdgeInsets.only(left: 10, bottom: 10),
    child: Row(
      children: [
        Icon(Icons.location_on, color: Colors.blueAccent, size: 35.0,),
        Expanded(
          child: Text(nom, style: TextStyle(color: Colors.blueAccent, fontSize: 20), softWrap: true,),
        )
      ],
    ),
    );
}

Column construireInfo(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 35.0,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }