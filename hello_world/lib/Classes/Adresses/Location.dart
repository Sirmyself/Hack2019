class Location implements Comparable {
  //public (create and read Class)
  int get id => _id;
  int get civicNumber => _civicNumber;
  String get streetName => _streeName;
  String get city => _city;
  String get stateCode => _stateCode;
  String get state => _state;
  String get country => _country;
  String get postalCode => _postalCode;
  double get latitude => _latitude;
  double get longitute => _longitute;

  //private
  static int _index = 0;
  int _id;
  int _civicNumber;
  String _streeName;
  String _city;
  String _stateCode;
  String _state;
  String _country;
  String _postalCode;
  double _latitude;
  double _longitute;

  Location(civicNumber, streetName, city, stateCode, state, country, postalCode, latitude, longitude) {
    this._id = _index++;
    this._civicNumber = civicNumber;
    this._streeName = streetName;
    this._city = city;
    this._stateCode = stateCode;
    this._state = state;
    this._country = country;
    this._postalCode = postalCode;
    this._latitude = latitude;
    this._longitute = longitude;
  }

  String toString() {
    return _civicNumber.toString() + 
           ", " + _streeName +
           (_city.length > 0 ? (", " + _city) : "") + 
           (_stateCode.length > 0 ? (" (" + _stateCode + ") ") : "") +
           (_postalCode.length > 0 ? (" " + _postalCode) : "");
  }

  @override
  int compareTo(other) {
    if (!(other is Location)) throw new Exception("the object [" + other.toString() + "] can not be compared to a Location Object.");

    int retVal = this._city.compareTo(other._city);
    if (retVal == 0) {
      retVal = this._streeName.compareTo(other._streeName);
    }
    if (retVal == 0) {
      retVal = this._civicNumber.compareTo(other._civicNumber);
    }
    return retVal;
  }
}