import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'golf_analytics/rounds_per_month.dart';
import 'drinksChoice/whiskey.dart';
import 'member_page/memberPage.dart';
import 'course_records/courseRecord.dart';
import 'golf_analytics/monthlyAnalytics.dart';
import 'golf_analytics/weeklyAnalytics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

int eightRoundsPlayed = 20;
int nineRoundsPlayed = 50;
int hour = 7;
int minutes = 0;
String zeroMin = '00';
bool zero = false;
Color booked = Colors.white;
String current;
String dayMonth;
String firstName;
String lastName;

class HomePage extends StatefulWidget {
  final String users;
  HomePage({this.users});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _children;
  DocumentReference documentReference;
  StreamSubscription<DocumentSnapshot> subscription;

  int _currentIndex = 0;
  void grab() {
    setState(() {
      documentReference =
          Firestore.instance.collection('users').document(widget.users);
      _children = [
        TeeTimes(
          users: widget.users,
        ),
        GolfPage(
          users: widget.users,
        ),
        Drinks(),
        _Analytics(),
      ];
    });
    subscription = documentReference.snapshots().listen((dataSnapshot) {
      if (dataSnapshot.exists) {
        setState(() {
          firstName = dataSnapshot.data['firstName'];
          lastName = dataSnapshot.data['lastName'];
        });
      } else {
        print('Error');
      }
    });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    grab();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: new Text(
          '$firstName $lastName',
        ),
        leading: new IconButton(
          icon: Icon(Icons.people),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MemberPage()),
            );
          },
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(Icons.settings),
              highlightColor: Colors.deepPurple,
              onPressed: () {
                print('$firstName');
              },
            ),
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
          )
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        fixedColor: Colors.black,
        iconSize: 35.0,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.golf_course),
              title: new Text(
                'Tee Times',
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.golfBall),
              backgroundColor: Colors.red,
              title: new Text(
                'Scores',
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.glassWhiskey),
              title: new Text(
                'Drinks',
                textAlign: TextAlign.center,
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq),
              title: new Text(
                'Analytics',
                textAlign: TextAlign.center,
                style:
                    new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

class GolfPage extends StatelessWidget {
  final String users;
  GolfPage({this.users});
  @override
  Widget build(BuildContext context) {
    return CourseRecords();
  }
}

class TeeTimes extends StatefulWidget {
  final String users;
  TeeTimes({this.users});
  @override
  _TeeTimesState createState() => _TeeTimesState();
}

class _TeeTimesState extends State<TeeTimes> {
  @override
  Widget build(BuildContext context) {
    return TeeTimes(users: widget.users);
  }
}

class Drinks extends StatefulWidget {
  @override
  DrinksState createState() {
    return new DrinksState();
  }
}

class DrinksState extends State<Drinks> {
  Widget _backImage() {
    return Image.asset(
      'images/Golf.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _backDrop() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _drinkMenu() {
    return new Container(
        child: ListView(
      children: <Widget>[
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Mixed Drinks',
            textAlign: TextAlign.start,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'Club2',
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Whiskey()),
                  );
                },
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: new Text(
                    'Whiskey\n\n\n\$12',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: new Text(
                    'Vodak\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.white),
                child: new Text(
                  'Rum\n\n\n\$10',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: new Text(
                    'Gin\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: new Text(
                    'Bourbon\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Beers(Bottled)',
            textAlign: TextAlign.start,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'Club2',
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.blue),
                child: new Text(
                  'Budwiser\n\n\n\$5',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: new Text(
                    'Bud Light\n\n\n\$5',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.blue),
                child: new Text(
                  'Labatt Blue\n\n\$5',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: new Text(
                    'Blue Light\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.blue),
                  child: new Text(
                    'Heineken\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Beers(Draft)',
            textAlign: TextAlign.start,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'Club2',
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: new Text(
                  'Coors\n\n\n\$5',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  child: new Text(
                    'Southern Tier\n\n\$5',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: new Text(
                  'Blue Moon\n\n\n\$5',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  child: new Text(
                    'Rusty Chain\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.lightGreen),
                  child: new Text(
                    'Guinness\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
          alignment: Alignment.centerLeft,
          child: Text(
            'Non Alcoholic',
            textAlign: TextAlign.start,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontFamily: 'Club2',
            ),
          ),
        ),
        new Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
          height: 100.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: new Text(
                  'Pepsi\n\n\n\$5',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.fromLTRB(2.0, 0.0, 0.0, 0.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child: new Text(
                    'Diet Pepsi\n\n\n\$5',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new Container(
                padding: EdgeInsets.only(left: 2.0),
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                child: new Text(
                  'Ginger Ale\n\n\n\$5',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Club2',
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child: new Text(
                    'Sierra Mist\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              new GestureDetector(
                child: new Container(
                  padding: EdgeInsets.only(left: 2.0),
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  child: new Text(
                    'Club Soda\n\n\n\$10',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'Club2',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        backgroundColor: Colors.white,
        body: new Material(
          color: Colors.white,
          child: new Stack(
//            fit: StackFit.expand,
            children: <Widget>[
              _backImage(),
              _backDrop(),
              _drinkMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<_Analytics> {
  Widget _backImage() {
    return Image.asset(
      'images/Golf.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _backDrop() {
    return Container(
      color: Colors.black.withOpacity(0.3),
      height: double.infinity,
      width: double.infinity,
    );
  }

  Widget _menu() {
    return ListView(
      padding: EdgeInsets.only(right: 10.0, left: 10.0),
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.white24,
            width: 5.0,
          ))),
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: new Text(
            '18 Holes Rounds: \n$eightRoundsPlayed',
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Club2',
            ),
          ),
        ),
        new Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Colors.white24,
            width: 5.0,
          ))),
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: new Text(
            '9 Holes Rounds: \n$nineRoundsPlayed',
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Club2',
            ),
          ),
        ),
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RoundsPerMonth()),
            );
          },
          child: new Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white24,
              width: 5.0,
            ))),
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Text(
              'Rounds Per Month',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Club2',
              ),
            ),
          ),
        ),
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MonthlyAnalyticsGraph()),
            );
          },
          child: new Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white24,
              width: 5.0,
            ))),
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Text(
              'Rounds Through Month',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Club2',
              ),
            ),
          ),
        ),
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeeklyAnalytics()),
            );
          },
          child: new Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
              color: Colors.white24,
              width: 5.0,
            ))),
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: new Text(
              'Weekly Data',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Club2',
              ),
            ),
          ),
        ),
        new Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.white24, width: 5.0))),
          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
          child: new Text(
            'Cart vs. Walking',
            textAlign: TextAlign.center,
            style: new TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Club2',
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Material(
        color: Colors.white,
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _backImage(),
            _backDrop(),
            _menu(),
          ],
        ),
      ),
    );
  }
}
