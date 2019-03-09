import '../Interfaces/IDataLoader.dart';

abstract class  IDataLoader {
  get source => "none";

  void loadCityActivities(location);
  void loadCustomActivities(location);
}