import 'package:flutter/material.dart';
import 'package:flutter_krs_application/screens/krs_details_screen.dart';

class KrsScreen extends StatefulWidget {
  @override
  _KrsScreenState createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  int selectedCredits = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KRS")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selected Credits: $selectedCredits",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Add 3 Credits"),
              onPressed: () {
                setState(() {
                  selectedCredits += 3;
                });
              },
            ),
            ElevatedButton(
              child: Text("View Summary"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KrsDetailScreen(selectedCredits),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
