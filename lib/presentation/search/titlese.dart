import 'package:flutter/material.dart';

class titleName extends StatelessWidget {
  final String title;
  const titleName({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 174, 168, 168),
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
