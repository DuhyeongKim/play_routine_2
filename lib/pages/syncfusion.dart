import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SyncFusion extends StatefulWidget {
  const SyncFusion({Key? key}) : super(key: key);

  @override
  _SyncFusionState createState() => _SyncFusionState();
}

class _SyncFusionState extends State<SyncFusion> {
  List<GDPData> data = [
      GDPData('Ocean', 1600),
      GDPData('Africa', 2400),
      GDPData('S America', 4200),
      GDPData('N America', 23400),
      GDPData('Asia', 34900),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Syncfusion Page"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                title: ChartTitle(text: 'Half yearly sales analysis '),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<GDPData, String>>[
                  LineSeries<GDPData, String>
                    (dataSource: data,
                      xValueMapper: (GDPData gdp, _) => gdp.continent,
                      yValueMapper: (GDPData gdp, _) => gdp.gdp,
                      name: 'Gdp',
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SfSparkLineChart.custom(
                    trackball: SparkChartTrackball(
                      activationMode: SparkChartActivationMode.tap),
                    ),
                  )
                )
            ],
          ),
        )
    );
  }
}




class GDPData{
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}