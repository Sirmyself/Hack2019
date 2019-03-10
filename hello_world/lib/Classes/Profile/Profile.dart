import 'package:flutter/material.dart';
import 'package:hello_world/flashCard.dart';
import '../Activity/User.dart';
import '../../arc_banner.dart';

class Profile extends StatefulWidget {

  Profile() {
    this._user = new User();
  }

  User _user;

  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {

  double _imageHeight = 256.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 140.0),
                child: ArcBannerImage("assets/images/surf.jpg"),
              ),
              _buildProfileRow(),
              _buildMyTasksHeader()
            ],
          ),
        )
    );
  }


  Widget _buildProfileRow() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: Row(
        children: <Widget>[

        CircleAvatar(
        minRadius: 28.0,
        maxRadius: 28.0,
        backgroundImage: AssetImage('images/avatar.jpg'),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Ryan Barnes',
              style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
            Text(
              'Product designer',
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
      padding: EdgeInsets.only(left: 64.0, top: 240.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              'Mes activités',
              style: TextStyle(fontSize: 34.0)
          ),
          Text(
            'FEBRUARY 8, 2015',
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }


}

