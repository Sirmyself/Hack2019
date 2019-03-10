import 'Activity.dart';
import 'package:flutter/material.dart';
import '../DebugDataLoader.dart';

class User {

  String _nom;
  String _prenom;
  List<Activity> _listActivitySelected = List<Activity>();


  User() {
      this._nom = "Tom";
      this._prenom = "Thibeault";
      List<Activity> data = DebugDataLoader().loadCityActivities("Quebec");
      _listActivitySelected.add(data[0]);
      _listActivitySelected.add(data[1]);
  }

  String getNom() {
    return this._nom;
  }

  String getPrenom() {
    return this._prenom;
  }

  List<Activity> getListActivitySelected() {
  return this._listActivitySelected;
}



}