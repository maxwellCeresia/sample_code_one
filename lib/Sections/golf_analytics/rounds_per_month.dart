import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundsPerMonth extends StatefulWidget {
  @override
  _RoundsPerMonthState createState() => _RoundsPerMonthState();
}

class _RoundsPerMonthState extends State<RoundsPerMonth> {
  bool darkMode = false;
  static List<charts.Series<EighteenSampleData, String>> _eighteenSampleData2() {
    final desktopSalesData = [
      new EighteenSampleData('April', 10),
      new EighteenSampleData('May', 5),
      new EighteenSampleData('June', 25),
      new EighteenSampleData('July', 10),
      new EighteenSampleData('August', 76),
      new EighteenSampleData('September', 5),
    ];

    final tableSalesData = [
      new EighteenSampleData('April', 5),
      new EighteenSampleData('May', 25),
      new EighteenSampleData('June', 50),
      new EighteenSampleData('July', 10),
      new EighteenSampleData('August', 20),
      new EighteenSampleData('September', 5),
    ];

    return [
      new charts.Series<EighteenSampleData, String>(
        id: 'Men',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_,__) => charts.Color(r: 5,g: 70,b: 175),
      ),
      new charts.Series<EighteenSampleData, String>(
        id: 'Women',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: tableSalesData,
          colorFn: (_,__) => charts.Color(r: 255,g: 102,b: 204)
      ),
    ];
  }
  static List<charts.Series<NineHoleSampleData, String>> _nineHoleSampleData() {
    final desktopSalesData = [
      new NineHoleSampleData('April', 5),
      new NineHoleSampleData('May', 5),
      new NineHoleSampleData('June', 25),
      new NineHoleSampleData('July', 100),
      new NineHoleSampleData('August', 75),
      new NineHoleSampleData('Sept.', 5),
    ];

    final tableSalesData = [
      new NineHoleSampleData('April', 10),
      new NineHoleSampleData('May', 2),
      new NineHoleSampleData('June', 20),
      new NineHoleSampleData('July', 80),
      new NineHoleSampleData('August', 75),
      new NineHoleSampleData('Sept.', 15),
    ];

    return [
      new charts.Series<NineHoleSampleData, String>(
        id: 'Men',
        domainFn: (NineHoleSampleData sales, _) => sales.year,
        measureFn: (NineHoleSampleData sales, _) => sales.sales,
        colorFn: (_,__) => charts.Color(r: 5,g: 70,b: 175),
        data: desktopSalesData,
      ),
      new charts.Series<NineHoleSampleData, String>(
        id: 'Women',
        domainFn: (NineHoleSampleData sales, _) => sales.year,
        measureFn: (NineHoleSampleData sales, _) => sales.sales,
        colorFn: (_,__) => charts.Color(r: 255,g: 102,b: 204),
        data: tableSalesData,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: new Text(
          'Rounds Per Month',
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.white
          ),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(FontAwesomeIcons.ghost,
                color: Colors.white,
              ),
              onPressed: (){
                setState(() {
                  darkMode = !darkMode;
                });
              },
          )
        ],
      ),
      body: new Center(
        child: new ListView(
          children: <Widget>[
          new Container(
            height: 400.0,
            child: EighteenHoleStat(_eighteenSampleData2()),
          ),
          new Container(
            height: 400.0,
            child: NineHoleStat(_nineHoleSampleData()),
          ),
          ],
        ),
      ),
    );
  }
}

