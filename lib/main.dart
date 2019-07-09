import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'Sections/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hintColor: Colors.white,
        bottomAppBarColor: Colors.red[900],
        canvasColor: Colors.red[900],
        primarySwatch: Colors.red,
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white)),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FirebaseUser user;
  String firstName;
  String memberFirstName;
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController memberNumController = new TextEditingController();

  Widget _backImage() {
    return Image.asset(
      'images/Golf.jpg',
      fit: BoxFit.fill,
      height: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget toHomePage() {
    void signInAction() async {
      if (firstNameController.text == 'John' &&
          lastNameController.text == 'Sinatra') {
        setState(() {
          firstName = 'test@test.com';
          memberFirstName = 'John';
        });
      }
      try {
        user = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: firstName, password: memberNumController.text);
      } catch (e) {
        print(e.message);
      } finally {
        if (user != null) {
          Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => HomePage(
                        users: memberFirstName,
                      )));
        } else {}
      }
    }

    final List<Shadow> shadow = [
      Shadow(
        color: Colors.black,
        blurRadius: 8.0,
      )
    ];
    final clubName = new Container(
      alignment: Alignment.center,
      child: ShadowText(
        'Transit Valley\nCountry Club',
        style: TextStyle(
            fontSize: 55.0,
            color: Colors.red[900],
            fontFamily: 'Club2',
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.white,
                offset: Offset(-1.0, -1.0),
              ),
              Shadow(
                  // bottomRight
                  offset: Offset(1.0, -1.0),
                  color: Colors.white),
              Shadow(
                  // topRight
                  offset: Offset(1.0, 1.0),
                  color: Colors.white),
              Shadow(
                  // topLeft
                  offset: Offset(-1.0, 1.0),
                  color: Colors.white),
            ]),
      ),
    );
    final memberFN = new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: new Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 1.0,
          color: Colors.black.withOpacity(0.55),
          child: Container(
              child: new TextFormField(
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintStyle: new TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        shadows: shadow,
                        fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ))),
        ));
    final memberLN = new Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: new Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 1.0,
          color: Colors.black.withOpacity(0.55),
          child: Container(
              child: new TextFormField(
            controller: lastNameController,
            keyboardType: TextInputType.number,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
            autofocus: false,
            decoration: InputDecoration(
              labelText: 'Last Name',
              hintStyle: new TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  shadows: shadow,
                  fontWeight: FontWeight.bold),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ))),
    );
    final memberNumber = new Container(
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: new Material(
          borderRadius: BorderRadius.circular(30.0),
          elevation: 1.0,
          color: Colors.black.withOpacity(0.55),
          child: Container(
              child: new TextFormField(
            controller: memberNumController,
            keyboardType: TextInputType.text,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
            autofocus: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Member #',
              hintStyle: new TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  shadows: shadow,
                  fontWeight: FontWeight.bold),
              fillColor: Colors.white,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
          ))),
    );
    final signInButton = new Container(
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: new ButtonTheme(
        height: 45.0,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
          color: Colors.red[900],
          onPressed: () {
            signInAction();
          },
          child: new Text(
            'Sign In',
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    final termsCon = new Container(
      alignment: Alignment.center,
      child: new InkWell(
        child: new ShadowText(
          'Terms & Conditions',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
    final privatePolicy = new Container(
      alignment: Alignment.center,
      child: new InkWell(
        child: new ShadowText(
          'Private Policy',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
      ),
    );
    return new ListView(
      children: <Widget>[
        SizedBox(height: 100.0),
        clubName,
        SizedBox(height: 80.0),
        memberFN,
        SizedBox(height: 5.0),
        memberLN,
        SizedBox(height: 5.0),
        memberNumber,
        SizedBox(height: 30),
        signInButton,
        termsCon,
        privatePolicy,
      ],
    );
  }

  void current() async {
    user = await FirebaseAuth.instance.currentUser();
  }

  @override
  void initState() {
    current();
    for (var i = 0; i < 31; i++) {
      Firestore.instance.collection('July $i').add({'booked': true});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ClipRRect(
        borderRadius: new BorderRadius.circular(5.0),
        child: new Material(
          child: new Stack(
            children: <Widget>[
              _backImage(),
              toHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}

class ShadowText extends StatelessWidget {
  ShadowText(this.data, {this.style}) : assert(data != null);

  final String data;
  final TextStyle style;

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(
              data,
              style: style.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          new BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: new Text(data, style: style),
          ),
        ],
      ),
    );
  }
}
