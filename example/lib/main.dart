import 'package:flutter/material.dart';
import 'package:vertical_steps_indicator/vertical_steps_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steps Indicator Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF005BFF)),
        useMaterial3: true,
      ),
      home: const StepsIndicatorExample(title: 'Steps Indicator Example'),
    );
  }
}

class StepsIndicatorExample extends StatefulWidget {
  const StepsIndicatorExample({super.key, required this.title});

  final String title;

  @override
  State<StepsIndicatorExample> createState() => _StepsIndicatorExampleState();
}

class _StepsIndicatorExampleState extends State<StepsIndicatorExample> {
  List<StepItemModel> steps = [];
  int currentStep = 2;

  Widget buildSteps(String title, String? subtitle1, String? subtitle2) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (subtitle1 != null)
            Text(
              subtitle1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (subtitle2 != null)
            Text(
              subtitle2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // steps = List.generate(
    //     4,
    //     (index) => buildSteps(
    //           'Step ${index + 1}',
    //           'subtitle 1 index ${index + 1}',
    //           'subtitle 2 index ${index + 1}',
    //         ));

    steps = List.generate(
      4,
      (index) => StepItemModel(
        title: Text(
          'Step ${index + 1}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle1: Text(
          'subtitle 1 index ${index + 1}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle2: Text(
          'subtitle 2 index ${index + 1}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basic Steps Indicator',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              StepsIndicatorWidget(
                steps: [
                  StepItemModel(title: Text('Step 1')),
                  StepItemModel(
                      title: Text('Step 2'),
                      subtitle1: Text('Subtitle to step 2')),
                  StepItemModel(contents: Text('Custom Step Content')),
                ],
                currentStep: 0,
              ),
              SizedBox(height: 16),
              Text(
                'Dashed Steps Indicator',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              StepsIndicatorWidget(
                steps: [
                  StepItemModel(title: Text('Step 1')),
                  StepItemModel(
                      title: Text('Step 2'),
                      subtitle1: Text('Subtitle to step 2')),
                  StepItemModel(
                      title: Text('Step 3'),
                      subtitle1: Text('Subtitle to step 3'),
                      subtitle2: Text('Subtitle 2 to step 3')),
                ],
                currentStep: 1,
                lineType: LineType.dashed,
                indicatorType: IndicatorType.previous,
              ),
              SizedBox(height: 16),
              Text(
                'Advanced Steps Indicator',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              StepsIndicatorWidget(
                steps: [
                  StepItemModel(
                      title: Text('Step 1'), subtitle1: Text('Start Here')),
                  StepItemModel(
                      title: Text('Step 2'), subtitle1: Text('In Progress')),
                  StepItemModel(contents: Text('Final Step Content')),
                ],
                currentStep: 1,
                stepItemHeight: 160,
                indicatorType: IndicatorType.onlyCurrent,
                indicatorColor: Colors.teal,
                backgroundColor: Colors.pink.shade100,
                borderColor: Colors.teal.shade200,
                selectedIndicator: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink.shade100,
                  ),
                  child: Center(
                    child: Icon(Icons.check, color: Colors.white),
                  ),
                ),
                normalIndicator: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
