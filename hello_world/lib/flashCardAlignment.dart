import 'package:flutter/material.dart';
import 'flashCard.dart';
import 'Classes/Activity/Activity.dart';
import 'flashCards_section_alignment.dart';

class FlashCardAlignment extends StatefulWidget
{
  final int cardNum;
  final int numero;
  final int image;
  final Activity activity;
  FlashCardAlignment(this.cardNum, this.numero, this.image, this.activity);

  @override
  _FlashCardAlignmentState createState() => _FlashCardAlignmentState();
}

class _FlashCardAlignmentState extends State<FlashCardAlignment> {

  List<Activity> data = getListActivity();

  @override
  Widget build(BuildContext context)
  {
    return new FlashCard(data[widget.numero], data[widget.numero].name, data[widget.numero].start.day.toString() + " " + getMonth(data[widget.numero].start.month), data[widget.numero].price.toString() + " \u0024", getTime(data[widget.numero].start), data[widget.numero].location.locationName, widget.image);
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