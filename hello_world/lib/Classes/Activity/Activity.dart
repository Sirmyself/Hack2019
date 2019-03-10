import '../Location/Location.dart';
import 'User.dart';
import '../Profile/TestUser.dart';

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
  User user = TestUser().getUser();
  List<User> listParticipants = List();

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

    if (this.type != null && this.type != "" && !(actTypes.indexOf(this.type == null ? "" : this.type) >= 0)) {
      actTypes.add(this.type);
      actTypes.sort();
    }
  }

  String getDesciption() {
    if (this.description == "") {
      return "Proin id pharetra ex, a pretium ex. Donec lacinia, mi non volutpat pretium, sem orci suscipit dui, at finibus sem lorem id tortor. Sed pulvinar faucibus libero nec commodo. Nam efficitur vitae diam eu semper. Donec vestibulum nec felis in pellentesque. Nullam ultricies ornare erat eu vehicula. Aenean accumsan in tellus id tincidunt. ";
    }
    return this.description;
  }

  int getNbParticipant() {
    return this.listParticipants.length+3;
  }

  @override
  int compareTo(other) {

    if (!(other is Activity)) throw new Exception("the object [" + other.toString() + "] can not be compared to an Activity Object.");

    User getAuteur() {
      return this.user;
    }

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