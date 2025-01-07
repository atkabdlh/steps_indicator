import 'package:flutter/widgets.dart';
import 'package:vertical_steps_indicator/src/indicator_line.dart';
import 'package:vertical_steps_indicator/src/normal_indicator.dart';
import 'package:vertical_steps_indicator/src/selected_indicator.dart';
import 'package:vertical_steps_indicator/src/steps_item_widget.dart';
import 'package:vertical_steps_indicator/vertical_steps_indicator.dart';

class StepsIndicatorWidget extends StatefulWidget {
  const StepsIndicatorWidget({
    super.key,
    required this.steps,
    required this.currentStep,
    this.indicatorType = IndicatorType.onlyCurrent,
    this.stepItemHeight,
    this.indicatorColor,
    this.backgroundColor,
    this.borderColor,
    this.lineType,
    this.selectedIndicator,
    this.normalIndicator,
  });

  final List<StepItemModel> steps;
  final int currentStep;
  final IndicatorType indicatorType;
  final double? stepItemHeight;
  final Color? indicatorColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final LineType? lineType;
  final Widget? selectedIndicator;
  final Widget? normalIndicator;

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
                stepItemHeight: widget.stepItemHeight,
              ),
              SizedBox(
                width: 24,
                child: Center(
                  child: Column(
                    children: List.generate(
                        widget.steps.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      ((widget.stepItemHeight ?? 110) - 24) *
                                          0.5),
                              child: (widget.indicatorType ==
                                          IndicatorType.onlyCurrent
                                      ? index == widget.currentStep
                                      : index <= widget.currentStep)
                                  ? widget.selectedIndicator ??
                                      SelectedIndicator(
                                        indicatorColor: widget.indicatorColor,
                                        backgroundColor: widget.backgroundColor,
                                      )
                                  : widget.normalIndicator ??
                                      NormalIndicator(
                                        borderColor: widget.borderColor,
                                        backgroundColor: widget.backgroundColor,
                                      ),
                            )),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Column(
            children: widget.steps.map((step) {
              int stepIndex = widget.steps.indexOf(step);
              bool highlighted =
                  widget.indicatorType == IndicatorType.onlyCurrent
                      ? stepIndex == widget.currentStep
                      : stepIndex <= widget.currentStep;
              return Padding(
                padding: EdgeInsets.all(4),
                child: StepsItemWidget(
                  stepItemModel: step,
                  index: stepIndex,
                  height: widget.stepItemHeight ?? 102,
                  indicatorColor: widget.indicatorColor,
                  highlighted: highlighted,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
