import '../Location/Location.dart';

class Activity {
  static List<String> actTypes;

  Location location;
  String code;
  String name;
  String description;
  String type;
  String organizer;
  double price;
  DateTime start;
  DateTime end;

  Activity(location, code, name, description, type, organizer, price, start, end) {
    this.location = location;
    this.code = code;
    this.name = name;
    this.description = description;
    this.type = type;
    this.organizer = organizer;
    this.price = price;
    this.start = start;
    this.end = end;

    if (!actTypes.contains(this.type)) {
      actTypes.add(this.type);
      actTypes.sort();
    }
  }
}

/*
  "CODE_SESSION": "H2019",
  "DESCRIPTION": "Tennis - Débutant à initié",
  "DESCRIPTION_ACT": "Tennis",
  "DESCRIPTION_NAT": "Sports et de plein air",
  "NOM_COUR": "Sports-Loisirs L'Ormière ",
  "TARIF_BASE": "99.00",
  "DATE_DEB": "2019-01-26",
  "DATE_FIN": "2019-03-16",
  "HEURE_DEBUT": "09:00:00",
  "HEURE_FIN": "10:30:00" 
*/