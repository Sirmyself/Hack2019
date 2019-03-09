import 'package:flutter/material.dart';
import 'Classes/Activity/Activity.dart';
import 'Classes/DebugDataLoader.dart';
import 'activity.dart' as Activite;
import 'arc_banner.dart';
import 'Classes/Activity/ActivityUtilities.dart';

class Resultats extends StatefulWidget {
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
                child: new ActivitiesPage()
              ),
            ],
          ),
        
    );
        
  }
}

class _ActivityListItem extends StatelessWidget {
  final Activity _activity;

  _ActivityListItem(this._activity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top: 5, left: 25, bottom: 5),
      leading: CircleAvatar(
        child: Text(_activity.name[0]),
      ),
      title: Text(_activity.name, style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Text(_activity.location.locationName),
          ],),
          Row(children: <Widget>[
            Text(_activity.start.toString().substring(0,19)),
          ],)
        ],
      ),
    onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Activite.Activity()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ActivityList(DebugDataLoader().loadCityActivities("Quebec")),
    );
  }
}