import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:async';


class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {

  bool _isHorizontalOrientation = true;

  double progressValue = 0;
  double _size = 150;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    if (mounted) {
      _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer _timer) {
        setState(() {
          if(progressValue != 60) {
            progressValue++;
          }
        });
      });
    }
  }

  Widget _buildTextLabels(BuildContext context) {
    final Brightness _brightness = Theme.of(context).brightness;
    double _deliveryStatus = progressValue;
    const double _orderState = 0;
    const double _packedState = 30;
    const double _shippedState = 60;
    const double _deliveredState = 90;
    Color _activeColor =
    _deliveryStatus > _orderState ? Color(0xff0DC9AB) : Color(0xffD1D9DD);
    final Color _inactiveColor = _brightness == Brightness.dark
        ? const Color(0xff62686A)
        : const Color(0xFFD1D9DD);

    return SizedBox(
        height: _isHorizontalOrientation ? 100 : 300,
        child: SfLinearGauge(
          orientation: _isHorizontalOrientation
              ? LinearGaugeOrientation.horizontal
              : LinearGaugeOrientation.vertical,
          minimum: 0,
          maximum: 90,
          labelOffset: 24,
          isAxisInversed: !_isHorizontalOrientation,
          showTicks: false,
          onGenerateLabels: () {
            return <LinearAxisLabel>[
              const LinearAxisLabel(text: '팔굽혀펴기', value: _orderState),
              const LinearAxisLabel(text: '플랭크', value: _packedState),
              const LinearAxisLabel(text: '스쿼트', value: _shippedState),
              const LinearAxisLabel(text: '버핏', value: _deliveredState),
            ];
          },
          axisTrackStyle: LinearAxisTrackStyle(
            color: _inactiveColor,
          ),
          barPointers: <LinearBarPointer>[
            LinearBarPointer(
              value: _deliveryStatus,
              color: _activeColor,
              enableAnimation: false,
              position: LinearElementPosition.cross,
            ),
          ],
          markerPointers: <LinearMarkerPointer>[
            LinearWidgetPointer(
              value: _orderState,
              enableAnimation: false,
              position: LinearElementPosition.cross,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    border: Border.all(width: 4, color: _activeColor),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child:
                  Icon(Icons.check_rounded, size: 14, color: _activeColor),
                ),
              ),
            ),
            LinearWidgetPointer(
              enableAnimation: false,
              value: _packedState,
              position: LinearElementPosition.cross,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    border: Border.all(width: 4, color: _activeColor),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child:
                  Icon(Icons.check_rounded, size: 14, color: _activeColor),
                ),
              ),
            ),
            LinearWidgetPointer(
              value: _shippedState,
              enableAnimation: false,
              position: LinearElementPosition.cross,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(width: 4, color: _activeColor),
                    borderRadius: const BorderRadius.all(Radius.circular(12))),
                child: Center(
                  child:
                  Icon(Icons.check_rounded, size: 14, color: _activeColor),
                ),
              ),
            ),
            LinearShapePointer(
              value: _deliveredState,
              enableAnimation: false,
              color: _inactiveColor,
              width: 24,
              height: 24,
              position: LinearElementPosition.cross,
              shapeType: LinearShapePointerType.circle,
            ),
          ],
        ));
  }

  Widget _getGauge({bool isRadialGauge = false}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        title: GaugeTitle(
            text: 'Speedometer',
            textStyle:
            const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.green,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 10,
                endWidth: 10),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.red,
                startWidth: 10,
                endWidth: 10)
          ], pointers: <GaugePointer>[
            NeedlePointer(value: 90)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Container(
                    child: const Text('90.0',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold))),
                angle: 90,
                positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          animateAxis: true,
          barPointers: <LinearBarPointer>[
            LinearBarPointer(
              value: progressValue,
              position: LinearElementPosition.inside,
              color: Colors.deepPurple,
            )
          ],
          orientation: LinearGaugeOrientation.horizontal,
          majorTickStyle: LinearTickStyle(length: 10),
          axisLabelStyle: TextStyle(fontSize: 10.0, color: Colors.black),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.black,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 15.0,
              borderColor: Colors.grey)),
      margin: EdgeInsets.all(20),
    );
  }

  Widget getProgressBarWithCircle() {
    return SizedBox(
        height: _size,
        width: _size,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 30,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
                        stops: <double>[0.25, 0.75])),
                MarkerPointer(
                  value: progressValue,
                  markerType: MarkerType.circle,
                  markerHeight: 20,
                  markerWidth: 20,
                  enableAnimation: true,
                  animationDuration: 30,
                  animationType: AnimationType.linear,
                  color: const Color(0xFF87e8e8),
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    widget: Text(progressValue.toStringAsFixed(0) + '%'))
              ]),
        ]));
  }

  /// Returns gradient progress style circular progress bar.
  Widget getProgressBarWithRectangle() {
    return SizedBox(
        height: _size,
        width: _size,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 30,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
                        stops: <double>[0.25, 0.75])),
                MarkerPointer(
                  value: progressValue,
                  markerType: MarkerType.rectangle,
                  markerHeight: 18,
                  markerWidth: 18,
                  enableAnimation: true,
                  animationDuration: 30,
                  animationType: AnimationType.linear,
                  color: const Color(0xFF87e8e8),
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    widget: Text(progressValue.toStringAsFixed(0) + '%'))
              ]),
        ]));
  }

  /// Returns gradient progress style circular progress bar.
  Widget getProgressBarWithImage() {
    return SizedBox(
        height: _size,
        width: _size,
        child: SfRadialGauge(axes: <RadialAxis>[
          RadialAxis(
              showLabels: false,
              showTicks: false,
              startAngle: 270,
              endAngle: 270,
              radiusFactor: 0.8,
              axisLineStyle: const AxisLineStyle(
                thickness: 0.1,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
                cornerStyle: CornerStyle.startCurve,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: progressValue,
                    width: 0.1,
                    sizeUnit: GaugeSizeUnit.factor,
                    enableAnimation: true,
                    animationDuration: 30,
                    animationType: AnimationType.linear,
                    cornerStyle: CornerStyle.startCurve,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF00a9b5), Color(0xFFa4edeb)],
                        stops: <double>[0.25, 0.75])),
                MarkerPointer(
                  value: progressValue,
                  markerType: MarkerType.image,
                  imageUrl: 'assets/images/daesung1.png',
                  overlayRadius: 5,
                  markerHeight: 30,
                  markerWidth: 30,
                  enableAnimation: true,
                  animationDuration: 30,
                  animationType: AnimationType.linear,
                  color: const Color(0xFF87e8e8),
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    widget: Text(progressValue.toStringAsFixed(0) + '%'))
              ]),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body:
        //_getGauge()
        ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            getProgressBarWithCircle(),
            getProgressBarWithImage(),
            getProgressBarWithRectangle(),
            _getGauge(),
            _buildTextLabels(context),
          ],
        )

    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
