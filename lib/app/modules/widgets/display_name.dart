import 'package:flutter/material.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({
    super.key,
    this.prefix = "",
    required this.firstName,
    required this.secondName,
     this.suffix = "",
  });
  final String prefix;
  final String firstName;
  final String secondName;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$prefix $firstName $secondName $suffix",
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Color(0xff608dbc),
      ),
    );
  }
}
