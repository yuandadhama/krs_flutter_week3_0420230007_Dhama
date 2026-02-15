import 'package:flutter/material.dart';

class KrsDetailScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedCourses;
  final int totalCredits;

  const KrsDetailScreen(this.selectedCourses, this.totalCredits, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KRS Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selected Courses:", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            ...selectedCourses.map((course) {
              return Text("- ${course["name"]} (${course["credits"]} Credits)");
            }),
            const SizedBox(height: 20),
            Text(
              "Total Credits: $totalCredits",
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
