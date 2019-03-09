import 'package:flutter/material.dart';

class ListUsers extends StatefulWidget {
  ListUsers() : super();

  String _title = "Partie de soccer";
  List<String> _listUser = List<String>();

  List initState() {
    if(_listUser.length != 2) {
      _listUser.add("Tom");
      _listUser.add("Sam");
    }

    return _listUser;
  }

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("sds"),
        ),
        body: Column(
          children: _buildUsers(),
        ),
    );
  }

  List<Widget> _buildUsers() {
    return widget.initState().map((user) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                CircleAvatar(
                  minRadius: 28.0,
                  maxRadius: 28.0,
                  backgroundImage: AssetImage('images/avatar.jpg'),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("adsdasdxcxc")
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("adsdasdxcxc")
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

}