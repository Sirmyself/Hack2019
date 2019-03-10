import 'package:flutter/material.dart';
//import 'Classes/Activity/Activity.dart';
import 'resultats.dart';

class Recherche extends StatefulWidget {
  //final List<Activity> listActivite = new List<Activity>();
  @override
  State<StatefulWidget> createState() {
    return _Recherche();
  }
}

//State is information of the application that can change over time or when some actions are taken.
class _Recherche extends State<Recherche>{

  String _valueDebut = new DateTime.now().toString().substring(0,10);
  String _valueFin = new DateTime.now().toString().substring(0,10);

  List _villes = ['Matane','Montréal','Québec','Rimouski', 'Rivière-du-Loup'];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

  final myController = TextEditingController();

  Future _selectDateDebut() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _valueDebut = picked.toString().substring(0,10));
  }

  Future _selectDateFin() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2030)
    );
    if(picked != null) setState(() => _valueFin = picked.toString().substring(0,10));
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
          child: new Text(ville, style: TextStyle(fontSize: 18))
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
      body: SingleChildScrollView(
        child: 
        Column(
        children: <Widget>[ 
          Row(
            children: [     
              Container(
                margin : EdgeInsets.only(left:25.0, top:25.0, right:25.0, bottom: 0.0),
                child : new Text("Recherche :", style :TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            children: [
              new Flexible(  
                child: Container(
                  margin: EdgeInsets.only(left:25.0, top: 5.0, right:25.0, bottom: 0.0),
                  child: TextField(
                    controller: myController,
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
                margin: EdgeInsets.only(left:25.0, top:25.0, bottom: 0.0),
                child : Text("Ville :", style :TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ]),
          Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:25.0, top:10.0, right:25.0, bottom: 0.0),
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
                margin: EdgeInsets.only(left:25.0, top:25.0, bottom: 0),
                child : Text("Date :", style :TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
            ]),
          Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25.0, bottom: 5.0),
                child: Text("Date début :", style: TextStyle(fontSize: 17),),
              ),
            Container(
                margin: EdgeInsets.only(left: 5.0, bottom: 5.0),
                child: Text(_valueDebut, style: TextStyle(fontSize: 17),),
              ),
              Container(
                margin: EdgeInsets.only(left:10.0, bottom: 5.0),
                child: RaisedButton(onPressed: _selectDateDebut, child: new Text('Sélectionner'),color: Colors.white, textColor: Colors.blue, shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
              ),)
            ],
          ),
          Row(children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 25.0,top:0, bottom: 25.0, right: 12),
                child: Text("Date fin :", style: TextStyle(fontSize: 17),),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0,top:0, bottom: 25.0),
                child: Text(_valueFin, style: TextStyle(fontSize: 17),),
              ),
              Container(
                margin: EdgeInsets.only(left:10.0, top:0, bottom: 25.0),
                child: RaisedButton(onPressed: _selectDateFin, child: new Text('Sélectionner'),color: Colors.white, textColor: Colors.blue,shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
              ),)
            ],  
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Resultats(myController.text, _currentCity, DateTime.parse(_valueDebut), DateTime.parse(_valueFin))),
                );
              }, child: new Text('Rechercher',style: TextStyle(fontSize: 25.0),),color: Colors.blue, textColor: Colors.white, padding: EdgeInsets.all(20),shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20)),
              ),   
            ],
          ),
        ],
      ),
      )
    );
  }
}