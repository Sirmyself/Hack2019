import 'package:flutter/material.dart';
import 'flashCard.dart';
import 'Classes/DebugDataLoader.dart';
import 'Classes/Activity/Activity.dart';
// import 'package:intl/intl.dart';

class FlashCardAlignment extends StatefulWidget
{
  final int cardNum;
  FlashCardAlignment(this.cardNum);

  @override
  _FlashCardAlignmentState createState() => _FlashCardAlignmentState();
}

class _FlashCardAlignmentState extends State<FlashCardAlignment> {
  int numero = 0;

  List<Activity> data = DebugDataLoader().loadCityActivities("Quebec");

  @override
  Widget build(BuildContext context)
  {
    var f = new flashCard(data[numero].name, data[numero].start.day.toString() + " " + getMonth(data[numero].start.month), data[numero].price.toString() + " \u0024", getTime(data[numero].start), data[numero].location.locationName);
    // var f = new flashCard(numero.toString(), numero.toString(), numero.toString(), numero.toString(), numero.toString());
    numero += 1;
    return f;
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
  }
}

String getTime(DateTime date) {
  return date.hour.toString() + " h " + date.minute.toString();
}