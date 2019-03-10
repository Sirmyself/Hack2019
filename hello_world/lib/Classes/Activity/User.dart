import 'Activity.dart';
import 'package:flutter/material.dart';
import '../DebugDataLoader.dart';

class User {

  String _nom;
  String _prenom;
  String _logo;
  List<Activity> _listActivitySelected;


  User(this._prenom, this._nom) {
    _listActivitySelected = List<Activity>();
    _logo = "assets/images/man1.png";
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

  void addActivity(Activity a) {
    for(int i = 0; i < _listActivitySelected.length; i++) {
      if(_listActivitySelected[i] == a) {
        return;
      }
    }
    this._listActivitySelected.add(a);
  }

  String getLogoPath() {
    return this._logo;
  }



}