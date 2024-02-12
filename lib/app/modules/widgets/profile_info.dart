import 'package:flutter/material.dart';
import 'package:tasks/app/modules/widgets/display_name.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
  });

  final num userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey,
            width: 3.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(image),
          ),
        ),
      ),
      title: DisplayName(
        firstName: firstName,
        secondName: lastName,
      ),
      subtitle: Text(
        email,
        style: TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
