import 'package:hello_world/Classes/Activity/Activity.dart';
import 'dart:io';
import 'dart:convert';
import '../Classes/Location/Location.dart';
import '../Interfaces/IDataLoader.dart';

class JSONDataLoader implements IDataLoader {
  String readFile(String fileLocation) {
    String contents = "unfortunately, an error occured";
    File file = new File(fileLocation);
    if (file.existsSync()) {
      contents = file.readAsStringSync();
    }

    return contents;
  }

  Map getCoordinates(String location, String address) {
    String coordJSON = readFile("../../../Data/" + location.toLowerCase()  + "/vdq-adresse.geojson");
    Map coordMap = jsonDecode(coordJSON)["features"];
    Map retVal;
    
    for (int i = 0; i < coordMap.length; ++i) {
      if (coordMap[i]["properties"]["RECHERCHE"] == location) {
        retVal = coordMap[i]["geometry"]["coordinates"];
        break;
      }
    }

    return retVal;
  }

  Location generateLocation(String address, String locationName, String borough, String location) {
    String civic = address.substring(0, address.indexOf(","));
    address = address.substring(address.indexOf(",") + 1);

    String street = address.trim().substring(0, address.indexOf(","));
    address = address.substring(address.indexOf(",") + 1);

    String postalCode = address.trim().substring(address.indexOf(")") + 2);
    String stateCode = address.trim().substring(address.indexOf("(") + 1, address.indexOf(")"));

    address = address.trim().substring(0, address.indexOf(" ("));
    String city = address.trim().substring(address.lastIndexOf(" "));

    // Map coord = getCoordinates(location, civic + "  " + street);
    double latitude = 0;
    double longitude = 0;

    // if (coord == null) {
    //   throw new Exception ("explosion!!!!!!!!!!!!!!!!");
    // }

    latitude = 0;
    longitude = 0;

    Location newLocation = new Location(locationName, civic, street, borough, city, stateCode, postalCode, latitude, longitude);
    return newLocation;
  }

