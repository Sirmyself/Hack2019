import '../JSONDataLoader.dart';
import '../Activity/Activity.dart';
import '../../Interfaces/IDataLoader.dart';

class ScoredActivityRecord implements Comparable {
  Activity activity;
  int score = 0;

  ScoredActivityRecord (Activity activity) {
    this.activity = activity;
  }

  @override
  int compareTo(other) {
    if (other is ScoredActivityRecord) {
      int retVal = this.score.compareTo(other.score);
      if (retVal == 0) {
        return this.activity.compareTo(other.activity);
      } else {
        return retVal;
      }
    } else if (other is Activity) {
      return this.activity.compareTo(other);
    }
    throw new Exception("Erreur.... LOL");
  }
}

class ActivityUtility {
  static List<Activity> search(String city, String keywords, DateTime starting, DateTime ending) {
    List<Activity> filtered = new List();

    city = "quebec";
    IDataLoader loader = new JSONDataLoader(); 
    List<Activity> list = loader.loadCityActivities(city).where((a) => (a.start.compareTo(starting) >= 0) && (a.end.compareTo(ending) <= 0)).toList();
    
    List<String> keysList = keywords.split(new RegExp(r"[, ]"));
    List<ScoredActivityRecord> actMap = new List();
    for (String s in keysList) {
      for (Activity a in list) {
        int score = 0;
        RegExp r = new RegExp(r"^" + s.toLowerCase() + "|( " + s.toLowerCase() + ")[;:., ]");
        if (a.name != null && a.name.toLowerCase().contains(r)) {
          ++score;
        }
        if (a.organizer != null && a.organizer.toLowerCase().contains(r)) {
          ++score;
        }
        int locationScore = a.location.containsScore(s.toLowerCase());
        if (locationScore > 0) {
          score += locationScore;
        }
        if (a.description != null && a.description.toLowerCase().contains(r)) {
          ++score;
        }
        if (a.type != null && a.type.contains(r)) {
          ++score;
        } 

        if (score > 0 && (actMap.where((act) => act.compareTo(a) == 0).length == 1)) {
          actMap.where((act) => act.compareTo(a) == 0).elementAt(0).score += score;
        } else if (score > 0) {
          actMap.add(new ScoredActivityRecord(a));
        }
      }
    }

    actMap.sort((x, y) => y.score.compareTo(x.score));
    for (ScoredActivityRecord sr in actMap) {
      filtered.add(sr.activity);
    }

    return filtered;
  }
} 