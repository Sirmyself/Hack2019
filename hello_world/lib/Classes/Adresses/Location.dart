class Location {
  int _id;
  int _civicNumber;
  String _streeName;
  String _city;
  String _stateCode;
  String _state;
  String _country;
  String _postalCode;
  double _longitute;
  double _latitude;



  Location() {

  }

  String toString() {
    return _civicNumber.toString() + 
           ", " + _streeName +
           (_city.length > 0 ? (", " + _city) : "") + 
           (_stateCode.length > 0 ? (" (" + _stateCode + ") ") : "") +
           (_postalCode.length > 0 ? (" " + _postalCode) : "");
  }
}

/*      
"CODE_SESSION": "H2019",
"DESCRIPTION": "Tennis - Débutant à initié",
"DESCRIPTION_ACT": "Tennis",
"DESCRIPTION_NAT": "Sports et de plein air",
"NOM_COUR": "Sports-Loisirs L'Ormière ",
"TARIF_BASE": "99.00",
"LIEU_1": "École secondaire Neufchâtel",
"LIEU_2": "École secondaire Neufchâtel - Palestre",
"ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",
"ADRESSE": "3600, avenue Chauveau, Québec (QC) G2C 1A1 ",
"DATE_DEB": "2019-01-26",
"DATE_FIN": "2019-03-16",
"JOUR_SEMAINE": "Samedi",
"HEURE_DEBUT": "09:00:00",
"HEURE_FIN": "10:30:00"
*/