import 'package:flutter/material.dart';

class AddCourseScreen extends StatefulWidget {
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final courseController = TextEditingController();
  final creditController = TextEditingController();

  String? errorMessage;

  void onSubmit() {
    final name = courseController.text.trim();
    final credit = int.tryParse(creditController.text);

    // ❌ Validation 1
    if (name.isEmpty) {
      setState(() {
        errorMessage = "Course name cannot be empty";
      });
      return;
    }

    // ❌ Validation 2
    if (credit == null || credit <= 0) {
      setState(() {
        errorMessage = "Invalid credit value";
      });
      return;
    }

    // ✅ VALID → RETURN DATA
    Navigator.pop(context, {"name": name, "credits": credit});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Course")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 20),

            TextField(
              controller: courseController,
              decoration: const InputDecoration(
                labelText: "Course Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: creditController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Credits",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            if (errorMessage != null)
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),

            const SizedBox(height: 20),

            ElevatedButton(onPressed: onSubmit, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
