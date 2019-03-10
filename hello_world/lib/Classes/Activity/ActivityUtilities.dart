import '../Activity/Activity.dart';
import '../../Interfaces/IDataLoader.dart';
import '../JSONDataLoader.dart';

class ActivityUtility {
  static List<Activity> search (String city, String keywords) {
    IDataLoader loader = new JSONDataLoader(); 
    return loader.loadCityActivities(city);
  }
}