import 'package:flutter/material.dart';

class SubjectComponent extends StatelessWidget {
  final String subjectName;

  final String testOne;
  final String assignmentOne;
  final String testTwo;
  final String assignmentTwo;
  final String finalExam;

  const SubjectComponent(
      {super.key,
      required this.subjectName,
      required this.testOne,
      required this.assignmentOne,
      required this.testTwo,
      required this.assignmentTwo,
      required this.finalExam});

  @override
  Widget build(BuildContext context) {
    TextStyle contentStyle = Theme.of(context).textTheme.bodyText1!;
    return Padding(
      padding: const EdgeInsets.all(8.0),


      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        color: Colors.white70,
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subjectName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTextRow("Test One", testOne, contentStyle),
            _buildTextRow("Assignment One", assignmentOne, contentStyle),
            _buildTextRow("Test Two", testTwo, contentStyle),
            _buildTextRow("Assignment Two", assignmentTwo, contentStyle),
            _buildTextRow("Final Exam", finalExam, contentStyle),
          ],
      ),
        ),
      )
    );
  }

  Widget _buildTextRow(String label, String value, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: $value",
          style: style.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
            fontSize: 16
          ),
        ),
      ],
    );
  }
}
