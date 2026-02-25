import 'package:flutter/material.dart';
import 'package:flutter_krs_application/screens/add_course_screen.dart';
import 'package:flutter_krs_application/screens/krs_details_screen.dart';

class KrsScreen extends StatefulWidget {
  @override
  _KrsScreenState createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  List<Map<String, dynamic>> selectedCourses = [];

  int get totalCredits {
    return selectedCourses.fold(
      0,
      (sum, course) => sum + (course["credits"] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("KRS Semester")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text("Selected Courses", style: TextStyle(fontSize: 24)),

            const SizedBox(height: 20),

            Expanded(
              child: selectedCourses.isEmpty
                  ? const Center(child: Text("No course selected"))
                  : ListView.builder(
                      itemCount: selectedCourses.length,
                      itemBuilder: (context, index) {
                        final course = selectedCourses[index];
                        return ListTile(
                          title: Text(course["name"]),
                          subtitle: Text("${course["credits"]} Credits"),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                selectedCourses.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
            ),

            const SizedBox(height: 10),

            Text(
              "Total Credits: $totalCredits",
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCourseScreen()),
                );

                // 🔐 STATE UPDATE GATE
                if (result != null) {
                  setState(() {
                    selectedCourses.add(result);
                  });
                }
              },
              child: const Text("Add Course"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: selectedCourses.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              KrsDetailScreen(selectedCourses, totalCredits),
                        ),
                      );
                    },
              child: const Text("View Summary"),
            ),
          ],
        ),
      ),
    );
  }
}
