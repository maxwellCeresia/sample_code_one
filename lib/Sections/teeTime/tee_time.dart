import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int hour = 7;
int times = 0;
int minutes = 0;
String zeroMin = '00';
String whatTime = '7:00';
bool zero = false;
Color booked = Colors.white;
String current;
List<bool> book = [];
String dayMonth;
bool succeed = false;

class TeeTimes extends StatefulWidget {
  final String users;
  TeeTimes({this.users});
  @override
  _TeeTimesState createState() => _TeeTimesState();
}

class _TeeTimesState extends State<TeeTimes>
    with SingleTickerProviderStateMixin {
  TextEditingController firstNameController = new TextEditingController();
  int holes;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> dataList;
  FirebaseUser user;
  CollectionReference collectionReference;
  bool succeed = false;
  List<Widget> _samplePages = [];
  Color nine = Colors.black;
  Color prevColor = Colors.transparent;
  static int a = 0;
  DateTime selectedDate = DateTime.now();
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  var now = DateTime.now().toIso8601String();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        current = new DateFormat('EEEE').format(picked);
        dayMonth = new DateFormat('MMMMd').format(picked);
        a = picked.difference(DateTime.now()).inDays + 1;
        dayChange();
        print(a);
      });
  }

  void getData() async {
    print(dayMonth);
    collectionReference = Firestore.instance
        .collection("users")
        .document('John')
        .collection("Scores");
    subscription = collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        dataList = dataSnapshot.documents;
        succeed = true;
      });
    });
  }

  void dayChange() {
    setState(() {
      dayMonth =
          new DateFormat('MMMMd').format(DateTime.now().add(Duration(days: a)));
      current =
          new DateFormat('EEEE').format(DateTime.now().add(Duration(days: a)));
      if (dayMonth == new DateFormat('MMMMd').format(DateTime.now())) {
        setState(() {
          current = 'Today';
        });
      } else if (dayMonth ==
          new DateFormat('MMMMd')
              .format(DateTime.now().add(Duration(days: 1)))) {
        setState(() {
          current = "Tommorow";
        });
      } else {
        setState(() {
          current = new DateFormat('EEEE')
              .format(DateTime.now().add(Duration(days: a)));
        });
      }
    });
    if (current == 'Today') {
      setState(() {
        prevColor = Colors.transparent;
      });
    } else if (current != 'Today') {
      setState(() {
        prevColor = Colors.black;
      });
    }
    getData();
  }

  @override
  void initState() {
    print(widget.users);
    dayChange();
    getData();
    print(dayMonth);
    setState(() {
      _samplePages = [
        BookedTime(
          users: widget.users,
        ),
        BookedTime(
          users: widget.users,
        ),
        BookedTime(
          users: widget.users,
        ),
        BookedTime(
          users: widget.users,
        ),
        BookedTime(
          users: widget.users,
        ),
        BookedTime(
          users: widget.users,
        ),
        BookedTime(
          users: widget.users,
        ),
      ];
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.lightBlueAccent,
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    '< Prev',
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: prevColor,
                    ),
                  ),
                  onPressed: () {
                    if (prevColor == Colors.black) {
                      _controller.previousPage(
                          duration: _kDuration, curve: _kCurve);
                      setState(() {
                        if (current != 'Today') {
                          a = a - 1;
                        }
                        dayChange();
                      });
                    } else if (prevColor == Colors.transparent) {}
                  },
                ),
                new GestureDetector(
                  onTap: () => _selectDate(context),
                  child: new Container(
                    height: 60.0,
                    width: 140.0,
                    alignment: Alignment.center,
                    child: new RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(text: '$current\n'),
                          new TextSpan(
                              text: '$dayMonth',
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Next >',
                    style: new TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  onPressed: () {
                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                    setState(() {
                      a = a + 1;
                      dayChange();
                    });
                  },
                ),
              ],
            ),
          ),
          Flexible(
            child: PageView.builder(
              controller: _controller,
              itemCount: _samplePages.length,
              itemBuilder: (BuildContext context, int index) {
                return _samplePages[index % _samplePages.length];
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyDialog extends StatefulWidget {
  final String users;
  MyDialog({this.users});
  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  TextEditingController player1 = new TextEditingController();
  TextEditingController player2 = new TextEditingController();
  TextEditingController player3 = new TextEditingController();
  TextEditingController player4 = new TextEditingController();
  String cart1;
  String cart2;
  String cart3;
  String cart4;
  StreamSubscription<QuerySnapshot> subscription;
  StreamSubscription<QuerySnapshot> userListSubscription;
  List<DocumentSnapshot> dataList;
  List<DocumentSnapshot> userList;
  CollectionReference collectionReference;
  int numHole;
  int holes = 9;
  int players = 1;
  bool scrollView = false;
  Color nine;
  Color eighteen;
  Color playerOne;
  Color playerTwo;
  Color playerThree;
  Color playerFour;

  void getData() async {
    subscription = collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        dataList = dataSnapshot.documents;
        succeed = true;
        numHole = dataList[0].data['numHoles'];
      });
    });
    userListSubscription =
        collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        userList = dataSnapshot.documents;
        userList[0].data.addAll({'booked': true});
        succeed = true;
      });
    });
  }

  void _cartAction() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CartPicking();
        });
  }

  void playerUpdate() {
    if (players == 1) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player1': '${widget.users}'});
    } else if (players == 2) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player1': player1.text, 'player2': player2.text});
    } else if (players == 3) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({
        'player1': player1.text,
        'player2': player2.text,
        'player3': player3.text
      });
    } else if (players == 4) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({
        'player1': player1.text,
        'player2': player2.text,
        'player3': player3.text,
        'player4': player4.text
      });
    }
  }

  Widget onePLayer() {
    return new Builder(builder: (BuildContext context) {
      return new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            child: new TextFormField(
                          controller: player1,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                              color: Colors.black, fontSize: 20.0),
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Player 1',
                            hintStyle: new TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.black,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget twoPLayers() {
    return new Builder(builder: (BuildContext context) {
      return new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            child: new TextFormField(
                          controller: player1,
                          keyboardType: TextInputType.text,
                          style: new TextStyle(
                              color: Colors.black, fontSize: 20.0),
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Player 1',
                            hintStyle: new TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.black,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ))),
                  ),
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player2,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 2',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget threePLayers() {
    return new Builder(builder: (BuildContext context) {
      return new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: '${widget.users}',
                                hintStyle: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player2,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 2',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player3,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 3',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget fourPLayers() {
    return new Builder(builder: (BuildContext context) {
      return new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player1,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 1',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player2,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 2',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player3,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 3',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                  new Theme(
                    data: ThemeData(
                      hintColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(color: Colors.black)),
                    ),
                    child: new Material(
                        borderRadius: BorderRadius.circular(30.0),
                        elevation: 1.0,
                        child: Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: new TextFormField(
                              controller: player4,
                              keyboardType: TextInputType.text,
                              style: new TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: 'Player 4',
                                hintStyle: new TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.black,
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget playerSelect;
  void changeHoleAndPlayerNumber() {
    if (holes == 9) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'numHoles': 9});
      setState(() {
        nine = Colors.red[900];
        eighteen = Colors.grey;
      });
    } else if (holes == 18) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'numHoles': 18});
      setState(() {
        nine = Colors.grey;
        eighteen = Colors.red[900];
      });
    }
    if (players == 1) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'numPlayers': 1});
      setState(() {
        playerOne = Colors.red[900];
        playerTwo = Colors.grey;
        playerThree = Colors.grey;
        playerFour = Colors.grey;
        playerSelect = onePLayer();
      });
    } else if (players == 2) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'numPlayers': 2});
      setState(() {
        playerOne = Colors.grey;
        playerTwo = Colors.red[900];
        playerThree = Colors.grey;
        playerFour = Colors.grey;
        playerSelect = twoPLayers();
      });
    } else if (players == 3) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'numPlayers': 3});
      setState(() {
        playerOne = Colors.grey;
        playerTwo = Colors.grey;
        playerThree = Colors.red[900];
        playerFour = Colors.grey;
        playerSelect = threePLayers();
        scrollView = true;
      });
    } else if (players == 4) {
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'numPlayers': 4});
      setState(() {
        playerOne = Colors.grey;
        playerTwo = Colors.grey;
        playerThree = Colors.grey;
        playerFour = Colors.red[900];
        playerSelect = fourPLayers();
        scrollView = true;
      });
    }
  }

  @override
  void initState() {
    changeHoleAndPlayerNumber();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    userListSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(
        'Tee Time for $current, $dayMonth\nat $hour:${zero ? zeroMin : minutes}',
        textAlign: TextAlign.center,
      ),
      content: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
          ),
          child: new SingleChildScrollView(
            reverse: scrollView,
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                  'Number of Holes: ',
                  style: new TextStyle(color: Colors.black),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                      shape: CircleBorder(),
                      color: nine,
                      child: new Text(
                        '9',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          holes = 9;
                          changeHoleAndPlayerNumber();
                        });
                      },
                    ),
                    new RaisedButton(
                      shape: CircleBorder(),
                      color: eighteen,
                      child: new Text(
                        '18',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          holes = 18;
                          changeHoleAndPlayerNumber();
                        });
                      },
                    ),
                  ],
                ),
                new Text(
                  'Number of Players: ',
                  style: new TextStyle(color: Colors.black),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new MaterialButton(
                      color: playerOne,
                      child: new Text(
                        '1',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          players = 1;
                          changeHoleAndPlayerNumber();
                        });
                      },
                    ),
                    new RaisedButton(
                      color: playerTwo,
                      child: new Text(
                        '2',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          players = 2;
                          changeHoleAndPlayerNumber();
                        });
                      },
                    ),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new RaisedButton(
                      color: playerThree,
                      child: new Text(
                        '3',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          players = 3;
                          changeHoleAndPlayerNumber();
                        });
                      },
                    ),
                    new RaisedButton(
                      color: playerFour,
                      child: new Text(
                        '4',
                        style: new TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          players = 4;
                          changeHoleAndPlayerNumber();
                        });
                      },
                    ),
                  ],
                ),
                playerSelect,
              ],
            ),
          )),
      actions: <Widget>[
        new Container(
          width: 300.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new ButtonTheme(
                minWidth: 100.0,
                child: new RaisedButton(
                  color: Colors.red[900],
                  child: new Text(
                    'Cancel',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                ),
              ),
              new ButtonTheme(
                minWidth: 100.0,
                child: new RaisedButton(
                  color: Colors.red[900],
                  child: new Text(
                    'Continue',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    _cartAction();
                    playerUpdate();
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BookedTime extends StatefulWidget {
  final String users;
  BookedTime({this.users});
  @override
  BookedTimeState createState() {
    return new BookedTimeState();
  }
}

class BookedTimeState extends State<BookedTime> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> dataList;
  FirebaseUser user;
  CollectionReference collectionReference;
  bool succeed = false;
  int numHoles;
  List<bool> timeBooked = [];
  @override
  void initState() {
    timeBooked.length = 100;
    for (var i = 0; i < timeBooked.length; i++) {
      timeBooked[i] = false;
    }
    getDataBookedTime();
    super.initState();
  }

  void _bookIt() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(
            users: widget.users,
          );
        });
  }

  void getDataBookedTime() async {
    collectionReference = Firestore.instance.collection(dayMonth);
    subscription = collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        dataList = dataSnapshot.documents;
        succeed = true;
        numHoles = dataList[0].data['numHoles'];
        for (var i = 0; i < dataList.length; i++) {
          setState(() {
            timeBooked[i] = dataList[i].data['booked'];
          });
        }
      });
    });
  }

  Widget time() {
    return new ListView(
      padding: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
      children: <Widget>[
        new Container(
          color: timeBooked[0] ? Colors.green.withOpacity(0.5) : Colors.white,
          child: new ListTile(
            onTap: () {
              if (timeBooked[0] == false) {
                _bookIt();
                setState(() {
                  zero = true;
                  whatTime = '7:00 am';
                  hour = 7;
                  times = 0;
                  Firestore.instance
                      .collection(dayMonth)
                      .document('${dataList[times]}')
                      .updateData({'numCharts': 0});
                });
              } else if (timeBooked[0] == true) {}
            },
            dense: true,
            leading: timeBooked[0]
                ? new Text(
                    'Carts: \n${dataList[0].data['numCarts']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
            title: new Text(
              '7:00 am',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              '${timeBooked[0] ? 'Number of Players: ${dataList[0].data['numPlayers']}' : 'Transit Valley Country Club'}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: timeBooked[0] ? Colors.black : Colors.grey,
                  fontSize: timeBooked[0] ? 18.0 : 15.0),
            ),
            trailing: timeBooked[0]
                ? new Text(
                    'Holes: \n${dataList[0].data['numHoles']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.0,
        ),
        new Container(
          color: timeBooked[1] ? Colors.green.withOpacity(0.5) : Colors.white,
          child: new ListTile(
            dense: true,
            onTap: () {
              if (timeBooked[1] == false) {
                _bookIt();
                setState(() {
                  zero = true;
                  whatTime = '7:10 am';
                  times = 1;
                  hour = 7;
                  Firestore.instance
                      .collection(dayMonth)
                      .document('${dataList[times]}')
                      .updateData({'numCarts': 0});
                });
              } else if (timeBooked[1] == true) {}
            },
            leading: timeBooked[1]
                ? new Text(
                    'Carts: \n${dataList[1].data['numCarts']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
            title: new Text(
              '7:10 am',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              '${timeBooked[1] ? 'Number of Players: ${dataList[1].data['numPlayers']}' : 'Transit Valley Country Club'}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: timeBooked[1] ? Colors.black : Colors.grey,
                  fontSize: timeBooked[1] ? 18.0 : 15.0),
            ),
            trailing: timeBooked[1]
                ? new Text(
                    'Holes: \n${dataList[1].data['numHoles']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.0,
        ),
        new Container(
          color: timeBooked[2] ? Colors.green.withOpacity(0.5) : Colors.white,
          child: new ListTile(
            dense: true,
            onTap: () {
              if (timeBooked[2] == false) {
                _bookIt();
                setState(() {
                  zero = true;
                  times = 2;
                  whatTime = '7:20 am';
                  hour = 7;
                  Firestore.instance
                      .collection(dayMonth)
                      .document('${dataList[times]}')
                      .updateData({'numCharts': 0});
                });
              } else if (timeBooked[2] == true) {}
            },
            leading: timeBooked[2]
                ? new Text(
                    'Carts: \n${dataList[2].data['numCarts']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
            title: new Text(
              '7:20 am',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              '${timeBooked[2] ? 'Number of Players: ${dataList[2].data['numPlayers']}' : 'Transit Valley Country Club'}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: timeBooked[2] ? Colors.black : Colors.grey,
                  fontSize: timeBooked[2] ? 18.0 : 15.0),
            ),
            trailing: timeBooked[2]
                ? new Text(
                    'Holes: \n${dataList[2].data['numHoles']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.0,
        ),
        new Container(
          color: timeBooked[3] ? Colors.green.withOpacity(0.5) : Colors.white,
          child: new ListTile(
            dense: true,
            onTap: () {
              if (timeBooked[3] == false) {
                _bookIt();
                setState(() {
                  zero = true;
                  times = 3;
                  whatTime = '7:30 am';
                  hour = 7;
                  Firestore.instance
                      .collection(dayMonth)
                      .document('${dataList[times]}')
                      .updateData({'numCharts': 0});
                });
              } else if (timeBooked[3] == true) {}
            },
            leading: timeBooked[3]
                ? new Text(
                    'Carts: \n${dataList[3].data['numCarts']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
            title: new Text(
              '7:30 am',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              '${timeBooked[3] ? 'Number of Players: ${dataList[3].data['numPlayers']}' : 'Transit Valley Country Club'}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: timeBooked[3] ? Colors.black : Colors.grey,
                  fontSize: timeBooked[3] ? 18.0 : 15.0),
            ),
            trailing: timeBooked[3]
                ? new Text(
                    'Holes: \n${dataList[3].data['numHoles']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.0,
        ),
        new Container(
          color: timeBooked[4] ? Colors.green.withOpacity(0.5) : Colors.white,
          child: new ListTile(
            dense: true,
            onTap: () {
              if (timeBooked[4] == false) {
                _bookIt();
                setState(() {
                  times = 4;
                  zero = true;
                  whatTime = '7:40 am';
                  hour = 7;
                  Firestore.instance
                      .collection(dayMonth)
                      .document('${dataList[times]}')
                      .updateData({'numCharts': 0});
                });
              } else if (timeBooked[4] == true) {}
            },
            leading: timeBooked[4]
                ? new Text(
                    'Carts: \n${dataList[4].data['numCarts']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
            title: new Text(
              '7:40 am',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              '${timeBooked[4] ? 'Number of Players: ${dataList[4].data['numPlayers']}' : 'Transit Valley Country Club'}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: timeBooked[4] ? Colors.black : Colors.grey,
                  fontSize: timeBooked[4] ? 18.0 : 15.0),
            ),
            trailing: timeBooked[4]
                ? new Text(
                    'Holes: \n${dataList[4].data['numHoles']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
        ),
        Divider(
          color: Colors.black,
          height: 0.0,
        ),
        new Container(
          color: timeBooked[5] ? Colors.green.withOpacity(0.5) : Colors.white,
          child: new ListTile(
            dense: true,
            onTap: () {
              if (timeBooked[5] == false) {
                _bookIt();
                setState(() {
                  zero = true;
                  times = 5;
                  whatTime = '7:50 am';
                  hour = 7;
                  Firestore.instance
                      .collection(dayMonth)
                      .document('${dataList[times]}')
                      .updateData({'numCharts': 0});
                });
              } else if (timeBooked[5] == true) {}
            },
            leading: timeBooked[5]
                ? new Text(
                    'Carts: \n${dataList[5].data['numCarts']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
            title: new Text(
              '7:50 am',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: new Text(
              '${timeBooked[5] ? 'Number of Players: ${dataList[5].data['numPlayers']}' : 'Transit Valley Country Club'}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: timeBooked[5] ? Colors.black : Colors.grey,
                  fontSize: timeBooked[5] ? 18.0 : 15.0),
            ),
            trailing: timeBooked[5]
                ? new Text(
                    'Holes: \n${dataList[5].data['numHoles']}',
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return time();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

class CartPicking extends StatefulWidget {
  @override
  _CartPickingState createState() => _CartPickingState();
}

class _CartPickingState extends State<CartPicking> {
  StreamSubscription<DocumentSnapshot> subscription;
  StreamSubscription<QuerySnapshot> userListSubscription;
  List<DocumentSnapshot> dataList;
  List<DocumentSnapshot> userList;
  FirebaseUser user;
  DocumentReference document;
  CollectionReference collectionReference;
  int numPlayers;
  String player1;
  String player2;
  String player3;
  String player4;
  int cartPicked1 = 1;
  int cartPicked2 = 1;
  int cartPicked3 = 1;
  int cartPicked4 = 1;
  Color cart = Colors.red[900];
  Color walk = Colors.grey;
  Color cart2 = Colors.red[900];
  Color walk2 = Colors.grey;
  Color cart3 = Colors.red[900];
  Color walk3 = Colors.grey;
  Color cart4 = Colors.red[900];
  Color walk4 = Colors.grey;
  int cartsPicked = 0;
  @override
  void initState() {
    getDataLists();
    cartOrWalking();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    userListSubscription?.cancel();
    super.dispose();
  }

  void getDataLists() async {
    document =
        Firestore.instance.collection(dayMonth).document('${dataList[times]}');
    subscription = document.snapshots().listen((dataSnapshot) {
      setState(() {
        numPlayers = dataSnapshot.data['numPlayers'];
        player1 = dataSnapshot.data['player1'];
        player2 = dataSnapshot.data['player2'];
        player3 = dataSnapshot.data['player3'];
        player4 = dataSnapshot.data['player4'];
        succeed = true;
        print(numPlayers);
      });
    });
    userListSubscription =
        collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        userList = dataSnapshot.documents;
        succeed = true;
        dataSnapshot.documents[0].data.addAll({'booked': true});
      });
    });
  }

  void cartOrWalking() {
    if (cartPicked1 == 1) {
      setState(() {
        walk = Colors.grey;
        cart = Colors.red[900];
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player1CW': 'Cart'});
    } else if (cartPicked1 == 0) {
      setState(() {
        cart = Colors.grey;
        walk = Colors.red[900];
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player1CW': 'Walking'});
    }
    if (cartPicked2 == 1) {
      setState(() {
        walk2 = Colors.grey;
        cart2 = Colors.red[900];
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player2CW': 'Cart'});
    } else if (cartPicked2 == 0) {
      setState(() {
        walk2 = Colors.red[900];
        cart2 = Colors.grey;
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player2CW': 'Walking'});
    }
    if (cartPicked3 == 1) {
      setState(() {
        walk3 = Colors.grey;
        cart3 = Colors.red[900];
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player3CW': 'Cart'});
    } else if (cartPicked3 == 0) {
      setState(() {
        cart3 = Colors.grey;
        walk3 = Colors.red[900];
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player3CW': 'Walking'});
    }
    if (cartPicked4 == 1) {
      setState(() {
        walk4 = Colors.grey;
        cart4 = Colors.red[900];
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player4CW': 'Cart'});
    } else if (cartPicked4 == 0) {
      setState(() {
        walk4 = Colors.red[900];
        cart4 = Colors.grey;
      });
      Firestore.instance
          .collection(dayMonth)
          .document('${dataList[times]}')
          .updateData({'player4CW': 'Walking'});
    }
  }

  Widget cartData() {
    Widget theFinal;
    if (numPlayers == 1) {
      setState(() {
        cartPicked2 = 0;
        cartPicked3 = 0;
        cartPicked4 = 0;
        cartsPicked = cartPicked1 + cartPicked2 + cartPicked3 + cartPicked4;
      });
      setState(() {
        theFinal = new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                '$player1:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            )
          ],
        );
      });
    } else if (numPlayers == 2) {
      setState(() {
        cartPicked3 = 0;
        cartPicked4 = 0;
        cartsPicked = cartPicked1 + cartPicked2 + cartPicked3 + cartPicked4;
      });
      setState(() {
        theFinal = new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                '$player1:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
            new Container(
              child: new Text(
                '$player2:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart2,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked2 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk2,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked2 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
          ],
        );
      });
    } else if (numPlayers == 3) {
      setState(() {
        cartPicked4 = 0;
        cartsPicked = cartPicked1 + cartPicked2 + cartPicked3 + cartPicked4;
      });
      setState(() {
        theFinal = new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                '$player1:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
            new Container(
              child: new Text(
                '$player2:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart2,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked2 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk2,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked2 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
            new Container(
              child: new Text(
                '$player3:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart3,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked3 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk3,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked3 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
          ],
        );
      });
      setState(() {
        cartsPicked = cartPicked1 + cartPicked2 + cartPicked3 + cartPicked4;
      });
    } else if (numPlayers == 4) {
      print('LASLDADSKDK');
      setState(() {
        theFinal = new Column(
          children: <Widget>[
            new Container(
              child: new Text(
                '$player1:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked1 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
            new Container(
              child: new Text(
                '$player2:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart2,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked2 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk2,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked2 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
            new Container(
              child: new Text(
                '$player3:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart3,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked3 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk3,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked3 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
            new Container(
              child: new Text(
                '$player4:',
                style: new TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new RaisedButton(
                  color: cart4,
                  child: new Text(
                    'Cart',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked4 = 1;
                    });
                    cartOrWalking();
                  },
                ),
                new RaisedButton(
                  color: walk4,
                  child: new Text(
                    'Walking',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      cartPicked4 = 0;
                    });
                    cartOrWalking();
                  },
                ),
              ],
            ),
          ],
        );
      });
      setState(() {
        cartsPicked = cartPicked1 + cartPicked2 + cartPicked3 + cartPicked4;
      });
    }
    updateCart();
    return theFinal;
  }

  void updateCart() {
    print(cartsPicked);
    Firestore.instance
        .collection(dayMonth)
        .document('${dataList[times]}')
        .updateData({'numCarts': cartsPicked});
  }

  void goBack() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: new Theme(
          data: ThemeData(canvasColor: Colors.white),
          child: new SingleChildScrollView(
            child: cartData(),
          )),
      actions: <Widget>[
        new Container(
          width: 300.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new ButtonTheme(
                minWidth: 100.0,
                child: new RaisedButton(
                  color: Colors.red[900],
                  child: new Text(
                    'Go Back',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    goBack();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ),
              new ButtonTheme(
                minWidth: 100.0,
                child: new RaisedButton(
                  color: Colors.red[900],
                  child: new Text(
                    'Reserve',
                    style: new TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context, rootNavigator: true).pop();
                    Firestore.instance
                        .collection(dayMonth)
                        .document('${dataList[times]}')
                        .updateData({'booked': true});
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
