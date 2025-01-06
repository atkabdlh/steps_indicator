import 'package:flutter/widgets.dart';
import 'package:vertical_steps_indicator/src/indicator_line.dart';
import 'package:vertical_steps_indicator/src/normal_indicator.dart';
import 'package:vertical_steps_indicator/src/selected_indicator.dart';
import 'package:vertical_steps_indicator/vertical_steps_indicator.dart';

class StepsIndicatorWidget extends StatefulWidget {
  const StepsIndicatorWidget({
    super.key,
    required this.steps,
    this.indicatorColor,
    this.borderColor,
    this.lineType,
    required this.currentStep,
    this.backgroundColor,
  });

  final Color? indicatorColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final LineType? lineType;
  final int currentStep;
  final List<Widget> steps;

  @override
  State<StepsIndicatorWidget> createState() => _StepsIndicatorWidgetState();
}

class _StepsIndicatorWidgetState extends State<StepsIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            children: [
              IndicatorLine(
                stepsCount: widget.steps.length,
                lineType: widget.lineType ?? LineType.normal,
                lineColor: widget.borderColor,
              ),
              SizedBox(
                width: 24,
                child: Center(
                  child: Column(
                    children: List.generate(
                      widget.steps.length,
                      (index) => index == widget.currentStep
                          ? SelectedIndicator(
                              indicatorColor: widget.indicatorColor,
                              backgroundColor: widget.backgroundColor,
                            )
                          : NormalIndicator(
                              borderColor: widget.borderColor,
                              backgroundColor: widget.backgroundColor,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Column(
            children: widget.steps
                .map((step) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        height: 102,
                        width: MediaQuery.of(context).size.width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: widget.indicatorColor ?? Color(0xFF005BFF),
                              width: 1,
                            )),
                        child: Padding(padding: EdgeInsets.all(4), child: step),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
