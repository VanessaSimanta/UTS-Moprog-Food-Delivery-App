import 'dart:math';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uts_mobile_programming/widget/app_bar_widget.dart';

class TrackingProgressScreen extends StatefulWidget {
  const TrackingProgressScreen({super.key});

  @override
  _TrackingProgressScreenState createState() => _TrackingProgressScreenState();
}

class _TrackingProgressScreenState extends State<TrackingProgressScreen> {
  int currentStep = 2; // Example current step

  final List<String> orderSteps = [
    "Order Received",
    "Preparing",
    "Out for Delivery",
    "Arriving Soon",
    "Delivered",
  ];

  final List<IconData> stepIcons = [
    Icons.receipt,
    Icons.kitchen,
    Icons.local_shipping,
    Icons.timer,
    Icons.check_circle,
  ];

  bool showFinishButton = false;

  // Randomize order status but avoid picking the same step
  void randomizeStep() {
    int newStep;
    do {
      newStep = Random().nextInt(orderSteps.length);
    } while (newStep == currentStep);

    setState(() {
      currentStep = newStep;

      // Show the "Finish your order" button when the status is "Delivered"
      if (currentStep == orderSteps.length - 1) {
        showFinishButton = true;
      } else {
        showFinishButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          "Track Your Order",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        showBackArrow: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Track Your Order",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 30),

              // Playful Progress Bar
              CircularPercentIndicator(
                radius: 100.0,
                lineWidth: 13.0,
                animation: true,
                percent: (currentStep + 1) / orderSteps.length,
                center: Icon(
                  stepIcons[currentStep],
                  size: 50,
                  color: Colors.orange,
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.orange,
                backgroundColor: Colors.orange.shade100,
              ),

              const SizedBox(height: 30),

              // Stair-like order progress steps with background for the active step
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: orderSteps.asMap().entries.map((entry) {
                  int stepIndex = entry.key;
                  bool isActive = stepIndex == currentStep;

                  return Padding(
                    padding: EdgeInsets.only(
                      left: stepIndex *
                          20.0, // Indent progressively for "stairs" effect
                      bottom: 20.0, // Space between steps
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: isActive
                            ? Colors.orange.withOpacity(0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            stepIcons[stepIndex],
                            size: 30,
                            color: stepIndex <= currentStep
                                ? Colors.orange
                                : Colors.grey.shade400,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            entry.value,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: stepIndex <= currentStep
                                  ? Colors.orange
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 40),

              Text(
                "Estimated Arrival: 15 mins",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: randomizeStep,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.orange, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Randomize Status"),
              ),

              const SizedBox(height: 20),

              // "Finish your order" button with bounce animation when the status is "Delivered"
              AnimatedOpacity(
                opacity: showFinishButton ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: AnimatedPadding(
                  padding: EdgeInsets.only(
                      top: showFinishButton ? 0 : 50), // Bounce effect
                  duration: const Duration(milliseconds: 500),
                  child: ElevatedButton(
                    onPressed: showFinishButton
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ReviewScreen(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Button color
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      textStyle: const TextStyle(fontSize: 18),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      "Finish Your Order",
                      style: TextStyle(color: Colors.white),
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

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Order"),
      ),
      body: const Center(
        child: Text(
          "Thank you for your order! Leave a review below.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
