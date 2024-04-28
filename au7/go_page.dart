import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page.dart';

class GoPage extends StatefulWidget {
  @override
  _GoPageState createState() => _GoPageState();
}

class _GoPageState extends State<GoPage> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Go Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: Container(
        color: Colors.blueGrey[500], // Background color
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.blueGrey[200], // Light blue-gray container color
              child: TextField(
                controller: _inputController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Mobile/Web",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white, // White background for the text field
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blueGrey[200], // Consistent container color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Corrected spelling
                children: [
                  SizedBox(
                    width: 150, // Consistent button width
                    child: ElevatedButton(
                      onPressed: () async {
                        final url = "https://" + _inputController.text.trim();
                        if (await launchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Could not launch web page")),
                          );
                        }
                      },
                      child: const Text(
                        "Web",
                        style: TextStyle(color: Colors.black), // Black text
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 150, // Consistent button width
                    child: ElevatedButton(
                      onPressed: () async {
                        final phone = "tel:" + _inputController.text.trim();
                        if (await launchUrl(Uri.parse(phone))) {
                          await launchUrl(Uri.parse(phone));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Could not make a call")),
                          );
                        }
                      },
                      child: const Text(
                        "Mobile",
                        style: TextStyle(color: Colors.black), // Black text
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Container for "Back Home" with consistent style
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.blueGrey[200], // Consistent container color
              child: SizedBox(
                width: 150, // Consistent button width
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back Home",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
