import 'package:hello_world/Classes/Activity/Activity.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import '../Classes/Location/Location.dart';
import '../Interfaces/IDataLoader.dart';
import 'package:flutter/services.dart' show rootBundle;

class JSONDataLoader implements IDataLoader {
  String readFile(String fileLocation) {
    String contents = "unfortunately, an error occured";
    File file = new File(fileLocation);
    if (file.existsSync()) {
      contents = file.readAsStringSync();
    }

    return contents;
  }

  Map getCoordinates(String location, String address) {
    String coordJSON = readFile("../../../Data/" + location.toLowerCase()  + "/vdq-adresse.geojson");
    Map coordMap = jsonDecode(coordJSON)["features"];
    Map retVal;
    
    for (int i = 0; i < coordMap.length; ++i) {
      if (coordMap[i]["properties"]["RECHERCHE"] == location) {
        retVal = coordMap[i]["geometry"]["coordinates"];
        break;
      }
    }

    return retVal;
  }

  Location generateLocation(String address, String locationName, String borough, String location) {
    String civic = address.substring(0, address.indexOf(","));
    address = address.substring(address.indexOf(",") + 1);

    String street = address.trim().substring(0, address.indexOf(","));
    address = address.substring(address.indexOf(",") + 1);

    String postalCode = address.trim().substring(address.indexOf(")") + 2);
    String stateCode = address.trim().substring(address.indexOf("(") + 1, address.indexOf(")"));

    address = address.trim().substring(0, address.indexOf(" ("));
    String city = address.trim().substring(address.lastIndexOf(" "));

    Map coord = getCoordinates(location, civic + "  " + street);
    double latitude = 0;
    double longitude = 0;

    if (coord == null) {
      throw new Exception ("explosion!!!!!!!!!!!!!!!!");
    }

    latitude = coord[0];
    longitude = coord[1];

    Location newLocation = new Location(locationName, civic, street, borough, city, stateCode, postalCode, latitude, longitude);
    return newLocation;
  }

