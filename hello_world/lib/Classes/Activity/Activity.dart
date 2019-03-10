import '../Location/Location.dart';

class Activity implements Comparable {
  static List<String> actTypes = new List<String>();

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
    this.location = location == null ? "" : location;
    this.code = code == null ? "" : code;
    this.name = name == null ? "" : name;
    this.description = description == null ? "" : description;
    this.type = type == null ? "" : type;
    this.organizer = organizer == null ? "" : organizer;
    this.price = price == null ? "" : price;
    this.start = start == null ? "" : start;
    this.end = end == null ? "" : end;

    // if (!(actTypes.indexOf(this.type == null ? "" : this.type) >= 0)) {
    //   actTypes.add(this.type);
    //   actTypes.sort();
    // }
  }

  @override
  int compareTo(other) {
    if (!(other is Activity)) throw new Exception("the object [" + other.toString() + "] can not be compared to an Activity Object.");

    int retVal = this.type.compareTo(other.type);
    if (retVal == 0) {
      retVal = this.name.compareTo(other.name);
    }
    if (retVal == 0) {
      retVal = this.start.compareTo(other.start);
    }
    if (retVal == 0) {
      retVal = this.location.compareTo(other.location);
    }

    return retVal;
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