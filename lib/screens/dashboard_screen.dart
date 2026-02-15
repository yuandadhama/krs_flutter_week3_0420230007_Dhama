import 'package:flutter/material.dart';
import 'package:flutter_krs_application/screens/krs_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body: Column(
        children: [
          Container(
            width: 400,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "YUANDA DHAMA PRANDITA",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Teknologi Informasi (S1)"),
                    Text("Universitas International Jakarta"),
                  ],
                ),
                SizedBox(width: 20),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Icon(Icons.person, size: 50),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              ElevatedButton(
                child: Text("KRS"),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => KrsScreen()),
                  ),
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
