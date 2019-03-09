import 'package:flutter/material.dart';
import 'flashCard.dart';
import 'Classes/DebugDataLoader.dart';
import 'Classes/Activity/Activity.dart';

class FlashCardAlignment extends StatefulWidget
{
  final int cardNum;
  List<Activity> data = DebugDataLoader().loadCityActivities("Quebec");
  FlashCardAlignment(this.cardNum);

  @override
  _FlashCardAlignmentState createState() => _FlashCardAlignmentState();
}

class _FlashCardAlignmentState extends State<FlashCardAlignment> {
  int numero = 0;


  @override
  Widget build(BuildContext context)
  {
    var f = new flashCard(widget.data[numero].name, widget.data[numero].start.toString(), widget.data[numero].price.toString() + " \u0024", "", widget.data[numero].location.locationName);
    // var f = new flashCard(numero.toString(), numero.toString(), numero.toString(), numero.toString(), numero.toString());
    numero += 1;
    return f;
  }
}