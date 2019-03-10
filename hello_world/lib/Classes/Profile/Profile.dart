import 'package:flutter/material.dart';
import 'TestUser.dart';
import '../Activity/User.dart';
import '../../arc_banner.dart';
import '../Activity/Activity.dart';
import '../../activity.dart' as Activite;

User _user;

class Profile extends StatefulWidget {


  Profile() {
    _user = TestUser().getUser();
  }



  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {

  double _imageHeight = 256.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Stack(
            children: [
              Container(
                  child: new ActivitiesPage(_user.getListActivitySelected())
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 140.0),
                child: ArcBannerImage("assets/images/surf.jpg"),
              ),
              _buildProfileRow(),
              _buildMyTasksHeader()
            ],
          ),
    );
  }
}

  Widget _buildProfileRow() {

    double _imageHeight = 256.0;

    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 3.8),
      child: Row(
        children: <Widget>[

        CircleAvatar(
        minRadius: 28.0,
        maxRadius: 28.0,
        backgroundImage: AssetImage(_user.getLogoPath()),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              _user.getNom(),
              style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              _user.getPrenom(),
              style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      )
        ],
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 64.0, top: 200.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              'Mes activités',
              style: TextStyle(fontSize: 34.0)
          )
        ],
      ),
    );
  }


class _ActivityListItem extends StatelessWidget {

final Activity _activity;

_ActivityListItem(this._activity);

@override
Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.only(top: 5, left: 25, bottom: 5),
        leading: CircleAvatar(
            child: Text(_activity.name[0]),
        ),
        title: Text(_activity.name, style: TextStyle(fontWeight: FontWeight.bold), ),
        subtitle: Column(
        children: <Widget>[
            Row(children: <Widget>[
              Expanded(
            child: Text(_activity.location.locationName),
            ),],),
            Row(children: <Widget>[
                Text(_activity.start.toString().substring(0, 19)),
            ],)
        ],
        ),
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Activite.Activity(_activity)),
        ),
    );
    }
}

class ActivityList extends StatelessWidget {

  final List<Activity> _activities;

  ActivityList(this._activities);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: _buildActivityList()
    );
  }

  List<_ActivityListItem> _buildActivityList() {
      return _activities.map((activity) => _ActivityListItem(activity)).toList();
  }
}

  class ActivitiesPage extends StatelessWidget {

  List<Activity> _activities = List<Activity>();

  ActivitiesPage(this._activities);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 260.0),
            child: ActivityList(_activities),
          ),
      );
  }

}