  @override
  List<Activity> loadCityActivities(String location) {
    String activityJSON = 
    '{"LOISIRS_PAYANTS": {"LOISIR_PAYANT": [      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Surveillance animée - Lac-Saint-Charles/5 séances",        "DESCRIPTION_ACT": "Surveillance animée - Secteur de Lac-Saint-Charles",        "DESCRIPTION_NAT": "Programme vacance été",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "35.00",        "LIEU_1": "Centre communautaire Paul-Émile-Beaulieu",        "LIEU_2": "Centre communautaire Paul-Émile-Beaulieu",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "530, rue Delage, Québec (QC) G3G 1J2 ",        "DATE_DEB": "2019-07-01",        "DATE_FIN": "2019-08-15",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "16:00:00",        "HEURE_FIN": "18:00:00"      },      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Surveillance animée - Lac-Saint-Charles/10 séances",        "DESCRIPTION_ACT": "Surveillance animée - Secteur de Lac-Saint-Charles",        "DESCRIPTION_NAT": "Programme vacance été",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "35.00",        "LIEU_1": "Centre communautaire Paul-Émile-Beaulieu",        "LIEU_2": "Centre communautaire Paul-Émile-Beaulieu",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "530, rue Delage, Québec (QC) G3G 1J2 ",        "DATE_DEB": "2019-07-01",        "DATE_FIN": "2019-08-15",        "JOUR_SEMAINE": "Vendredi",        "HEURE_DEBUT": "16:00:00",        "HEURE_FIN": "18:00:00"      },      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Surveillance animée - Lac-Saint-Charles/25 séances",        "DESCRIPTION_ACT": "Surveillance animée - Secteur de Lac-Saint-Charles",        "DESCRIPTION_NAT": "Programme vacance été",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "35.00",        "LIEU_1": "Centre communautaire Paul-Émile-Beaulieu",        "LIEU_2": "Centre communautaire Paul-Émile-Beaulieu",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "530, rue Delage, Québec (QC) G3G 1J2 ",        "DATE_DEB": "2019-07-01",        "DATE_FIN": "2019-08-15",        "JOUR_SEMAINE": "Vendredi",        "HEURE_DEBUT": "16:00:00",        "HEURE_FIN": "18:00:00"      },      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Surveillance animée - Lac-Saint-Charles/35 séances",        "DESCRIPTION_ACT": "Surveillance animée - Secteur de Lac-Saint-Charles",        "DESCRIPTION_NAT": "Programme vacance été",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "35.00",        "LIEU_1": "Centre communautaire Paul-Émile-Beaulieu",        "LIEU_2": "Centre communautaire Paul-Émile-Beaulieu",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "530, rue Delage, Québec (QC) G3G 1J2 ",        "DATE_DEB": "2019-07-01",        "DATE_FIN": "2019-08-15",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "16:00:00",        "HEURE_FIN": "18:00:00"      },      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Surveillance animée - Lac-Saint-Charles/7 semaines",        "DESCRIPTION_ACT": "Surveillance animée - Secteur de Lac-Saint-Charles",        "DESCRIPTION_NAT": "Programme vacance été",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "35.00",        "LIEU_1": "Centre communautaire Paul-Émile-Beaulieu",        "LIEU_2": "Centre communautaire Paul-Émile-Beaulieu",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "530, rue Delage, Québec (QC) G3G 1J2 ",        "DATE_DEB": "2019-07-01",        "DATE_FIN": "2019-08-15",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "07:00:00",        "HEURE_FIN": "09:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Tennis - Débutant à initié",        "DESCRIPTION_ACT": "Tennis",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Sports-Loisirs L''Ormière ",        "TARIF_BASE": "99.00",        "LIEU_1": "École secondaire Neufchâtel",        "LIEU_2": "École secondaire Neufchâtel - Palestre",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "3600, avenue Chauveau, Québec (QC) G2C 1A1 ",        "DATE_DEB": "2019-01-26",        "DATE_FIN": "2019-03-16",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "09:00:00",        "HEURE_FIN": "10:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Ligue de badminton - Intermédiaire et avancé",        "DESCRIPTION_ACT": "Ligue de badminton - Intermédiaire et avancé",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Sports-Loisirs L''Ormière ",        "TARIF_BASE": "82.00",        "LIEU_1": "École secondaire Neufchâtel",        "LIEU_2": "École secondaire Neufchâtel - Gymnase",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "3600, avenue Chauveau, Québec (QC) G2C 1A1 ",        "DATE_DEB": "2019-01-07",        "DATE_FIN": "2019-04-08",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "20:45:00",        "HEURE_FIN": "22:45:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Cheerleading",        "DESCRIPTION_ACT": "Danse  Cheerleading",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Sports-Loisirs L''Ormière ",        "TARIF_BASE": "40.00",        "LIEU_1": "École secondaire Neufchâtel",        "LIEU_2": "École de la Chaumière - Gymnase",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "3600, avenue Chauveau, Québec (QC) G2C 1A1 ",        "DATE_DEB": "2019-05-04",        "DATE_FIN": "2019-06-08",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "09:00:00",        "HEURE_FIN": "09:45:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Cheerleading",        "DESCRIPTION_ACT": "Danse  Cheerleading",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Sports-Loisirs L''Ormière ",        "TARIF_BASE": "45.00",        "LIEU_1": "École secondaire Neufchâtel",        "LIEU_2": "École de la Chaumière - Gymnase",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "3600, avenue Chauveau, Québec (QC) G2C 1A1 ",        "DATE_DEB": "2019-05-04",        "DATE_FIN": "2019-06-08",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "10:55:00",        "HEURE_FIN": "11:55:00"      }]}}';
    Map activityMap = jsonDecode(activityJSON);

    List<Activity> list = new List<Activity>();
    for (int i = 0; i < activityMap.length; ++i) {
      Location locationObject = generateLocation(activityMap[i]["ADRESSE"], activityMap[i]["LIEU_1"], activityMap[i]["ARRONDISSEMENT"], location.toLowerCase());

      list.add(new Activity(
        locationObject,
        activityMap[i]["CODE_SESSION"],
        activityMap[i]["DESCRIPTION"],
        activityMap[i]["DESCRIPTION_ACT"],
        activityMap[i]["DESCRIPTION_NAT"],
        activityMap[i]["NOM_COUR"],
        activityMap[i]["TARIF_BASE"],
        activityMap[i]["DATE_DEB"],
        activityMap[i]["DATE_FIN"]
      ));
    }

    return list;
  }

  @override
  List<Activity> loadCustomActivities(String location) {
    return null;
  }

  @override
  get source => "JSON Files";
}