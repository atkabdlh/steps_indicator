import 'package:flutter/material.dart';
import 'package:vertical_steps_indicator/vertical_steps_indicator.dart';

class StepsItemWidget extends StatefulWidget {
  const StepsItemWidget({
    super.key,
    required this.stepItemModel,
    required this.index,
    this.height,
    this.indicatorColor,
    this.highlighted,
  });

  final StepItemModel stepItemModel;
  final int index;
  final double? height;
  final Color? indicatorColor;
  final bool? highlighted;

  @override
  State<StepsItemWidget> createState() => _StepsItemWidgetState();
}

class _StepsItemWidgetState extends State<StepsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: BoxDecoration(
        color: widget.highlighted == true
            ? widget.indicatorColor != null
                ? widget.indicatorColor!.withOpacity(0.2)
                : Color(0xFF005BFF).withOpacity(0.2)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: widget.highlighted == true
              ? widget.indicatorColor ?? Color(0xFF005BFF)
              : Colors.transparent,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: widget.stepItemModel.contents ??
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.stepItemModel.title ??
                        Text('Step ${widget.index + 1}'),
                    if (widget.stepItemModel.subtitle1 != null)
                      widget.stepItemModel.subtitle1!,
                    if (widget.stepItemModel.subtitle2 != null)
                      widget.stepItemModel.subtitle2!,
                  ],
                ),
                Spacer(),
                Icon(Icons.chevron_right),
              ],
            ),
      ),
    );
  }
}
