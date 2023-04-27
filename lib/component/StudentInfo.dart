// imports
import 'package:flutter/material.dart';

// student information component
class StudentInfo extends StatelessWidget {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String grade;

  const StudentInfo({
    super.key,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.grade,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle = Theme.of(context).textTheme.headline6!;
    TextStyle contentStyle = Theme.of(context).textTheme.bodyText1!;
    // define styles for heading and content text

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: Colors.lightBlueAccent,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: headingStyle.copyWith(
                      fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                _buildTextRow('First Name', firstName, contentStyle),
                _buildTextRow('Last Name', lastName, contentStyle),
                _buildTextRow('Email', email, contentStyle),
                _buildTextRow('Grade', grade, contentStyle),
                // using a helper function to create rows of label and value text
              ],
            ),
          ),
        ));
  }

  Widget _buildTextRow(String label, String value, TextStyle style) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: $value",
          style: style.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
