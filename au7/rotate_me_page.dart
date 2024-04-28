import 'package:flutter/material.dart';
import 'dart:math';
import 'home_page.dart';

class RotateMePage extends StatefulWidget {
  @override
  _RotateMePageState createState() => _RotateMePageState();
}

class _RotateMePageState extends State<RotateMePage> {
  double _rotationAngle = 0; // Variable to track rotation angle

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RotateMe Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Container(
        color: Colors.blueGrey[500], // Consistent background color
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16), // Padding before the image
            // Rotatable image
            Transform.rotate(
              angle: _rotationAngle * pi / 180, // Convert degrees to radians
              child: Image.asset(
                'assets/logo.png',
                height: 100,
              ),
            ),
            const SizedBox(height: 16), // Padding after the image
            // Container for buttons with consistent styling
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blueGrey[200], // Consistent container color
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Ensure buttons stretch across the width
                children: [
                  // Button to rotate the image by 360 degrees
                  SizedBox(
                    height: 50, // Consistent button height
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _rotationAngle += 360; // Rotate by 360 degrees
                        });
                      },
                      child: const Text(
                        "Rotate Label",
                        style: TextStyle(color: Colors.black), // Consistent button text
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Consistent button shape
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Padding between buttons
                  // Button to go back to the previous page
                  SizedBox(
                    height: 50, // Consistent button height
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Back to the previous page
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.black), // Consistent button text color
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8), // Consistent button shape
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
