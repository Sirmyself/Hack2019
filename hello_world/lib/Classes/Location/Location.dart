class Location implements Comparable {
  //public (create and read Class)
  int get id => _id;
  String get locationName => _locationName;
  String get civicNumber => _civicNumber;
  String get streetName => _streeName;
  String get borough => _borough;
  String get city => _city;
  String get stateCode => _stateCode;
  String get postalCode => _postalCode;
  double get latitude => _latitude;
  double get longitute => _longitute;

  //private
  static int _index = 0;
  int _id;
  String _locationName;
  String _civicNumber;
  String _streeName;
  String _borough;
  String _city;
  String _stateCode;
  String _postalCode;
  double _latitude;
  double _longitute;

  Location(String locationName, String civicNumber, String streetName, String borough, String city, String stateCode, String postalCode, double latitude, double longitude) {
    this._id = _index++;

    this._locationName = locationName;
    this._civicNumber = civicNumber;
    this._streeName = streetName;
    this._borough = borough;
    this._city = city;
    this._stateCode = stateCode;
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

  int containsScore(String keyword) {
    int retVal = 0;
    if (_locationName.toLowerCase().contains(keyword.toLowerCase())) ++retVal;
    if (_civicNumber.toLowerCase().contains(keyword.toLowerCase())) ++retVal;
    if (_streeName.toLowerCase().contains(keyword.toLowerCase())) ++retVal;
    if (_borough.toLowerCase().contains(keyword.toLowerCase())) ++retVal;
    if (_city.toLowerCase().contains(keyword.toLowerCase())) ++retVal;
    if (_stateCode.toLowerCase().contains(keyword.toLowerCase())) ++retVal; 
    if (_postalCode.toLowerCase().contains(keyword.toLowerCase())) ++retVal;
    return retVal;
  }
}