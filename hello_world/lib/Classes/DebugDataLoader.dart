import '../Interfaces/IDataLoader.dart';

class DebugDataLoader implements IDataLoader {
  String get source => "local files";

  @override
  void loadCityActivities(location) {
    
  }

  @override
  void loadCustomActivities(location) {
  }
}