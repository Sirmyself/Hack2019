import '../Classes/Activity/Activity.dart';

abstract class  IDataLoader {
  get source => "none";

  List<Activity> loadCityActivities(String location);
  List<Activity> loadCustomActivities(String location);
}