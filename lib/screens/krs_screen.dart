import 'package:flutter/material.dart';
import 'package:flutter_krs_application/screens/krs_details_screen.dart';

final List<Map<String, dynamic>> courses = [
  {"name": "Data Structure & Algorithms", "credits": 3},
  {"name": "Database Systems", "credits": 3},
  {"name": "Computer Networks", "credits": 2},
  {"name": "Operating Systems", "credits": 4},
  {"name": "Cloud Computing", "credits": 3},
  {"name": "Web and Application Security", "credits": 3},
  {"name": "Practical Applicaion Development", "credits": 3},
  {"name": "Framework-Based Programming", "credits": 3},
  {"name": "Object Oriented Design and Patterns", "credits": 3},
];

class KrsScreen extends StatefulWidget {
  @override
  _KrsScreenState createState() => _KrsScreenState();
}

class _KrsScreenState extends State<KrsScreen> {
  List<Map<String, dynamic>> selectedCourses = [];

  bool isSelected(Map<String, dynamic> course) {
    return selectedCourses.contains(course);
  }

  int get totalCredits {
    return selectedCourses.fold(
      0,
      (sum, course) => sum + (course["credits"] as int),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Course")),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Select your course", style: TextStyle(fontSize: 30)),
              const SizedBox(height: 25),
              Column(
                children: courses.map((course) {
                  return CourseCard(
                    courseName: course["name"],
                    totalCredits: course["credits"],
                    isSelected: isSelected(course),
                    onSelect: () {
                      setState(() {
                        if (!isSelected(course)) {
                          selectedCourses.add(course);
                        } else {
                          selectedCourses.remove(course);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),

              Text(
                "Total Credits: $totalCredits",
                style: const TextStyle(fontSize: 20),
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
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String courseName;
  final int totalCredits;
  final bool isSelected;
  final VoidCallback onSelect;

  const CourseCard({
    super.key,
    required this.courseName,
    required this.totalCredits,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple.shade100 : Colors.white,
            border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(courseName, style: const TextStyle(fontSize: 16)),
                  Text("$totalCredits Credits"),
                ],
              ),
              ElevatedButton(
                onPressed: onSelect,
                child: Text(isSelected ? "Remove" : "Add"),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
