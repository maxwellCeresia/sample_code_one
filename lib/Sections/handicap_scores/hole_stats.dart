import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HoleStats extends StatefulWidget {
  final String user;
  HoleStats({this.user});
  @override
  _HoleStatsState createState() => _HoleStatsState();
}

class _HoleStatsState extends State<HoleStats> {
  ScrollController _scrollController = new ScrollController();
  StreamSubscription<QuerySnapshot> subscription;
  StreamSubscription<DocumentSnapshot> userListSubscription;
  List<DocumentSnapshot> dataList;
  CollectionReference collectionReference;
  Stream<DocumentSnapshot> userReference;
  bool succeed = false;
  int initialValue = 0;
  bool male = false;
  var bestHole = 0;
  var worstHole = 0;
  double hole1Avg = 0;
  double hole2Avg;
  double hole3Avg;
  double hole4Avg;
  double hole5Avg;
  double hole6Avg;
  double hole7Avg;
  double hole8Avg;
  double hole9Avg;
  double hole10Avg;
  double hole11Avg;
  double hole12Avg;
  double hole13Avg;
  double hole14Avg;
  double hole15Avg;
  double hole16Avg;
  double hole17Avg;
  double hole18Avg;
  bool darkMode = false;
  List<int> pars = [];
  List allHole = [];
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
  List<int> value = [];
  @override
  void initState() {
    getLists();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    userListSubscription?.cancel();
    super.dispose();
  }

  void getLists() async {
    collectionReference = Firestore.instance
        .collection("users")
        .document(widget.user)
        .collection("Scores");
    userReference = Firestore.instance
        .collection("users")
        .document(widget.user)
        .snapshots();

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        dataList = datasnapshot.documents;
        succeed = true;
      });
    });
    userListSubscription = userReference.listen((datasnapshot) {
      setState(() {
        male = datasnapshot.data['male'];
      });
    });
  }

  void plusMinus() {
    setState(() {
      value[0] = allHole[0] - pars[0];
      value[1] = allHole[1] - pars[1];
      value[2] = allHole[2] - pars[2];
      value[3] = allHole[3] - pars[3];
      value[4] = allHole[4] - pars[4];
      value[5] = allHole[5] - pars[5];
      value[6] = allHole[6] - pars[6];
      value[7] = allHole[7] - pars[7];
      value[8] = allHole[8] - pars[8];
      value[9] = allHole[9] - pars[9];
      value[10] = allHole[10] - pars[10];
      value[11] = allHole[11] - pars[11];
      value[12] = allHole[12] - pars[12];
      value[13] = allHole[13] - pars[13];
      value[14] = allHole[14] - pars[14];
      value[15] = allHole[15] - pars[15];
      value[16] = allHole[16] - pars[16];
      value[17] = allHole[17] - pars[17];
    });
  }

  Widget holeStat() {
    int holeEleven = male ? 4 : 5;
    setState(() {
      pars = [4, 4, 5, 3, 4, 5, 4, 4, 3, 5, holeEleven, 3, 4, 4, 4, 4, 3, 4];
    });
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
    if (hole18.isNotEmpty && hole1.isNotEmpty) {
      setState(() {
        allHole.length = 18;
        value.length = 18;
        hole1Avg = (hole1.fold(initialValue, (curr, next) => curr + next)) /
            hole1.length;
        hole2Avg = (hole2.fold(initialValue, (curr, next) => curr + next)) /
            hole2.length;
        hole3Avg = (hole3.fold(initialValue, (curr, next) => curr + next)) /
            hole3.length;
        hole4Avg = (hole4.fold(initialValue, (curr, next) => curr + next)) /
            hole4.length;
        hole5Avg = (hole5.fold(initialValue, (curr, next) => curr + next)) /
            hole5.length;
        hole6Avg = (hole6.fold(initialValue, (curr, next) => curr + next)) /
            hole6.length;
        hole7Avg = (hole7.fold(initialValue, (curr, next) => curr + next)) /
            hole7.length;
        hole8Avg = (hole8.fold(initialValue, (curr, next) => curr + next)) /
            hole8.length;
        hole9Avg = (hole9.fold(initialValue, (curr, next) => curr + next)) /
            hole9.length;
        hole10Avg = (hole10.fold(initialValue, (curr, next) => curr + next)) /
            hole10.length;
        hole11Avg = (hole11.fold(initialValue, (curr, next) => curr + next)) /
            hole11.length;
        hole12Avg = (hole12.fold(initialValue, (curr, next) => curr + next)) /
            hole12.length;
        hole13Avg = (hole13.fold(initialValue, (curr, next) => curr + next)) /
            hole13.length;
        hole14Avg = (hole14.fold(initialValue, (curr, next) => curr + next)) /
            hole14.length;
        hole15Avg = (hole15.fold(initialValue, (curr, next) => curr + next)) /
            hole15.length;
        hole16Avg = (hole16.fold(initialValue, (curr, next) => curr + next)) /
            hole16.length;
        hole17Avg = (hole17.fold(initialValue, (curr, next) => curr + next)) /
            hole17.length;
        hole18Avg = (hole18.fold(initialValue, (curr, next) => curr + next)) /
            hole18.length;
        allHole[0] = hole1Avg.round();
        allHole[1] = hole2Avg.round();
        allHole[2] = hole3Avg.round();
        allHole[3] = hole4Avg.round();
        allHole[4] = hole5Avg.round();
        allHole[5] = hole6Avg.round();
        allHole[6] = hole7Avg.round();
        allHole[7] = hole8Avg.round();
        allHole[8] = hole9Avg.round();
        allHole[9] = hole10Avg.round();
        allHole[10] = hole11Avg.round();
        allHole[11] = hole12Avg.round();
        allHole[12] = hole13Avg.round();
        allHole[13] = hole14Avg.round();
        allHole[14] = hole15Avg.round();
        allHole[15] = hole16Avg.round();
        allHole[16] = hole17Avg.round();
        allHole[17] = hole18Avg.round();
        plusMinus();
        print(value);
        print(value.reduce(min));
      });
    }
    return new Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      body: new Center(
        child: new ListView(
          padding: EdgeInsets.only(right: 5.0, left: 5.0),
          children: <Widget>[
            new ListTile(
              contentPadding: EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
              dense: true,
              leading: new Text(
                'Hole #',
                style: new TextStyle(
                    fontSize: 25.0,
                    color: darkMode ? Colors.white : Colors.black),
              ),
              trailing: new Text(
                'Average Score',
                style: new TextStyle(
                    fontSize: 25.0,
                    color: darkMode ? Colors.white : Colors.black),
              ),
            ),
            Divider(
              color: darkMode ? Colors.white : Colors.black,
              height: 0.0,
            ),
            new Container(
              child: new ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return new ListTile(
                    leading: new Text(
                      '${index + 1}',
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    subtitle: new Text(
                      'Avg. Over/Under: ${value[index]}',
                      style: new TextStyle(
                          fontSize: 14.0,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    title: new Text(
                      'Par ${pars[index]}',
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                    trailing: new Text(
                      '${allHole[index]}',
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: darkMode ? Colors.white : Colors.black),
                    ),
                  );
                },
                itemCount: allHole.length,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return holeStat();
  }
}
