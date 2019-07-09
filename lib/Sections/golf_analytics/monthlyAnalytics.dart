import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';

String selectedMonth = 'April';

class MonthlyAnalyticsGraph extends StatefulWidget {
  @override
  _MonthlyAnalyticsGraphState createState() => _MonthlyAnalyticsGraphState();
}

class _MonthlyAnalyticsGraphState extends State<MonthlyAnalyticsGraph> {
  bool darkMode = false;
  String month;
  static var rnd = new Random();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DayToMonthSampleData, int>> _eighteenSampleData() {
      List<DayToMonthSampleData> men;
      List<DayToMonthSampleData> women;
      if (selectedMonth == "April") {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'May') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'June') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'July') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'August') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'September') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
        });
      }

      return [
        new charts.Series<DayToMonthSampleData, int>(
          id: 'Men',
          domainFn: (DayToMonthSampleData sales, _) => sales.day,
          measureFn: (DayToMonthSampleData sales, _) => sales.sales,
          data: men,
          colorFn: (_, __) => charts.Color(r: 5, g: 70, b: 175),
        ),
        new charts.Series<DayToMonthSampleData, int>(
            id: 'Women',
            domainFn: (DayToMonthSampleData sales, _) => sales.day,
            measureFn: (DayToMonthSampleData sales, _) => sales.sales,
            data: women,
            colorFn: (_, __) => charts.Color(r: 255, g: 102, b: 204))
      ];
    }

    List<charts.Series<DayToMonthSampleData, int>> _nineSampleData() {
      List<DayToMonthSampleData> men;
      List<DayToMonthSampleData> women;
      if (selectedMonth == "April") {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'May') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'June') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'July') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'August') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
            new DayToMonthSampleData(31, rnd.nextInt(100)),
          ];
        });
      } else if (selectedMonth == 'September') {
        setState(() {
          men = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
          women = [
            new DayToMonthSampleData(1, rnd.nextInt(100)),
            new DayToMonthSampleData(2, rnd.nextInt(100)),
            new DayToMonthSampleData(3, rnd.nextInt(100)),
            new DayToMonthSampleData(4, rnd.nextInt(100)),
            new DayToMonthSampleData(5, rnd.nextInt(100)),
            new DayToMonthSampleData(6, rnd.nextInt(100)),
            new DayToMonthSampleData(7, rnd.nextInt(100)),
            new DayToMonthSampleData(8, rnd.nextInt(100)),
            new DayToMonthSampleData(9, rnd.nextInt(100)),
            new DayToMonthSampleData(10, rnd.nextInt(100)),
            new DayToMonthSampleData(11, rnd.nextInt(100)),
            new DayToMonthSampleData(12, rnd.nextInt(100)),
            new DayToMonthSampleData(13, rnd.nextInt(100)),
            new DayToMonthSampleData(14, rnd.nextInt(100)),
            new DayToMonthSampleData(15, rnd.nextInt(100)),
            new DayToMonthSampleData(16, rnd.nextInt(100)),
            new DayToMonthSampleData(17, rnd.nextInt(100)),
            new DayToMonthSampleData(18, rnd.nextInt(100)),
            new DayToMonthSampleData(19, rnd.nextInt(100)),
            new DayToMonthSampleData(20, rnd.nextInt(100)),
            new DayToMonthSampleData(21, rnd.nextInt(100)),
            new DayToMonthSampleData(22, rnd.nextInt(100)),
            new DayToMonthSampleData(23, rnd.nextInt(100)),
            new DayToMonthSampleData(24, rnd.nextInt(100)),
            new DayToMonthSampleData(25, rnd.nextInt(100)),
            new DayToMonthSampleData(26, rnd.nextInt(100)),
            new DayToMonthSampleData(27, rnd.nextInt(100)),
            new DayToMonthSampleData(28, rnd.nextInt(100)),
            new DayToMonthSampleData(29, rnd.nextInt(100)),
            new DayToMonthSampleData(30, rnd.nextInt(100)),
          ];
        });
      }

      return [
        new charts.Series<DayToMonthSampleData, int>(
          id: 'Men',
          domainFn: (DayToMonthSampleData sales, _) => sales.day,
          measureFn: (DayToMonthSampleData sales, _) => sales.sales,
          data: men,
          colorFn: (_, __) => charts.Color(r: 5, g: 70, b: 175),
        ),
        new charts.Series<DayToMonthSampleData, int>(
            id: 'Women',
            domainFn: (DayToMonthSampleData sales, _) => sales.day,
            measureFn: (DayToMonthSampleData sales, _) => sales.sales,
            data: women,
            colorFn: (_, __) => charts.Color(r: 255, g: 102, b: 204))
      ];
    }

    return Scaffold(
      backgroundColor: darkMode ? Colors.black : Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: new Theme(
          data: new ThemeData(canvasColor: Colors.black),
          child: new DropdownButton<String>(
            isExpanded: true,
            hint: new Text(
              'Select Month',
              style: new TextStyle(color: Colors.white),
            ),
            value: month,
            elevation: 10,
            items: <String>[
              'April',
              'May',
              'June',
              'July',
              'August',
              'September'
            ].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(
                  value,
                  style: new TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                month = value;
                selectedMonth = value;
              });
            },
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              FontAwesomeIcons.ghost,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                darkMode = !darkMode;
              });
            },
          )
        ],
      ),
      body: new Center(
        child: new ListView(
          padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0),
          children: <Widget>[
//            chartTitle,
//            CityLineChart(),
            new Container(
              padding: EdgeInsets.only(top: 30.0),
              height: 420.0,
              child: new EighteenHole(_eighteenSampleData()),
            ),
            new Container(
              height: 420.0,
              child: new NineHole(_nineSampleData()),
            ),
          ],
        ),
      ),
    );
  }
}

