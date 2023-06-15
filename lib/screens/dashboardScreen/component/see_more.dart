import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({super.key});

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  late List<SampleData> _chartdata;
  late TrackballBehavior _trackballBehavior;
  @override
  void initState() {
    _chartdata = getdata();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            height: 300,
            child: SfCartesianChart(
              trackballBehavior: _trackballBehavior,
              series: <CandleSeries>[
                CandleSeries<SampleData, DateTime>(
                    dataSource: _chartdata,
                    xValueMapper: (SampleData sales, _) => sales.x,
                    lowValueMapper: (SampleData sales, _) => sales.low,
                    highValueMapper: (SampleData sales, _) => sales.high,
                    openValueMapper: (SampleData sales, _) => sales.open,
                    closeValueMapper: (SampleData sales, _) => sales.close)
              ],
              primaryXAxis: DateTimeAxis(dateFormat: DateFormat.MMM()),
              primaryYAxis: NumericAxis(
                  minimum: 70,
                  maximum: 130,
                  interval: 10,
                  numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
            ),
          ),
        ),
      ),
    );
  }

  List<SampleData> getdata() {
    return <SampleData>[
      SampleData(DateTime(2023, 01, 02), 106, 110, 104, 109),
      SampleData(DateTime(2023, 02, 04), 90, 115, 13, 15),
      SampleData(DateTime(2023, 03, 05), 95, 106, 102, 106),
      SampleData(DateTime(2023, 04, 07), 75, 111, 123, 119),
      SampleData(DateTime(2023, 05, 09), 85, 113, 124, 149),
      SampleData(DateTime(2023, 06, 10), 113, 105, 105, 109),
      SampleData(DateTime(2023, 07, 11), 80, 103, 106, 126),
    ];
  }
}

class SampleData {
  SampleData(this.x, this.open, this.close, this.low, this.high);
  final DateTime? x;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}
