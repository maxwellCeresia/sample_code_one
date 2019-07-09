import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseRecords extends StatefulWidget {
  @override
  _CourseRecordsState createState() => _CourseRecordsState();
}

class _CourseRecordsState extends State<CourseRecords> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> dataList;
  Query collectionReference;
  bool succeed = false;
  List menBestFName = [];
  List menBestLName = [];
  List menBestScore = [];
  int holder;
  int secondPlaceMen = 2;
  int thirdPlaceMen = 3;
  String firstMen = 'name';
  String secondMen = 'name';
  String thirdMen = 'name';

  @override
  void initState() {
    getDataList();
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void getDataList() async {
    collectionReference = Firestore.instance
        .collection("users")
        .orderBy("bestScore", descending: false);

    subscription = collectionReference.snapshots().listen((dataSnapshot) {
      setState(() {
        dataList = dataSnapshot.documents;
        succeed = true;
      });
    });
  }

  Widget seasonMen() {
    menBestScore.length = 3;
    menBestFName.length = 3;
    menBestLName.length = 3;
    setState(() {
      succeed ? holder = dataList.length : holder = null;
    });

    if (holder != null) {
      menBestFName[0] = dataList[0].data['firstName'];
      menBestFName[1] = dataList[1].data['firstName'];
      menBestFName[2] = dataList[2].data['firstName'];

      menBestLName[0] = dataList[0].data['lastName'];
      menBestLName[1] = dataList[1].data['lastName'];
      menBestLName[2] = dataList[2].data['lastName'];

      menBestScore[0] = dataList[0].data['bestScore'];
      menBestScore[1] = dataList[1].data['bestScore'];
      menBestScore[2] = dataList[2].data['bestScore'];
      if (menBestScore[0] != menBestScore[1] &&
          menBestScore[1] != menBestScore[2]) {
        secondPlaceMen = 2;
        thirdPlaceMen = 3;
      }
      if (menBestScore[0] == menBestScore[1]) {
        secondPlaceMen = 1;
      }
      if (menBestScore[0] == menBestScore[1] &&
          menBestScore[2] == menBestScore[0]) {
        secondPlaceMen = 1;
        thirdPlaceMen = 1;
      }
      if (menBestScore[1] == menBestScore[2] &&
          menBestScore[0] != menBestScore[1]) {
        secondPlaceMen = 2;
        thirdPlaceMen = 2;
      }
    }
    return new ListView(
      padding: EdgeInsets.only(left: 5.0, right: 5.0),
      children: <Widget>[
        new Container(
            padding: EdgeInsets.only(top: 20.0),
            child: new Text(
              'Top 3 Scores of the Season(Men):',
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            )),
        Divider(
          color: Colors.black,
        ),
        new ListTile(
          leading: new Text('#1'),
          title: new Text(
            '${menBestFName[0]} ${menBestLName[0]}',
          ),
          trailing: new Text(
            '${menBestScore[0]}',
          ),
        ),
        new ListTile(
          leading: new Text('#$secondPlaceMen'),
          title: new Text(
            '${menBestFName[1]} ${menBestLName[1]}',
          ),
          trailing: new Text(
            '${menBestScore[1]}',
          ),
        ),
        new ListTile(
          leading: new Text('#$thirdPlaceMen'),
          title: new Text(
            '${menBestFName[2]} ${menBestLName[2]}',
          ),
          trailing: new Text(
            '${menBestScore[2]}',
          ),
        ),
        Divider(
          color: Colors.black,
        ),
        new Container(
            child: new Text(
          'Top 3 Scores of the Season(Women):',
          textAlign: TextAlign.center,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        )),
        Divider(
          color: Colors.black,
        ),
        new ListTile(
          leading: new Text('#1'),
          title: new Text('Member Name'),
          trailing: new Text('68'),
        ),
        new ListTile(
          leading: new Text('#2'),
          title: new Text('Member Name'),
          trailing: new Text('69'),
        ),
        new ListTile(
          leading: new Text('#3'),
          title: new Text('Member Name'),
          trailing: new Text('70'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
        child: seasonMen(),
      ),
    );
  }
}
