import 'package:flutter/material.dart';
import 'Classes/Activity/Activity.dart';
import 'Classes/Activity/ActivityUtilities.dart';
import 'activity.dart' as Activite;

class Resultats extends StatefulWidget {
    final String _criteres;
    final String _ville;
    final DateTime _dateDebut;
    final DateTime _dateFin;

    Resultats(this._criteres, this._ville, this._dateDebut, this._dateFin) :super();
    
    @override
    State<StatefulWidget> createState() {
    return _Resultats();
  }
}

//State is information of the application that can change over time or when some actions are taken.
class _Resultats extends State<Resultats>{
@override
  Widget build(BuildContext ctxt){
    return new Scaffold(
      appBar: AppBar( title: Text("Résultats de la recherche"),),
      body: Stack(
            children: [             
              Container(
                child: new ActivitiesPage(widget._criteres, widget._ville, widget._dateDebut, widget._dateFin)
              ),
            ],
          ),        
    );
  }
}

String afficherChampDateHeure(DateTime dateHeure){
  String heure = dateHeure.toString().substring(11, 19);
  if(heure == "00:00:00"){
    return dateHeure.toString().substring(0,10);
  }
  return dateHeure.toString();
}

class _ActivityListItem extends StatelessWidget {
  final Activity _activity;

  _ActivityListItem(this._activity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 5, left: 25, bottom: 5, right: 5),
      leading: CircleAvatar(
        child: Text(_activity.name[0]),
      ),
      title: Text(_activity.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Expanded(
              child: Text(_activity.location.locationName),
            )
          ],),
          Row(children: <Widget>[
            Text(afficherChampDateHeure(_activity.start)),
          ],)
        ],
      ),
    onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Activite.Activity(_activity)),
    ),);
  }
}

class ActivityList extends StatelessWidget {

  final List<Activity> _activities;

  ActivityList(this._activities);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      children: _buildActivityList()
    );
  }

  List<_ActivityListItem> _buildActivityList() {
    return _activities.map((activity) => _ActivityListItem(activity))
                  .toList();
  }
}

class ActivitiesPage extends StatelessWidget {
  final String _criteres;
  final String _ville;
  final DateTime _dateDebut;
  final DateTime _dateFin;

  ActivitiesPage(this._criteres, this._ville, this._dateDebut, this._dateFin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: afficherResultats(),
    );
    
  }

  Widget afficherResultats(){
    var activityList = ActivityList(ActivityUtility.search(_ville, _criteres, _dateDebut, _dateFin));
    if(activityList._activities.length == 0){
      return new Container(
                  margin: EdgeInsets.only(left: 25.0,top:25, bottom: 25.0),
                  child: Text("Aucun résultat", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                  );
    }
    return activityList;
    }
}