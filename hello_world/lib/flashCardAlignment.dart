import 'package:flutter/material.dart';
import 'flashCard.dart';
import 'Classes/DebugDataLoader.dart';
import 'Classes/Activity/Activity.dart';

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
    // var f = new flashCard(data[numero].name, data[numero].start.toString(), data[numero].price.toString() + " \u0024", "", data[numero].location.locationName);
    var f = new flashCard(numero.toString(), numero.toString(), numero.toString(), numero.toString(), numero.toString());
    numero += 1;
    return f;
  }
}