  @override
  List<Activity> loadCityActivities(String location) {
    String activityJSON = 
    '    {    "LOISIR_PAYANT": [    {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Cours de natation particulier",        "DESCRIPTION_ACT": "Cours de natation particulier",        "DESCRIPTION_NAT": "Cours de natation",        "NOM_COUR": "DCLVC de La Haute-Saint-Charles",        "TARIF_BASE": "35.00",        "LIEU_1": "Édifice Denis-Giguère",        "LIEU_2": "Centre communautaire de l''édifice Denis-Giguère - Piscine",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "305, rue Racine, Québec (QC) G2B 1E7 ",        "DATE_DEB": "2019-02-23",        "DATE_FIN": "2019-02-23",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "13:55:00"    },    {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Karaté - Parent-Enfant - Débutant",        "DESCRIPTION_ACT": "Karaté",        "DESCRIPTION_NAT": "Sports de combat",        "NOM_COUR": "Club de Karaté Saint-Émile (Affilié avec les Studios Unis d''auto-défense)",        "TARIF_BASE": "110.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre communautaire Saint-Émile - Salle 021, combats",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2018-11-27",        "DATE_FIN": "2019-03-02",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "10:00:00",        "HEURE_FIN": "11:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Le Jardin des Grands Schtroumpfs",        "DESCRIPTION_ACT": "Le Jardin des Grands Schtroumpfs",        "DESCRIPTION_NAT": "Loisirs pré-scolaire",        "NOM_COUR": "Atelier communautaire Saint-Émile",        "TARIF_BASE": "234.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre communautaire Saint-Émile - Salle 007-Gr Scht",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2019-01-14",        "DATE_FIN": "2019-04-17",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "16:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Camp des fêtes",        "DESCRIPTION_ACT": "Camp des fêtes",        "DESCRIPTION_NAT": "Programme vacance été",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "25.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre communautaire Saint-Émile - Salle ABC",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2019-01-02",        "DATE_FIN": "2019-01-02",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "12:00:00",        "HEURE_FIN": "18:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Groupe vocal - Les Voix de la Haute-Saint-Charles",        "DESCRIPTION_ACT": "Chant choral - Répétitions",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Les Voix de la Haute-Saint-Charles",        "TARIF_BASE": "160.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre communautaire Saint-Émile - Salle 141-B",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2019-01-09",        "DATE_FIN": "2019-05-08",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "19:15:00",        "HEURE_FIN": "21:45:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Viniyoga Shristi",        "DESCRIPTION_ACT": "Viniyoga",        "DESCRIPTION_NAT": "Mieux-être",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "160.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre communautaire Saint-Émile - Salle 134",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2019-01-14",        "DATE_FIN": "2019-04-29",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "18:15:00",        "HEURE_FIN": "19:30:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Atelier psychomotricité libre",        "DESCRIPTION_ACT": "Atelier psychomotricité libre",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "5.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre Communautaire Saint-Émile - Salle 131",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2019-04-06",        "DATE_FIN": "2019-06-08",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "13:30:00",        "HEURE_FIN": "15:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Zumba Gold",        "DESCRIPTION_ACT": "Zumba Gold",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "75.00",        "LIEU_1": "Centre communautaire Saint-Émile",        "LIEU_2": "Centre communautaire Saint-Émile - Salle ABC",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "2200, rue de la Faune, Québec (QC) G3E 1K6 ",        "DATE_DEB": "2019-04-17",        "DATE_FIN": "2019-06-05",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "10:30:00",        "HEURE_FIN": "11:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Aquaforme - Régulier",        "DESCRIPTION_ACT": "Aquaforme ",        "DESCRIPTION_NAT": "Activités aquatiques",        "NOM_COUR": "Loisirs Vanier",        "TARIF_BASE": "91.00",        "LIEU_1": "Complexe Jean-Paul-Nolin",        "LIEU_2": "Complexe Jean-Paul-Nolin \U005C piscine intérieure",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "340, rue Chabot, Québec (QC) G1M 3J5 ",        "DATE_DEB": "2019-01-08",        "DATE_FIN": "2019-03-26",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "18:00:00",        "HEURE_FIN": "18:55:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Yoga",        "DESCRIPTION_ACT": "Yoga",        "DESCRIPTION_NAT": "Mieux-être",        "NOM_COUR": "Loisirs Vanier",        "TARIF_BASE": "80.00",        "LIEU_1": "Complexe Jean-Paul-Nolin",        "LIEU_2": "Complexe Jean-Paul-Nolin \U005C salle polyvalente",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "340, rue Chabot, Québec (QC) G1M 3J5 ",        "DATE_DEB": "2019-01-08",        "DATE_FIN": "2019-03-26",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "12:10:00",        "HEURE_FIN": "13:00:00"      },      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Ligue 2 contre 2 jeunes",        "DESCRIPTION_ACT": "Volleyball - Réservation saisonnière",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Académie ProBeach",        "TARIF_BASE": "125.00",        "LIEU_1": "Parc Victoria",        "LIEU_2": "Parc Victoria terrain de volleyball 2",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "6, rue Robert-Rumilly, Québec (QC) G1K 8B3 ",        "DATE_DEB": "2019-06-25",        "DATE_FIN": "2019-08-13",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "18:00:00",        "HEURE_FIN": "21:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Espagnol, avancé 2",        "DESCRIPTION_ACT": "Espagnol (conversation)",        "DESCRIPTION_NAT": "Loisir éducatif",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "150.00",        "LIEU_1": "Centre de loisirs Sainte-Ursule",        "LIEU_2": "Salle 120 centre de loisirs Ste-Ursule",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3224, rue Armand-Hamelin, Québec (QC) G1W 2W7 ",        "DATE_DEB": "2019-01-28",        "DATE_FIN": "2019-04-15",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "15:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Danse en ligne, débutant",        "DESCRIPTION_ACT": "Danse",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "90.00",        "LIEU_1": "Centre de loisirs Sainte-Ursule",        "LIEU_2": "Salle pol. 208 centre de loisirs Ste-Ursule",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3224, rue Armand-Hamelin, Québec (QC) G1W 2W7 ",        "DATE_DEB": "2019-01-16",        "DATE_FIN": "2019-05-01",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "13:30:00",        "HEURE_FIN": "14:45:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Dessin et peinture, initié",        "DESCRIPTION_ACT": "Dessin, peinture, huile et acrylique",        "DESCRIPTION_NAT": "Arts visuels",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "95.00",        "LIEU_1": "Centre de loisirs Sainte-Ursule",        "LIEU_2": "Salle 106 centre de loisirs Ste-Ursule",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3224, rue Armand-Hamelin, Québec (QC) G1W 2W7 ",        "DATE_DEB": "2019-01-15",        "DATE_FIN": "2019-04-02",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "13:30:00",        "HEURE_FIN": "15:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Anglais, intermédiaire ",        "DESCRIPTION_ACT": "Anglais (langue et conversation)",        "DESCRIPTION_NAT": "Loisir éducatif",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "120.00",        "LIEU_1": "Centre de loisirs Sainte-Ursule",        "LIEU_2": "Salle 104 centre de loisirs Ste-Ursule",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3224, rue Armand-Hamelin, Québec (QC) G1W 2W7 ",        "DATE_DEB": "2019-01-16",        "DATE_FIN": "2019-04-03",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "09:00:00",        "HEURE_FIN": "11:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Stretching, tous les niveaux",        "DESCRIPTION_ACT": "Stretching",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "55.00",        "LIEU_1": "Centre de loisirs Sainte-Ursule",        "LIEU_2": "Salle pol. 208 centre de loisirs Ste-Ursule",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3224, rue Armand-Hamelin, Québec (QC) G1W 2W7 ",        "DATE_DEB": "2019-04-26",        "DATE_FIN": "2019-06-14",        "JOUR_SEMAINE": "Vendredi",        "HEURE_DEBUT": "09:30:00",        "HEURE_FIN": "10:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Patinage Plus - Avancé",        "DESCRIPTION_ACT": "Patinage",        "DESCRIPTION_NAT": "Sports de glace",        "NOM_COUR": "C.P.A. Duberger-Les Saules de Québec inc.",        "TARIF_BASE": "225.00",        "LIEU_1": "Aréna Gaétan-Duchesne",        "LIEU_2": "Aréna Gaétan-Duchesne \U005C patinoire intérieure",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "2650, avenue D''Alembert, Québec (QC) G1P 4H8 ",        "DATE_DEB": "2019-01-07",        "DATE_FIN": "2019-04-06",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "18:10:00",        "HEURE_FIN": "19:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Arts plastiques - Scrapbooking",        "DESCRIPTION_ACT": "Arts plastiques",        "DESCRIPTION_NAT": "Arts visuels",        "NOM_COUR": "Loisirs Vanier",        "TARIF_BASE": "60.00",        "LIEU_1": "Centre communautaire Fernand-Dufour",        "LIEU_2": "Centre com. Fernand-Dufour \U005C salle polyvalente culturelle RC22",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "222, avenue Ducharme, Québec (QC) G1M 2H3 ",        "DATE_DEB": "2019-04-06",        "DATE_FIN": "2019-06-15",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "10:00:00",        "HEURE_FIN": "10:55:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Danse Baladi",        "DESCRIPTION_ACT": "Danse - Baladi",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Loisirs Vanier",        "TARIF_BASE": "100.00",        "LIEU_1": "Centre communautaire Fernand-Dufour",        "LIEU_2": "Centre com. Fernand-Dufour \U005C salle de danse RC20",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "222, avenue Ducharme, Québec (QC) G1M 2H3 ",        "DATE_DEB": "2019-04-01",        "DATE_FIN": "2019-06-17",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "18:30:00",        "HEURE_FIN": "20:30:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Ateliers scientifiques",        "DESCRIPTION_ACT": "Ateliers scientifiques",        "DESCRIPTION_NAT": "Loisir scientifique",        "NOM_COUR": "Loisirs Vanier",        "TARIF_BASE": "60.00",        "LIEU_1": "Centre communautaire Fernand-Dufour",        "LIEU_2": "Centre com. Fernand-Dufour \U005C cuisine RC23",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "222, avenue Ducharme, Québec (QC) G1M 2H3 ",        "DATE_DEB": "2019-04-07",        "DATE_FIN": "2019-06-16",        "JOUR_SEMAINE": "Dimanche",        "HEURE_DEBUT": "11:00:00",        "HEURE_FIN": "12:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Cours de taekwondo",        "DESCRIPTION_ACT": "Cours de taekwondo",        "DESCRIPTION_NAT": "1R-Activités-Physiques",        "NOM_COUR": "Club de taekwondo WTF de Québec",        "TARIF_BASE": "75.00",        "LIEU_1": "École secondaire François-Bourrin",        "LIEU_2": "École secondaire François-Bourrin",        "ARRONDISSEMENT": "Arrondissement de Beauport",        "ADRESSE": "50, avenue des Cascades, Québec (QC) G1E 2J7 ",        "DATE_DEB": "2019-01-10",        "DATE_FIN": "2019-03-30",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "19:00:00",        "HEURE_FIN": "20:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Soccer (mini-soccer)",        "DESCRIPTION_ACT": "Mini-soccer",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Le Pivot inc.",        "TARIF_BASE": "50.00",        "LIEU_1": "École du Parc",        "LIEU_2": "École du Parc gymnase",        "ARRONDISSEMENT": "Arrondissement de Beauport",        "ADRESSE": "90, boulevard des Français, Québec (QC) G1C 2A7 ",        "DATE_DEB": "2019-01-19",        "DATE_FIN": "2019-04-06",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "09:00:00",        "HEURE_FIN": "01:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Yoseikan budô : Formule régulière",        "DESCRIPTION_ACT": "Yoseikan budô : Formule régulière",        "DESCRIPTION_NAT": "Sports de combat",        "NOM_COUR": "Club karaté-budô de Beauport inc.",        "TARIF_BASE": "240.00",        "LIEU_1": "École aux Quatre-Vents",        "LIEU_2": "École aux Quatre-Vents gymnase",        "ARRONDISSEMENT": "Arrondissement de Beauport",        "ADRESSE": "105, rue Savio, Québec (QC) G1E 1G5 ",        "DATE_DEB": "2019-01-14",        "DATE_FIN": "2019-05-01",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "19:30:00",        "HEURE_FIN": "21:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Pickleball",        "DESCRIPTION_ACT": "Pickleball",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Le Pivot inc.",        "TARIF_BASE": "6.00",        "LIEU_1": "École aux Quatre-Vents",        "LIEU_2": "École aux Quatre-Vents gymnase",        "ARRONDISSEMENT": "Arrondissement de Beauport",        "ADRESSE": "105, rue Savio, Québec (QC) G1E 1G5 ",        "DATE_DEB": "2019-01-15",        "DATE_FIN": "2019-05-31",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "18:30:00",        "HEURE_FIN": "20:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Natation Essentiel 2",        "DESCRIPTION_ACT": "Natation Essentiel 2",        "DESCRIPTION_NAT": "Cours de natation",        "NOM_COUR": "DCLVC de Beauport",        "TARIF_BASE": "81.00",        "LIEU_1": "École secondaire de la Seigneurie",        "LIEU_2": "Piscine Seigneurie",        "ARRONDISSEMENT": "Arrondissement de Beauport",        "ADRESSE": "645, avenue du Cénacle, Québec (QC) G1E 1B3 ",        "DATE_DEB": "2019-01-14",        "DATE_FIN": "2019-03-18",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "20:00:00",        "HEURE_FIN": "20:55:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Tai chi intermédiaire et avancé (Pékin style Yang)",        "DESCRIPTION_ACT": "Tai chi",        "DESCRIPTION_NAT": "Mieux-être",        "NOM_COUR": "Centre des loisirs Saint-Sacrement inc.",        "TARIF_BASE": "120.00",        "LIEU_1": "Centre communautaire de Saint-Sacrement",        "LIEU_2": "Centre communautaire de Saint-Sacrement bâtiment",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "1360, boulevard de l''Entente, Québec (QC) G1S 2T9 ",        "DATE_DEB": "2019-01-18",        "DATE_FIN": "2019-04-05",        "JOUR_SEMAINE": "Vendredi",        "HEURE_DEBUT": "11:00:00",        "HEURE_FIN": "12:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Qi-Gong",        "DESCRIPTION_ACT": "Qi-Gong",        "DESCRIPTION_NAT": "Mieux-être",        "NOM_COUR": "Centre des loisirs Saint-Sacrement inc.",        "TARIF_BASE": "120.00",        "LIEU_1": "Centre communautaire de Saint-Sacrement",        "LIEU_2": "Centre communautaire de Saint-Sacrement bâtiment",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "1360, boulevard de l''Entente, Québec (QC) G1S 2T9 ",        "DATE_DEB": "2019-01-16",        "DATE_FIN": "2019-04-03",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "18:00:00",        "HEURE_FIN": "19:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Entraînement haute intensité",        "DESCRIPTION_ACT": "Conditionnement physique",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Centre des loisirs Saint-Sacrement inc.",        "TARIF_BASE": "120.00",        "LIEU_1": "Centre communautaire de Saint-Sacrement",        "LIEU_2": "Centre communautaire de Saint-Sacrement bâtiment",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "1360, boulevard de l''Entente, Québec (QC) G1S 2T9 ",        "DATE_DEB": "2019-01-16",        "DATE_FIN": "2019-04-03",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "17:30:00",        "HEURE_FIN": "18:20:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Dessin ou pastel au choix du participant",        "DESCRIPTION_ACT": "Dessin",        "DESCRIPTION_NAT": "Arts visuels",        "NOM_COUR": "Centre des loisirs Saint-Sacrement inc.",        "TARIF_BASE": "150.00",        "LIEU_1": "Centre communautaire de Saint-Sacrement",        "LIEU_2": "Centre communautaire de Saint-Sacrement bâtiment",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "1360, boulevard de l''Entente, Québec (QC) G1S 2T9 ",        "DATE_DEB": "2019-01-17",        "DATE_FIN": "2019-04-04",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "15:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Généalogie",        "DESCRIPTION_ACT": "Activités sociales",        "DESCRIPTION_NAT": "Loisirs récréatifs",        "NOM_COUR": "Centre des loisirs Saint-Sacrement inc.",        "TARIF_BASE": "140.00",        "LIEU_1": "Centre communautaire de Saint-Sacrement",        "LIEU_2": "Centre communautaire de Saint-Sacrement bâtiment",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "1360, boulevard de l''Entente, Québec (QC) G1S 2T9 ",        "DATE_DEB": "2019-01-17",        "DATE_FIN": "2019-04-04",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "09:30:00",        "HEURE_FIN": "11:30:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Chant à l''unisson",        "DESCRIPTION_ACT": "Chant",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Centre des loisirs Saint-Sacrement inc.",        "TARIF_BASE": "68.00",        "LIEU_1": "Centre communautaire de Saint-Sacrement",        "LIEU_2": "Centre communautaire de Saint-Sacrement salle communautaire",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "1360, boulevard de l''Entente, Québec (QC) G1S 2T9 ",        "DATE_DEB": "2019-04-17",        "DATE_FIN": "2019-06-05",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "14:30:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Piyo",        "DESCRIPTION_ACT": "Piyo",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Loisirs des Hauts-Sentiers",        "TARIF_BASE": "75.00",        "LIEU_1": "Centre communautaire Paul-Émile-Beaulieu",        "LIEU_2": "Centre communautaire Paul-Émile-Beaulieu - Salle 100",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "530, rue Delage, Québec (QC) G3G 1J2 ",        "DATE_DEB": "2019-04-16",        "DATE_FIN": "2019-06-11",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "19:30:00",        "HEURE_FIN": "20:30:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Jeux de société",        "DESCRIPTION_ACT": "Jeux de société / Table",        "DESCRIPTION_NAT": "1R-Activités récréatives",        "NOM_COUR": "Loisirs Lebourgneuf inc.",        "TARIF_BASE": "5.00",        "LIEU_1": "Centre communautaire Lebourgneuf",        "LIEU_2": "Centre com. Lebourgneuf  \U005C Entrée",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "1650, boulevard La Morille, Québec (QC) G2K 2L2 ",        "DATE_DEB": "2019-04-20",        "DATE_FIN": "2019-06-08",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "16:55:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Initiation au bridge",        "DESCRIPTION_ACT": "Bridge duplicata - Club",        "DESCRIPTION_NAT": "Loisirs récréatifs",        "NOM_COUR": "Loisirs Lebourgneuf inc.",        "TARIF_BASE": "104.00",        "LIEU_1": "Centre communautaire Lebourgneuf",        "LIEU_2": "Centre com. Lebourgneuf \U005C Salle Mezzanine 1",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "1650, boulevard La Morille, Québec (QC) G2K 2L2 ",        "DATE_DEB": "2019-04-15",        "DATE_FIN": "2019-06-03",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "13:00:00",        "HEURE_FIN": "15:25:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Activités artistique - Multiart",        "DESCRIPTION_ACT": "Activités artistiques",        "DESCRIPTION_NAT": "Loisirs récréatifs",        "NOM_COUR": "Loisirs Lebourgneuf inc.",        "TARIF_BASE": "116.00",        "LIEU_1": "Centre communautaire Lebourgneuf",        "LIEU_2": "Centre com. Lebourgneuf  \U005C salle théâtre et photo",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "1650, boulevard La Morille, Québec (QC) G2K 2L2 ",        "DATE_DEB": "2019-04-14",        "DATE_FIN": "2019-06-02",        "JOUR_SEMAINE": "Dimanche",        "HEURE_DEBUT": "12:30:00",        "HEURE_FIN": "14:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Aquarelle, débutant et intermédiaire",        "DESCRIPTION_ACT": "Aquarelle",        "DESCRIPTION_NAT": "Arts visuels",        "NOM_COUR": "Mouvement d''animation artistique de Cap-Rouge (Le)",        "TARIF_BASE": "106.40",        "LIEU_1": "Centre communautaire de Cap-Rouge",        "LIEU_2": "Salle 113",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "4473, rue Saint-Félix, Québec (QC) G1Y 3A6 ",        "DATE_DEB": "2019-04-29",        "DATE_FIN": "2019-06-17",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "19:00:00",        "HEURE_FIN": "21:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Photographie - Club photo",        "DESCRIPTION_ACT": "Photographie",        "DESCRIPTION_NAT": "Arts visuels",        "NOM_COUR": "Loisirs Duberger-Les Saules inc.",        "TARIF_BASE": "78.00",        "LIEU_1": "Centre communautaire Elzéar-Turcotte",        "LIEU_2": "Centre Elzéar-Turcotte \U005C petite salle RC 08-2",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "2455, boulevard Central, Québec (QC) G1P 3N9 ",        "DATE_DEB": "2019-04-11",        "DATE_FIN": "2019-05-30",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "19:00:00",        "HEURE_FIN": "21:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Atelier de cirque",        "DESCRIPTION_ACT": "Atelier de cirque",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Loisirs-Action Val-Bélair",        "TARIF_BASE": "60.00",        "LIEU_1": "École à l''Orée-des-Bois",        "LIEU_2": "École à l''Orée-des-Bois - Gymnase",        "ARRONDISSEMENT": "Arrondissement de La Haute-Saint-Charles",        "ADRESSE": "1389, rue des Camarades, Québec (QC) G3K 2N5 ",        "DATE_DEB": "2019-05-05",        "DATE_FIN": "2019-06-09",        "JOUR_SEMAINE": "Dimanche",        "HEURE_DEBUT": "10:00:00",        "HEURE_FIN": "11:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Badminton, débutant et intermédiaire",        "DESCRIPTION_ACT": "Badminton libre",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "25.00",        "LIEU_1": "École primaire Coeur-Vaillant-Campanile",        "LIEU_2": "Gymnase Coeur-Vaillant-Campanile",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3645, chemin Sainte-Foy, Québec (QC) G1X 1T1 ",        "DATE_DEB": "2019-04-29",        "DATE_FIN": "2019-06-17",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "20:00:00",        "HEURE_FIN": "22:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Golf, débutant et intermédiaire",        "DESCRIPTION_ACT": "Golf",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "École de Golf Pré-Saison inc.",        "TARIF_BASE": "175.00",        "LIEU_1": "École primaire St-Michel",        "LIEU_2": "Gymnase A école St-Michel",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "1684, rue Sheppard, Québec (QC) G1S 1L2 ",        "DATE_DEB": "2019-03-02",        "DATE_FIN": "2019-04-06",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "09:30:00",        "HEURE_FIN": "11:00:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Entraînement à intervalles courts",        "DESCRIPTION_ACT": "Entraînement à intervalles courts",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Les 4 loisirs inc.",        "TARIF_BASE": "70.00",        "LIEU_1": "Parc Saint-Benoit",        "LIEU_2": "Parc Saint-Benoît",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3460, rue Rochambeau, Québec (QC) G1X 2H1 ",        "DATE_DEB": "2019-04-29",        "DATE_FIN": "2019-06-03",        "JOUR_SEMAINE": "Lundi",        "HEURE_DEBUT": "18:30:00",        "HEURE_FIN": "19:15:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Aquajogging ",        "DESCRIPTION_ACT": "Aquajogging",        "DESCRIPTION_NAT": "Activités aquatiques",        "NOM_COUR": "DCLVC de Sainte-Foy-Sillery-Cap-Rouge",        "TARIF_BASE": "81.00",        "LIEU_1": "Piscine Sylvie-Bernier",        "LIEU_2": "Demi bassin PSB",        "ARRONDISSEMENT": "Arrondissement Sainte-Foy-Sillery-Cap-Rouge",        "ADRESSE": "3020, boulevard Hochelaga, Québec (QC) G1V 3Y4 ",        "DATE_DEB": "2019-01-16",        "DATE_FIN": "2019-03-20",        "JOUR_SEMAINE": "Mercredi",        "HEURE_DEBUT": "08:05:00",        "HEURE_FIN": "09:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Tennis - Pratique",        "DESCRIPTION_ACT": "Tennis - Pratique",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Adaptavie inc.",        "TARIF_BASE": "32.00",        "LIEU_1": "I.R.D.P.Q. (boul. W.-Hamel)",        "LIEU_2": "IRDPQ01 \U005C gymnase simple F 120",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "525, boulevard Wilfrid-Hamel Est, Québec (QC) G1M 2S8 ",        "DATE_DEB": "2019-01-20",        "DATE_FIN": "2019-03-24",        "JOUR_SEMAINE": "Dimanche",        "HEURE_DEBUT": "08:00:00",        "HEURE_FIN": "10:00:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Act. sportives variées - Après-midi santé- Adultes",        "DESCRIPTION_ACT": "Activités sportives variées - Après-midi santé ",        "DESCRIPTION_NAT": "Loisirs récréatifs",        "NOM_COUR": "Adaptavie inc.",        "TARIF_BASE": "132.00",        "LIEU_1": "I.R.D.P.Q. (boul. W.-Hamel)",        "LIEU_2": "IRDPQ01 \U005C gymnase simple F 120",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "525, boulevard Wilfrid-Hamel Est, Québec (QC) G1M 2S8 ",        "DATE_DEB": "2019-01-20",        "DATE_FIN": "2019-05-16",        "JOUR_SEMAINE": "Dimanche",        "HEURE_DEBUT": "13:45:00",        "HEURE_FIN": "16:45:00"      },      {        "CODE_SESSION": "P2019",        "DESCRIPTION": "Hockey cosom - Intermédiaire et avancé",        "DESCRIPTION_ACT": "Hockey",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Adaptavie inc.",        "TARIF_BASE": "32.00",        "LIEU_1": "I.R.D.P.Q. (boul. W.-Hamel)",        "LIEU_2": "IRDPQ01 \U005C gymnase simple F 120",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "525, boulevard Wilfrid-Hamel Est, Québec (QC) G1M 2S8 ",        "DATE_DEB": "2019-04-11",        "DATE_FIN": "2019-06-13",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "19:30:00",        "HEURE_FIN": "20:30:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Golf",        "DESCRIPTION_ACT": "Golf",        "DESCRIPTION_NAT": "Sports et de plein air",        "NOM_COUR": "Loisirs Duberger-Les Saules inc.",        "TARIF_BASE": "100.00",        "LIEU_1": "École secondaire La Camaradière",        "LIEU_2": "École secondaire La Camaradière \U005C palestre",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "3400, boulevard Neuvialle, Québec (QC) G1P 3A8 ",        "DATE_DEB": "2019-01-17",        "DATE_FIN": "2019-03-07",        "JOUR_SEMAINE": "Jeudi",        "HEURE_DEBUT": "20:30:00",        "HEURE_FIN": "22:00:00"      },      {        "CODE_SESSION": "E2019",        "DESCRIPTION": "Jogging - Course en sentier",        "DESCRIPTION_ACT": "Conditionnement physique - Cardio jogging",        "DESCRIPTION_NAT": "Activités physiques",        "NOM_COUR": "Loisirs Duberger-Les Saules inc.",        "TARIF_BASE": "67.00",        "LIEU_1": "Parc Chauveau",        "LIEU_2": "Parc Chauveau \U005C aire de jeux",        "ARRONDISSEMENT": "Arrondissement des Rivières",        "ADRESSE": "3175, avenue Chauveau, Québec (QC) G2C 1A3 ",        "DATE_DEB": "2019-06-25",        "DATE_FIN": "2019-08-27",        "JOUR_SEMAINE": "Mardi",        "HEURE_DEBUT": "18:30:00",        "HEURE_FIN": "19:25:00"      },      {        "CODE_SESSION": "H2019",        "DESCRIPTION": "Danse Hip hop",        "DESCRIPTION_ACT": "Hip hop",        "DESCRIPTION_NAT": "Arts de la scène",        "NOM_COUR": "Studio Accordanse",        "TARIF_BASE": "155.00",        "LIEU_1": "Studio Accordanse",        "LIEU_2": "Stydio Accordanse salle 01",        "ARRONDISSEMENT": "Arrondissement de La Cité-Limoilou",        "ADRESSE": "766, rue Kirouac, Québec (QC) G1N 2J4 ",        "DATE_DEB": "2019-01-19",        "DATE_FIN": "2019-06-01",        "JOUR_SEMAINE": "Samedi",        "HEURE_DEBUT": "12:00:00",        "HEURE_FIN": "13:00:00"      }    ]}';
    Map activityMap = jsonDecode(activityJSON);

    List<Activity> list = new List<Activity>();
    for(var items in activityMap['LOISIR_PAYANT']) {
      Location locationObject = generateLocation(items['ADRESSE'], items['LIEU_1'], items['ARRONDISSEMENT'], location.toLowerCase());

      list.add(new Activity(
        locationObject,
        items["CODE_SESSION"],
        items["DESCRIPTION"],
        items["DESCRIPTION_ACT"],
        items["DESCRIPTION_NAT"],
        items["NOM_COUR"],
        double.parse(items["TARIF_BASE"]),
        DateTime.parse(items["DATE_DEB"]),
        DateTime.parse(items["DATE_FIN"])
      ));
    }

    return list;
  }

  @override
  List<Activity> loadCustomActivities(String location) {
    return null;
  }

  @override
  get source => "JSON Files";
}