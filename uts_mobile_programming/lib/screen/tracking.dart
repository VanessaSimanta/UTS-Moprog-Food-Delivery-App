import 'package:flutter/material.dart';

class TrackingProgressScreen extends StatefulWidget {
  const TrackingProgressScreen({super.key});

  @override
  _TrackingProgressScreenState createState() => _TrackingProgressScreenState();
}

class _TrackingProgressScreenState extends State<TrackingProgressScreen> {
  // contoh current step
  int currentStep = 2; // mungkin nanti bisa dirandomize

  final List<String> orderSteps = [
    "Order Received",
    "Preparing",
    "Out for Delivery",
    "Arriving Soon",
    "Delivered",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Your Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order Progress",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Stepper(
              currentStep: currentStep,
              onStepTapped: (step) => setState(() => currentStep = step),
              steps: orderSteps.map((step) {
                int stepIndex = orderSteps.indexOf(step);
                return Step(
                  title: Text(step),
                  content: Text(''),
                  isActive: stepIndex <= currentStep,
                  state: stepIndex < currentStep
                      ? StepState.complete
                      : StepState.indexed,
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Text(
              "Estimated Arrival: 15 mins",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (currentStep < orderSteps.length - 1) {
                    currentStep++;
                  }
                });
              },
              child: Text("Simulate Next Status"),
            ),
          ],
        ),
      ),
    );
  }
}
