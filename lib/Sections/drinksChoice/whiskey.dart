import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Whiskey extends StatefulWidget {
  @override
  _WhiskeyState createState() => _WhiskeyState();
}

class _WhiskeyState extends State<Whiskey> {
  final myController = TextEditingController();
  int price;
  int start = 5;
  int type = 0;
  int size = 0;
  int quantity = 1;
  Color selected = Colors.white;
  Color notSelected = Colors.lightBlueAccent;
  bool neat = false;
  bool rocks = false;
  bool pepsi = false;
  bool dietPepsi = false;
  bool sierraMist = false;
  bool cranberryJuice = false;
  bool gingerAle = false;
  bool grapefruitJuice = false;
  bool orangeJuice = false;
  bool pineappleJuice = false;
  bool clubSoda = false;
  bool tonicWater = false;
  bool single = true;
  bool double = false;
  bool well = true;
  bool jack = false;
  bool jim = false;
  final snackBar = SnackBar(
    content: Text('Yay! A SnackBar!'),
    backgroundColor: Colors.white,
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }

  void priceChange() {
    setState(() {
      price = (size + type + start) * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    priceChange();
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: new AppBar(
          backgroundColor: Colors.black,
        ),
        body: Builder(builder: (BuildContext context) {
          return new Center(
            child: new ListView(
              children: <Widget>[
                ListTile(
                    leading: new Text(
                      'Whiskey',
                      style: new TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    trailing: new Text(
                      '\$$price',
                      style: new TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                Divider(
                  color: Colors.white,
                  indent: 10.0,
                ),
                ListTile(
                    leading: new Text(
                      'Select a quantity',
                      style: new TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    trailing: new SizedBox(
                      width: 135.0,
                      height: 50.0,
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.minusCircle,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) {
                                  quantity = quantity - 1;
                                }
                              });
                            },
                          ),
                          new Text(
                            '$quantity',
                            style: new TextStyle(
                                color: Colors.white, fontSize: 22.0),
                          ),
                          IconButton(
                            icon: Icon(
                              FontAwesomeIcons.plusCircle,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            onPressed: () {
                              setState(() {
                                quantity = quantity + 1;
                              });
                            },
                          ),
                        ],
                      ),
                    )),
                Divider(
                  color: Colors.white,
                  indent: 10.0,
                ),
                ListTile(
                  dense: true,
                  leading: new Text(
                    'Choose a brand',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  height: 0.0,
                  color: Colors.white,
                  indent: 10.0,
                ),
                new Container(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    left: 10.0,
                  ),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          setState(() {
                            well = true;
                            jack = false;
                            jim = false;
                            type = 0;
                          });
                        },
                        child: new Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: new Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                new Text(
                                  'Well\n+\$0',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Container(
                                  alignment: Alignment.center,
                                  height: 100.0,
                                  width: 100.0,
                                  color: well
                                      ? Colors.grey.withOpacity(0.75)
                                      : Colors.transparent,
                                  child: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    color: well
                                        ? Colors.blue.withOpacity(0.5)
                                        : Colors.transparent,
                                    size: 80.0,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(width: 10.0),
                      new GestureDetector(
                        onTap: () {
                          setState(() {
                            well = false;
                            jack = true;
                            jim = false;
                            type = 2;
                          });
                        },
                        child: new Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: new Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                new Text(
                                  'Jack Daniels\n+\$2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Container(
                                  alignment: Alignment.center,
                                  height: 100.0,
                                  width: 100.0,
                                  color: jack
                                      ? Colors.grey.withOpacity(0.75)
                                      : Colors.transparent,
                                  child: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    color: jack
                                        ? Colors.blue.withOpacity(0.5)
                                        : Colors.transparent,
                                    size: 80.0,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      SizedBox(width: 10.0),
                      new GestureDetector(
                        onTap: () {
                          setState(() {
                            well = false;
                            jack = false;
                            jim = true;
                            type = 2;
                          });
                        },
                        child: new Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: new Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                new Text(
                                  'Jim Beam\n+\$2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                new Container(
                                  alignment: Alignment.center,
                                  height: 100.0,
                                  width: 100.0,
                                  color: jim
                                      ? Colors.grey.withOpacity(0.75)
                                      : Colors.transparent,
                                  child: new Icon(
                                    FontAwesomeIcons.checkCircle,
                                    color: jim
                                        ? Colors.blue.withOpacity(0.5)
                                        : Colors.transparent,
                                    size: 80.0,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                Divider(
                  indent: 10.0,
                  height: 20.0,
                  color: Colors.white,
                ),
                ListTile(
                  dense: true,
                  leading: new Text(
                    'Sizes',
                    style: new TextStyle(color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  indent: 10.0,
                  height: 0.0,
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      single = true;
                      double = false;
                      size = 0;
                    });
                  },
                  dense: true,
                  leading: new IconButton(
                      icon: new Icon(
                        Icons.radio_button_checked,
                        color: single ? Colors.blue : Colors.white,
                      ),
                      onPressed: null),
                  title: new Text(
                    'Single',
                    style: new TextStyle(
                        color: single ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  color: Colors.grey,
                  indent: 10.0,
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.only(bottom: 40.0, left: 16.0, right: 10.0),
                  onTap: () {
                    setState(() {
                      double = true;
                      single = false;
                      size = 14;
                    });
                  },
                  dense: true,
                  leading: new IconButton(
                      icon: new Icon(
                        Icons.radio_button_checked,
                        color: double ? Colors.blue : Colors.white,
                      ),
                      onPressed: null),
                  title: new Text(
                    'Double',
                    style: new TextStyle(
                        color: double ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                  trailing: new Text(
                    '+\$14',
                    style: new TextStyle(
                        color: double ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  indent: 10.0,
                  height: 0.0,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(top: 0.0, left: 10.0),
                  dense: true,
                  leading: new Text(
                    'Choose a mixer',
                    style: new TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.white,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      neat = !neat;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: neat ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Neat',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: neat ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      rocks = !rocks;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: rocks ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'On the rocks',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: rocks ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      pepsi = !pepsi;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: pepsi ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        pepsi = !pepsi;
                      });
                    },
                  ),
                  title: new Text(
                    'Pepsi',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: pepsi ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      dietPepsi = !dietPepsi;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: dietPepsi ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Diet Pepsi',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: dietPepsi ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      gingerAle = !gingerAle;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: gingerAle ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Gingerale',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: gingerAle ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      sierraMist = !sierraMist;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: sierraMist ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Sierra Mist',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: sierraMist ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      clubSoda = !clubSoda;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: clubSoda ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Club Soda',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: clubSoda ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      tonicWater = !tonicWater;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: tonicWater ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Tonic Water',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: tonicWater ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      cranberryJuice = !cranberryJuice;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: cranberryJuice ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Cranberry Juice',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: cranberryJuice ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      grapefruitJuice = !grapefruitJuice;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: grapefruitJuice ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Grapefruit Juice',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: grapefruitJuice ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  dense: true,
                  onTap: () {
                    setState(() {
                      pineappleJuice = !pineappleJuice;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: pineappleJuice ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Pineapple Juice',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: pineappleJuice ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  indent: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(bottom: 35.0, left: 16.0),
                  dense: true,
                  onTap: () {
                    setState(() {
                      orangeJuice = !orangeJuice;
                    });
                  },
                  leading: new IconButton(
                    icon: Icon(
                      Icons.radio_button_checked,
                      color: orangeJuice ? Colors.blue : Colors.white,
                    ),
                    onPressed: () {},
                  ),
                  title: new Text(
                    'Orange Juice',
                    textAlign: TextAlign.start,
                    style: new TextStyle(
                        color: orangeJuice ? Colors.blue : Colors.white,
                        fontSize: 18.0),
                  ),
                ),
                Divider(
                  height: 0.0,
                  color: Colors.white,
                  indent: 10.0,
                ),
                ListTile(
                  dense: true,
                  leading: new Text(
                    'Additional comments',
                    style: new TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white,
                  indent: 10.0,
                  height: 0.0,
                ),
                new TextFormField(
                  controller: myController,
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  maxLines: 2,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  decoration: new InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 13.0, top: 20.0, bottom: 40.0),
                    hintText: 'e.g. Add a splash of cranberry',
                    hintStyle: new TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                new MaterialButton(
                  color: Colors.blue,
                  height: 50.0,
                  child: new Text(
                    'Order',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {
                    print(myController.text);
                  },
                )
              ],
            ),
          );
        }));
  }
}
