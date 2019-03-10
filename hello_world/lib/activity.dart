import 'package:flutter/material.dart';
import 'Classes/Activity/Activity.dart' as Activite;
import 'arc_banner.dart';

class Activity extends StatefulWidget {

  Activite.Activity activity;

  Activity(this.activity) : super();
  List<String> _listCategory = List<String>();


  List initState() {
    _listCategory.clear();
    _listCategory.addAll(Activite.Activity.actTypes);
    
    // if(_listCategory.length != 2) {
    //   _listCategory.add("Sport");
    //   _listCategory.add("Plein air");
    // }
    return _listCategory;
  }

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {

  bool actif = false;
  String btnParticiper = "Participer";
  int count = 0;
  double _imageHeight = 256.0;

  void _buttonChange() {
    setState(() {
      if(!actif) {
        btnParticiper = "Ne plus participer";
        count += 1;
        actif = !actif;
      } else {
        btnParticiper = "Participer";
        count -= 1;
        actif = !actif;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 140.0),
              child: ArcBannerImage("assets/images/soccer.jpg"),
            ),
            _buildProfileRow(),
            _information(),
            _description(),
            //_comments()
          ],
        ),
      )
    );
  }

  Widget _buildProfileRow() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 3.8),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            backgroundImage: AssetImage(widget.activity.user.getLogoPath()),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.activity.user.getNom(),
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.activity.user.getPrenom(),
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _information() {
    return Center(
      widthFactor: 200,
      child: Container(
          width: MediaQuery.of(context).size.width - 30,
          height: 330.0,
          margin: EdgeInsets.only(top: 180.0),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  color: Colors.grey,
                  blurRadius: 10.0
                  )
              ]
          ),
        child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                            children: [
                              Icon(Icons.date_range, color: Colors.grey),
                              Text(
                                widget.activity.start.toString().substring(0,10),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.grey),
                            Text(
                              widget.activity.start.toString().substring(11,19),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ]
                      ),
                    )
                  ]
                ),
                _separator(),
                Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 10.0),
                        child: Row(
                            children: [
                              Icon(Icons.location_on, color: Colors.grey),
                              Container(
                                width: 300,
                                child: Text(
                                  widget.activity.location.locationName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              )
                            ]
                        ),
                      ),
                    ]
                ),
                _separator(),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 300,
                    child:Row(
                    children: _buildCategoryChips(),
                  ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width-50,
                      child: Text(btnParticiper, style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                      onPressed: _buttonChange,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                       children: <Widget>[
                         Text( (widget.activity.getNbParticipant() + count).toString() + " participants", style: TextStyle(fontWeight: FontWeight.bold))
                       ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                minRadius: 20.0,
                                maxRadius: 20.0,
                                backgroundImage: AssetImage('assets/images/women1.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                minRadius: 20.0,
                                maxRadius: 20.0,
                                backgroundImage: AssetImage('assets/images/women2.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: CircleAvatar(
                                minRadius: 20.0,
                                maxRadius: 20.0,
                                backgroundImage: AssetImage('assets/images/man3.png'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.0),
                              child: Icon(
                                Icons.arrow_forward, color: Colors.grey,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        child: Text('Voir toutes les occurences'),
                      )
                    ],
                  )
                )
          ]
            ),
      )
      )
    );
  }

  List<Widget> _buildCategoryChips() {
    return widget.initState().map((category) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Chip(
          label: Text(category, overflow: TextOverflow.fade),
          backgroundColor: Colors.black12,
        ),
      );
    }).toList();
  }

  Widget _separator() {
    return Row(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))
            ),
            width: MediaQuery.of(context).size.width-50,
            margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0)
        )
      ],
    );
  }

  Widget _description() {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
          padding: const EdgeInsets.only(top: 550.00, left: 20.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Description',
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),
              Text(
                  "Do you need simple layout samples for Flutter? I present you my set of Flutter layout code snippets. I will keep it short, sweet and simple with loads of visual examples. Still, it is work in progress — the catalog of samples will  grow"
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                  'Commentaires',
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),
              TextField(

              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.0),
              )
            ],
          )
      ),
    );
  }

  Widget _comments() {
    return Container(
      width: MediaQuery.of(context).size.width - 20,
      child: Padding(
          padding: const EdgeInsets.only(top: 680.00, left: 20.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Commentaire',
                  style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  )
              ),
              Text(
                  "Do you need simple layout samples for Flutter? I present you my set of Flutter layout code snippets. I will keep it short, sweet and simple with loads of visual examples. Still, it is work in progress — the catalog of samples will grow"
              )
            ],
          )
      ),
    );
  }

}
