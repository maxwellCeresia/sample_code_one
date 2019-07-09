import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'hole_stats.dart';
import 'dart:async';

class HandicapScores extends StatefulWidget {
  final String user;
  HandicapScores({this.user});
  @override
  _HandicapScoresState createState() => _HandicapScoresState();
}

class _HandicapScoresState extends State<HandicapScores> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> dataList;
  CollectionReference collectionReference;
  bool succeed = false;
  bool darkLight = false;
  var dayMonth = new DateFormat('yMd').format(DateTime.now());
  bool five = true;
  bool zero = true;
  double handicap;
  int initialValue = 0;
  List<int> score = [];
  List hole1 = [];
  List hole2 = [];
  List hole3 = [];
  List hole4 = [];
  List hole5 = [];
  List hole6 = [];
  List hole7 = [];
  List hole8 = [];
  List hole9 = [];
  List hole10 = [];
  List hole11 = [];
  List hole12 = [];
  List hole13 = [];
  List hole14 = [];
  List hole15 = [];
  List hole16 = [];
  List hole17 = [];
  List hole18 = [];
  List date = [];
  List<int> rounds = [90, 90];

  @override
  void initState() {
    handicapDataLists();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void handicapDataLists() async {
    collectionReference = Firestore.instance
        .collection("users")
        .document(widget.user)
        .collection("Scores");
    subscription = collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        dataList = dataSnapshot.documents;
        succeed = true;
      });
    });
  }

  Widget holeButton() {
    Widget button;
    if (zero == false) {
      button = new RaisedButton(
        color: darkLight ? Colors.white : Colors.black,
        child: new Text(
          'Stats per Hole',
          style: new TextStyle(color: darkLight ? Colors.black : Colors.white),
        ),
        onPressed: () {
          if (zero == true) {
          } else if (zero == false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HoleStats(user: widget.user)),
            );
          }
        },
      );
    } else if (zero == true) {
      button = new Container(
        color: Colors.white,
      );
    }
    return button;
  }

  Widget test() {
    List<String> dates = [];
    succeed ? hole1 = dataList[0].data['1'] : hole1 = [1];
    succeed ? hole2 = dataList[0].data['2'] : hole1 = [90];
    succeed ? hole3 = dataList[0].data['3'] : hole1 = [90];
    succeed ? hole4 = dataList[0].data['4'] : hole1 = [90];
    succeed ? hole5 = dataList[0].data['5'] : hole1 = [1];
    succeed ? hole6 = dataList[0].data['6'] : hole1 = [90];
    succeed ? hole7 = dataList[0].data['7'] : hole1 = [90];
    succeed ? hole8 = dataList[0].data['8'] : hole1 = [90];
    succeed ? hole9 = dataList[0].data['9'] : hole1 = [90];
    succeed ? hole10 = dataList[0].data['10'] : hole1 = [1];
    succeed ? hole11 = dataList[0].data['11'] : hole1 = [90];
    succeed ? hole12 = dataList[0].data['12'] : hole1 = [90];
    succeed ? hole13 = dataList[0].data['13'] : hole1 = [90];
    succeed ? hole14 = dataList[0].data['14'] : hole1 = [1];
    succeed ? hole15 = dataList[0].data['15'] : hole1 = [90];
    succeed ? hole16 = dataList[0].data['16'] : hole1 = [90];
    succeed ? hole17 = dataList[0].data['17'] : hole1 = [90];
    succeed ? hole18 = dataList[0].data['18'] : hole1 = [90];
    succeed ? date = dataList[0].data['Date'] : date = ['YPPPP'];
    if (hole18.isNotEmpty && hole1.isNotEmpty) {
      setState(() {
        score.length = hole1.length;
        dates.length = hole1.length;
      });
      for (var i = 0; i < hole1.length; i++) {
        setState(() {
          score[i] = hole1[i] +
              hole2[i] +
              hole3[i] +
              hole4[i] +
              hole5[i] +
              hole6[i] +
              hole7[i] +
              hole8[i] +
              hole9[i] +
              hole10[i] +
              hole11[i] +
              hole12[i] +
              hole13[i] +
              hole14[i] +
              hole15[i] +
              hole16[i] +
              hole17[i] +
              hole18[i];
          dates[i] = date[i];
        });
      }
    }

    Firestore.instance
        .collection('users')
        .document(widget.user)
        .updateData({'bestScore': score.reduce(min)});

    if (score.length > 0) {
      setState(() {
        zero = false;
      });
    }
    if (score.length > 4) {
      setState(() {
        five = false;
      });
    }
    var sum2 =
        (score.fold(initialValue, (curr, next) => curr + next)) / score.length;
    handicap = ((sum2 - 73.1) * 113) / 130;

    return new Scaffold(
      backgroundColor: darkLight ? Colors.black : Colors.white,
      body: new Center(
        child: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 20.0),
              child: new Text(
                '${five ? 'You need to have at least five scores\nto calculate your handicap' : 'Handicap:\n${handicap.round()}'}',
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: five ? 20.0 : 30.0,
                    color: darkLight ? Colors.white : Colors.black),
              ),
            ),
            new Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20.0, left: 5.0, right: 5.0),
              child: SingleChildScrollView(
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new ListTile(
                      dense: true,
                      leading: new Text(
                        'Round Date',
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: darkLight ? Colors.white : Colors.black),
                      ),
                      trailing: new Text(
                        'Score',
                        style: new TextStyle(
                            fontSize: 25.0,
                            color: darkLight ? Colors.white : Colors.black),
                      ),
                    ),
                    Divider(
                      color: darkLight ? Colors.white : Colors.black,
                      height: 0.0,
                    ),
                    new Container(
                      height: 400.0,
                      child: new ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return new ListTile(
                            title: new Text(
                              '${zero ? '' : dates[index]}',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color:
                                      darkLight ? Colors.white : Colors.black),
                            ),
                            trailing: new Text(
                              '${zero ? '' : score[index]}',
                              style: new TextStyle(
                                  fontSize: 18.0,
                                  color:
                                      darkLight ? Colors.white : Colors.black),
                            ),
                          );
                        },
                        itemCount: score.length,
                      ),
                    ),
                    new Container(
                        height: 80.0,
                        width: double.infinity,
                        child: new Text(
                          '${zero ? '' : 'Your Best Score:\n${score.reduce(min)}'}',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              fontSize: 30.0,
                              color: darkLight ? Colors.white : Colors.black),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return test();
  }
}
