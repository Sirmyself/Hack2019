import '../DebugDataLoader.dart';
import '../Activity/Activity.dart';
import '../../Interfaces/IDataLoader.dart';

class ActivityUtility {
  static List<Activity> search (String city, String keywords) {
    IDataLoader loader = new DebugDataLoader(); 
    return loader.loadCityActivities("Quebec");
  }
}