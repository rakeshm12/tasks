import 'package:flutter/material.dart';

class DisplayName extends StatelessWidget {
  const DisplayName({
    super.key,
    required this.firstName,
    required this.secondName,
    required this.prefix,
    required this.suffix,
  });

  final String firstName;
  final String secondName;
  final String prefix;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$prefix $firstName $secondName $suffix",
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
