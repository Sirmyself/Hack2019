import 'package:flutter/material.dart';
class Recherche extends StatelessWidget{
  @override
  Widget build (BuildContext ctxt){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Recherche"),
      ),
      body: Column(
        children: <Widget>[ 
          Row(
            children: [     
              Container(
                margin : EdgeInsets.only(left:25.0, top:25.0, right:25.0, bottom: 5.0),
                child : new Text("Recherche :", style :TextStyle(fontSize: 25)),
              ),
            ],
          ),
          Row(
            children: [
              new Flexible(  
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Inscrire un mot clé",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [     
              Container(
                margin: EdgeInsets.only(left:25.0, top:25.0, bottom: 5.0),
                child : Text("Ville :", style :TextStyle(fontSize: 25)),
              ),
              Container(
                margin: EdgeInsets.only(left:15.0, top:25.0, right:25.0, bottom: 5.0),
                width: 230.0,
                child: DropdownButton<String>(
                  hint: Text("Veuillez choisir une ville"),
                  items: <String>['Matane','Montréal','Québec','Rimouski', 'Rivière-du-Loup'].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
          Row(
            children: [
            ],
          ),
        ],
      ),
    );
  }
}