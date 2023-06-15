import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:math';

class Graph_components extends StatefulWidget {
  const Graph_components({super.key});

  @override
  State<Graph_components> createState() => _Graph_componentsState();
}

class _Graph_componentsState extends State<Graph_components> {
  late List<Graph_data_model> _chartdata;

  int point = 19059;

  void initiateRandomizer() {
    int min = 15059;
    int max = 19100;
    Random rnd = Random();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      int r = min + rnd.nextInt(max - min);
      setState(() {
        point = r;
      });
    });
  }

  @override
  void initState() {
    _chartdata = getdata();
    // TODO: implement initState
    //initiateRandomizer();
    super.initState();
  }

  @override
  void dispose() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      timer.cancel();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(point);
    print(point + 500);
    return Container(
      child: SfCartesianChart(
        legend: Legend(isVisible: true),
        primaryXAxis: CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
        series: <RangeAreaSeries>[
          RangeAreaSeries<Graph_data_model, String>(
            dataLabelSettings: DataLabelSettings(isVisible: true),
            //borderDrawMode: RangeAreaBorderMode.excludeSides,
            color: ColorConfig.splash,

            // pointColorMapper: (datum, index) => Colors.red,
            dataSource: _chartdata,
            name: "Bitcoin",
            xValueMapper: (Graph_data_model data, _) => data.days,
            highValueMapper: (Graph_data_model data, _) => data.high_24hr,
            lowValueMapper: (Graph_data_model data, _) => data.low_24hr,
          )
        ],
        primaryYAxis: NumericAxis(
            minimum: 10000,
            maximum: 20000,
            numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0)),
        //primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorConfig.black.withOpacity(0.7),
        border:
            Border.all(color: ColorConfig.inputBorderColor.withOpacity(0.40)),
      ),
      //  height: SizeConfig.getPercentageWidth(40),
      width: SizeConfig.getPercentageWidth(50),
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
  }

  List<Graph_data_model> getdata() {
    return <Graph_data_model>[
      Graph_data_model(10700, 15100, "7d low"),
      Graph_data_model(10755, point.toDouble(), "1m high"),
    ];
  }
}

class Graph_data_model {
  Graph_data_model(this.high_24hr, this.low_24hr, this.days);
  final double high_24hr;
  final String days;
  final double low_24hr;
}
