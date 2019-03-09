import 'package:flutter/material.dart';
import 'flashCard.dart';
import 'Classes/DebugDataLoader.dart';
import 'Classes/Activity/Activity.dart';
// import 'package:intl/intl.dart';

class FlashCardAlignment extends StatefulWidget
{
  final int cardNum;
  final int numero;
  final int image;
  FlashCardAlignment(this.cardNum, this.numero, this.image);

  @override
  _FlashCardAlignmentState createState() => _FlashCardAlignmentState();
}

class _FlashCardAlignmentState extends State<FlashCardAlignment> {

  List<Activity> data = DebugDataLoader().loadCityActivities("Quebec");

  @override
  Widget build(BuildContext context)
  {
    return new FlashCard(data[widget.numero].name, data[widget.numero].start.day.toString() + " " + getMonth(data[widget.numero].start.month), data[widget.numero].price.toString() + " \u0024", getTime(data[widget.numero].start), data[widget.numero].location.locationName, widget.image);
  }
}

String getMonth(int mois) {
  switch(mois) {
    case 1:
      return "Janvier";
      break;
    case 2:
      return "Février";
      break;
    case 3:
      return "Mars";
      break;
    case 4:
      return "Avril";
      break;
    case 5: 
      return "Mai";
      break;
    case 6:
      return "Juin";
      break;
    case 7:
      return "Juillet";
      break;
    case 8:
      return "Août";
      break;
    case 9:
      return "Septembre";
      break;
    case 10:
      return "Octobre";
      break;
    case 11:
      return "Novembre";
      break;
    case 12:
      return "Décembre";
      break;
    default:
      return "Mois";
  }
}

String getTime(DateTime date) {
  return date.hour.toString() + " h " + date.minute.toString();
}