import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcGaugeRange extends GaugeRange {
  ImcGaugeRange({
    required Color color,
    required double start,
    required double end,
    required String label,
    Key? key,
  }) : super(
    key: key,
    startValue: start,
    endValue: end,
    label: label,
    color: color,
    sizeUnit: GaugeSizeUnit.factor,
    labelStyle: GaugeTextStyle(
      fontFamily: 'Times',
      fontSize: 12,
    ),
    startWidth: 0.65,
    endWidth: 0.65
  );
}