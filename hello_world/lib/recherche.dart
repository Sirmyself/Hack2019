import 'package:flutter/material.dart';
import 'Classes/Activity/Activity.dart';
import 'Classes/DebugDataLoader.dart';

class Recherche extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Recherche();
  }
}

//State is information of the application that can change over time or when some actions are taken.
class _Recherche extends State<Recherche>{

  String _value = new DateTime.now().toString().substring(0,10);

  List _villes = ['Matane','Montréal','Québec','Rimouski', 'Rivière-du-Loup'];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _value = picked.toString().substring(0,10));
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }
  // here we are creating the list needed for the DropDownButton
  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String ville in _villes) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
          value: ville,
          child: new Text(ville)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    print("Selected city $selectedCity, we are going to refresh the UI");
    setState(() {
      _currentCity = selectedCity;
    });
  }
  
  @override
  Widget build(BuildContext ctxt){
    return new Scaffold(
      body: Container(
        child: 
        Column(
        children: <Widget>[ 
          Row(
            children: [     
              Container(
                margin : EdgeInsets.only(left:25.0, top:20.0, right:25.0, bottom: 0.0),
                child : new Text("Recherche :", style :TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              new Flexible(  
                child: Container(
                  margin: EdgeInsets.only(left:25.0, top: 0.0, right:25.0, bottom: 0.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Inscrire un mot clé",
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [     
              Container(
                margin: EdgeInsets.only(left:25.0, top:10.0, bottom: 0.0),
                child : Text("Ville :", style :TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(left:15.0, top:10.0, right:25.0, bottom: 0.0),
                width: 230.0,
                child: DropdownButton<String>(
                  hint: Text("Veuillez choisir une ville", style: TextStyle(fontSize: 17),),
                  value: _currentCity,
                  items: _dropDownMenuItems,
                  onChanged: changedDropDownItem,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:25.0, top:5.0, bottom: 5.0),
                child : Text("Date :", style :TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0,top:5.0, bottom: 5.0),
                child: Text(_value, style: TextStyle(fontSize: 16),),
              ),
              Container(
                margin: EdgeInsets.only(left:10.0, top:5.0, bottom: 5.0),
                child: RaisedButton(onPressed: _selectDate, child: new Text('Choisir une date'),color: Colors.white, textColor: Colors.blue)
              ),
            ],
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: _selectDate, child: new Text('Rechercher',style: TextStyle(fontSize: 25.0),),color: Colors.blue, textColor: Colors.white)  
            ],
          ),
          Expanded(
            child: new ActivitiesPage()
          )
        ],
      ),
      )
    );
  }
}

class _ActivityListItem extends StatelessWidget {
  final Activity _activity;

  _ActivityListItem(this._activity);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(_activity.name[0]),
      ),
      title: Text(_activity.name),
      subtitle: Text(_activity.location.locationName),
    );
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