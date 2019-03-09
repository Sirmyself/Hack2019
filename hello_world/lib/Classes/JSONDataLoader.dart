import 'package:hello_world/Classes/Activity/Activity.dart';
import 'dart:io';
import 'dart:convert';

import '../Classes/Location/Location.dart';
import '../Interfaces/IDataLoader.dart';

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
    String activityJSON = readFile("../../../Data/" + location.toLowerCase()  + "/LOISIR_LIBRE_Standard.JSON");
    Map activityMap = jsonDecode(activityJSON)["LOISIRS_PAYANTS"]["LOISIR_PAYANT"];

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

    return null;
  }

  @override
  List<Activity> loadCustomActivities(String location) {
    return null;
  }

  @override
  get source => "JSON Files";
}