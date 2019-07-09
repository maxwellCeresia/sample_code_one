import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String selectedWeek = '04/01 - 04/07';

class WeeklyAnalytics extends StatefulWidget {
  @override
  _WeeklyAnalyticsState createState() => _WeeklyAnalyticsState();
}

class _WeeklyAnalyticsState extends State<WeeklyAnalytics> {
  bool darkMode = false;
  String month;
  final chartTitle = new Text(
    'Montly Stats',
    textAlign: TextAlign.center,
    style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30.0
    ),
  );
  static List<charts.Series<EighteenWeekSampleData, String>> _eighteenSampleData() {
    final desktopSalesData = [
      new EighteenWeekSampleData('Mon.', 5),
      new EighteenWeekSampleData('Tues.', 5),
      new EighteenWeekSampleData('Wed.', 25),
      new EighteenWeekSampleData('Thur.', 10),
      new EighteenWeekSampleData('Fri.', 76),
      new EighteenWeekSampleData('Sat.', 5),
      new EighteenWeekSampleData('Sun.', 5),
    ];

    final tableSalesData = [
      new EighteenWeekSampleData('Mon.', 5),
      new EighteenWeekSampleData('Tues.', 25),
      new EighteenWeekSampleData('Wed.', 50),
      new EighteenWeekSampleData('Thur.', 10),
      new EighteenWeekSampleData('Fri.', 20),
      new EighteenWeekSampleData('Sat.', 5),
      new EighteenWeekSampleData('Sun.', 10),
    ];

    return [
      new charts.Series<EighteenWeekSampleData, String>(
        id: 'Men',
        domainFn: (EighteenWeekSampleData sales, _) => sales.year,
        measureFn: (EighteenWeekSampleData sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_,__) => charts.Color(r: 5,g: 70,b: 175),
      ),
      new charts.Series<EighteenWeekSampleData, String>(
          id: 'Women',
          domainFn: (EighteenWeekSampleData sales, _) => sales.year,
          measureFn: (EighteenWeekSampleData sales, _) => sales.sales,
          data: tableSalesData,
          colorFn: (_,__) => charts.Color(r: 255,g: 102,b: 204)
      ),
    ];
  }
  static List<charts.Series<NineWeekSampleData, String>> _nineSampleData() {
    final desktopSalesData = [
      new NineWeekSampleData('Mon.', 5),
      new NineWeekSampleData('Tues.', 5),
      new NineWeekSampleData('Wed.', 25),
      new NineWeekSampleData('Thur.', 100),
      new NineWeekSampleData('Fri.', 75),
      new NineWeekSampleData('Sat.', 5),
      new NineWeekSampleData('Sun.', 5),
    ];

    final tableSalesData = [
      new NineWeekSampleData('Mon.', 10),
      new NineWeekSampleData('Tues.', 2),
      new NineWeekSampleData('Wed.', 20),
      new NineWeekSampleData('Thur.', 80),
      new NineWeekSampleData('Fri.', 75),
      new NineWeekSampleData('Sat.', 15),
      new NineWeekSampleData('Sat.', 15),
    ];

    return [
      new charts.Series<NineWeekSampleData, String>(
        id: 'Men',
        domainFn: (NineWeekSampleData sales, _) => sales.day,
        measureFn: (NineWeekSampleData sales, _) => sales.sales,
        colorFn: (_,__) => charts.Color(r: 5,g: 70,b: 175),
        data: desktopSalesData,
      ),
      new charts.Series<NineWeekSampleData, String>(
        id: 'Women',
        domainFn: (NineWeekSampleData sales, _) => sales.day,
        measureFn: (NineWeekSampleData sales, _) => sales.sales,
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
        title: new Theme(
          data: new ThemeData(
              canvasColor: Colors.black
          ),
          child: new DropdownButton<String>(
            isExpanded: true,
            hint: new Text(
              'Select Week',
              style: new TextStyle(
                  color: Colors.grey
              ),
            ),
            value: month,
            elevation: 10,
            items: <String>[
              '04/01 - 04/07',
              '04/08 - 04/14',
              '04/15 - 04/21',
              '04/22 - 04/28',
              '04/29 - 05/05',
              '05/06 - 05/12',
              '05/13 - 05/19',
              '05/20 - 05/26',
              '05/27 - 06/02',
              '06/03 - 06/09',
              '06/10 - 06/16',
              '06/17 - 06/23',
              '06/24 - 06/30',
              '07/01 - 07/07',
              '07/08 - 07/14',
              '07/15 - 07/21',
              '07/22 - 07/28',
              '07/29 - 08/04',
              '08/05 - 08/11',
              '08/12 - 08/18',
              '08/19 - 08/25',
              '08/26 - 09/01',
              '09/02 - 09/08',
              '09/09 - 09/15',
              '09/16 - 09/22',
              '09/23 - 09/29',
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value,
                  style: new TextStyle(
                      color: Colors.white
                  ),),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                month = value;
                selectedWeek = value;
              });
            },
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
          padding: EdgeInsets.only(top: 10.0),
          children: <Widget>[
//            chartTitle,
//            CityLineChart(),
            new Container(
              height: 400.0,
              child: EighteenHoleStat(_eighteenSampleData()),
            ),
            new Container(
              height: 400.0,
              child: NineHoleStat(_nineSampleData()),
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

  @override
  _EighteenHoleStatState createState() => _EighteenHoleStatState();

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
              new charts.ChartTitle('18 Holes ($selectedWeek)',
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

class EighteenWeekSampleData {
  final String year;
  final int sales;

  EighteenWeekSampleData(this.year, this.sales);
}

class NineHoleStat extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NineHoleStat(this.seriesList, {this.animate});

  @override
  _NineHoleStatState createState() => _NineHoleStatState();

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
              new charts.ChartTitle('9 Holes ($selectedWeek)',
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

class NineWeekSampleData {
  final String day;
  final int sales;

  NineWeekSampleData(this.day, this.sales);
}