class EighteenHoleStat extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  EighteenHoleStat(this.seriesList, {this.animate});

  factory EighteenHoleStat.withSampleData() {
    return new EighteenHoleStat(
      _createSampleData(),
      animate: false,
    );
  }


  @override
  _EighteenHoleStatState createState() => _EighteenHoleStatState();

  static List<charts.Series<EighteenSampleData, String>> _createSampleData() {
    final desktopSalesData = [
      new EighteenSampleData('2014', 5),
      new EighteenSampleData('2015', 25),
      new EighteenSampleData('2016', 100),
      new EighteenSampleData('2017', 75),
    ];

    final tableSalesData = [
      new EighteenSampleData('2014', 25),
      new EighteenSampleData('2015', 50),
      new EighteenSampleData('2016', 10),
      new EighteenSampleData('2017', 20),
    ];

    final mobileSalesData = [
      new EighteenSampleData('2014', 10),
      new EighteenSampleData('2015', 15),
      new EighteenSampleData('2016', 50),
      new EighteenSampleData('2017', 45),
    ];

    return [
      new charts.Series<EighteenSampleData, String>(
        id: 'Desktop',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<EighteenSampleData, String>(
        id: 'Tablet',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<EighteenSampleData, String>(
        id: 'Mobile',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

class _EighteenHoleStatState extends State<EighteenHoleStat> {
  Map<String, num> _measures;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    final measures = <String, num>{};

    if (selectedDatum.isNotEmpty) {
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.sales;
      });
    }

    setState(() {
      _measures = measures;
    });
  }
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      new SizedBox(
          height: 300.0,
          child: new charts.BarChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
              behaviors: [
                new charts.ChartTitle('18 Holes',
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                    charts.OutsideJustification.middle),
                new charts.ChartTitle('Rounds',
                    behaviorPosition: charts.BehaviorPosition.start,
                    titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea),
              ],
          )),
    ];

    _measures?.forEach((String series, num value) {
      children.add(new Text('$series: $value'));
    });

    return new Column(children: children);
  }
}

class EighteenSampleData {
  final String year;
  final int sales;

  EighteenSampleData(this.year, this.sales);
}

class NineHoleStat extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NineHoleStat(this.seriesList, {this.animate});

  factory NineHoleStat.withSampleData() {
    return new NineHoleStat(
      _createSampleData(),
      animate: false,
    );
  }


  @override
  _NineHoleStatState createState() => _NineHoleStatState();

  static List<charts.Series<EighteenSampleData, String>> _createSampleData() {
    final desktopSalesData = [
      new EighteenSampleData('2014', 5),
      new EighteenSampleData('2015', 25),
      new EighteenSampleData('2016', 100),
      new EighteenSampleData('2017', 75),
    ];

    final tableSalesData = [
      new EighteenSampleData('2014', 25),
      new EighteenSampleData('2015', 50),
      new EighteenSampleData('2016', 10),
      new EighteenSampleData('2017', 20),
    ];

    final mobileSalesData = [
      new EighteenSampleData('2014', 10),
      new EighteenSampleData('2015', 15),
      new EighteenSampleData('2016', 50),
      new EighteenSampleData('2017', 45),
    ];

    return [
      new charts.Series<EighteenSampleData, String>(
        id: 'Desktop',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<EighteenSampleData, String>(
        id: 'Tablet',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<EighteenSampleData, String>(
        id: 'Mobile',
        domainFn: (EighteenSampleData sales, _) => sales.year,
        measureFn: (EighteenSampleData sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

class _NineHoleStatState extends State<NineHoleStat> {
  Map<String, num> _measures;

  _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;

    final measures = <String, num>{};

    if (selectedDatum.isNotEmpty) {
      selectedDatum.forEach((charts.SeriesDatum datumPair) {
        measures[datumPair.series.displayName] = datumPair.datum.sales;
      });
    }


    setState(() {
      _measures = measures;
    });
  }
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      new SizedBox(
          height: 300.0,
          child: new charts.BarChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            behaviors: [
              new charts.ChartTitle('9 Holes',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification:
                charts.OutsideJustification.middle),
              new charts.ChartTitle('Rounds',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification:
                  charts.OutsideJustification.middleDrawArea),
            ],
          )),
    ];

    _measures?.forEach((String series, num value) {
      children.add(new Text('$series: $value'));
    });

    return new Column(children: children);
  }
}

class NineHoleSampleData {
  final String year;
  final int sales;

  NineHoleSampleData(this.year, this.sales);
}