class EighteenHole extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  EighteenHole(this.seriesList, {this.animate});
  @override
  State<StatefulWidget> createState() => new _EighteenHoleState();
}

class _EighteenHoleState extends State<EighteenHole> {
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
          height: 350.0,
          child: new charts.LineChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            behaviors: [
              new charts.ChartTitle(
                '18 Holes - $selectedMonth',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.middle,
              ),
              new charts.ChartTitle('Rounds',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
              new charts.ChartTitle('Day',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification:
                      charts.OutsideJustification.middle),
            ],
          )),
    ];

    _measures?.forEach((String series, num value) {
      children.add(new Text(
        '$series: $value',
        textAlign: TextAlign.center,
      ));
    });

    return new Column(children: children);
  }
}

class DayToMonthSampleData {
  final int day;
  final int sales;

  DayToMonthSampleData(this.day, this.sales);
}

class NineHole extends StatefulWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  NineHole(this.seriesList, {this.animate});
  @override
  State<StatefulWidget> createState() => new _NineHoleState();
}

class _NineHoleState extends State<NineHole> {
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
          height: 350.0,
          child: new charts.LineChart(
            widget.seriesList,
            animate: widget.animate,
            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: _onSelectionChanged,
              )
            ],
            behaviors: [
              new charts.ChartTitle(
                '9 Holes - $selectedMonth',
                behaviorPosition: charts.BehaviorPosition.top,
                titleOutsideJustification: charts.OutsideJustification.middle,
              ),
              new charts.ChartTitle('Rounds',
                  behaviorPosition: charts.BehaviorPosition.start,
                  titleOutsideJustification:
                      charts.OutsideJustification.middleDrawArea),
              new charts.ChartTitle('Day',
                  behaviorPosition: charts.BehaviorPosition.bottom,
                  titleOutsideJustification:
                      charts.OutsideJustification.middle),
            ],
          )),
    ];

    _measures?.forEach((String series, num value) {
      children.add(new Text(
        '$series: $value',
        textAlign: TextAlign.center,
      ));
    });

    return new Column(children: children);
  }
}
