import 'package:flutter/material.dart';
import 'package:vertical_steps_indicator/src/dashed_line_painter.dart';
import 'package:vertical_steps_indicator/vertical_steps_indicator.dart';

class IndicatorLine extends StatefulWidget {
  const IndicatorLine({
    super.key,
    required this.stepsCount,
    required this.lineType,
    this.stepItemHeight,
    this.lineColor,
  });

  final int stepsCount;
  final LineType lineType;
  final double? stepItemHeight;
  final Color? lineColor;

  @override
  State<IndicatorLine> createState() => _IndicatorLineState();
}

class _IndicatorLineState extends State<IndicatorLine> {
  double widgetWidth = 24;
  double widgetHeight = 110;
  @override
  void initState() {
    widgetHeight =
        ((widget.stepItemHeight ?? widgetHeight) * (widget.stepsCount - 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: (widget.stepItemHeight ?? 110) * 0.5),
      child: SizedBox(
        width: widgetWidth,
        height: widgetHeight,
        child: widget.lineType == LineType.dashed
            ? Center(
                child: CustomPaint(
                  painter: LineDashedPainter(
                    color: widget.lineColor ?? Color(0xffE0E0E0),
                    height: widgetHeight,
                    width: widgetWidth,
                  ),
                ),
              )
            : Center(
                child: Container(
                  height: widgetHeight,
                  width: 6,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: widget.lineColor ?? Color(0xffE0E0E0),
                  ),
                ),
              ),
      ),
    );
  }
}
