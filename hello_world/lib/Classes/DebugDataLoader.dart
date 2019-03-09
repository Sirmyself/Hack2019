import '../Interfaces/IDataLoader.dart';
import 'Activity/Activity.dart';
import 'Location/Location.dart';

class DebugDataLoader implements IDataLoader {
  String get source => "local files";

  @override
  List<Activity> loadCityActivities(location) {
    List<Activity> list = new List();

    Location loc = new Location("Le Terminal - Port de Québec", 84, "Dalhousie", "Vieux Quebec - Montcalm", "Quebec", "QC", "Quebec", "Canada", "G1K 4C4", 46.816874, -71.200582);
    list.add(new Activity(loc, "RJ532", "Blamer Charles", "Parce que c'est la faute à Charles", "Blame", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RJ533", "Blamer Kathy", "Parce que Charles veut pouvoir blâmer Kathy", "Blame", "Euzautes", 100.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RJ534", "Blamer Quelqu'un d'autre", "Parce que personne n'est parfait et que je n'ai plus de données à créer pour ce type", "Blame", "Euzautes", 1000.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));

    list.add(new Activity(loc, "RR124", "Hack2019", "Coder", "Code", "Euzautes", 10.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RR554", "HackQc", "Programmer", "Code", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RR656", "HACK HACK HACK", "développer", "Code", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    
    
    Location loc2 = new Location("Base de plein air de Sainte-Foy", 3180, "Rue Laberge", "La Suette", "Quebec", "QC", "Quebec", "Canada", "G1X 4B3", 46.787251, -71.333421);
    list.add(new Activity(loc2, "PR124", "Pêche", "Pêche en territoir interdi (pour le thrill)", "Code", "Euzautes", 10.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc2, "PR124", "Pêche", "Pêche en territoir interdi (pour le thrill)", "Code", "Euzautes", 10.00, DateTime.parse("2019-06-08 12:30:00"), DateTime.parse("2019-06-08 20:30:00")));
    list.add(new Activity(loc2, "RR554", "HackQc", "Programmer", "Code", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    return list;
  }

  @override
  List<Activity> loadCustomActivities(location) {
    List<Activity> list = new List();

    Location loc = new Location("Le Terminal - Port de Québec", 84, "Dalhousie", "Vieux Quebec - Montcalm", "Quebec", "QC", "Quebec", "Canada", "G1K 4C4", 46.816874, -71.200582);
    list.add(new Activity(loc, "RJ532", "Custom... Blamer Charles", "Parce que c'est la faute à Charles", "Blame", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RJ533", "Custom... Blamer Kathy", "Parce que Charles veut pouvoir blâmer Kathy", "Blame", "Euzautes", 100.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RJ534", "Custom... Blamer Quelqu'un d'autre", "Parce que personne n'est parfait et que je n'ai plus de données à créer pour ce type", "Blame", "Euzautes", 1000.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));

    list.add(new Activity(loc, "RR124", "Custom... Hack2019", "Coder", "Code", "Euzautes", 10.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RR554", "Custom... HackQc", "Programmer", "Code", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc, "RR656", "Custom... HACK HACK HACK", "développer", "Code", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    
    
    Location loc2 = new Location("Base de plein air de Sainte-Foy", 3180, "Rue Laberge", "La Suette", "Quebec", "QC", "Quebec", "Canada", "G1X 4B3", 46.787251, -71.333421);
    list.add(new Activity(loc2, "PR124", "Pêche", "Custom... Pêche en territoir interdi (pour le thrill)", "Code", "Euzautes", 10.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    list.add(new Activity(loc2, "PR124", "Pêche", "Custom... Pêche en territoir interdi (pour le thrill)", "Code", "Euzautes", 10.00, DateTime.parse("2019-06-08 12:30:00"), DateTime.parse("2019-06-08 20:30:00")));
    list.add(new Activity(loc2, "RR554", "HackQc", "Custom... Programmer", "Code", "Euzautes", 0.00, DateTime.parse("2019-03-08 20:30:00"), DateTime.parse("2019-03-10 12:30:00")));
    return list;
  }
}