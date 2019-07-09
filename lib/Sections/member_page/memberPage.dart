import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../handicap_scores/scores_handicap.dart';
import '../handicap_scores/hole_stats.dart';

class MemberPage extends StatefulWidget {
  final String users;
  MemberPage({this.users});
  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  int _currentIndex = 0;
  List<Widget> _children = [
    HandicapHoles(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    setState(() {
      _children = [
        HandicapScores(
          user: widget.users,
        ),
        HoleStats(
          user: widget.users,
        ),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        hintColor: Colors.black,
        canvasColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      child: Scaffold(
        appBar: new AppBar(
          title: new Text(
            'Account Page',
            style: new TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: new BottomNavigationBar(
          fixedColor: Colors.black,
          iconSize: 35.0,
          onTap: onTabTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.golfBall),
                backgroundColor: Colors.red,
                title: new Text(
                  'Scores',
                  style: new TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.golf_course),
                backgroundColor: Colors.red,
                title: new Text(
                  'Hole Stats',
                  style: new TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                )),
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }
}

class HandicapHoles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HandicapScores();
  }
}

class HoleStat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HoleStats();
  }
}
