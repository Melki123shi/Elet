import 'package:flutter/material.dart';
import 'package:let/core/widgets/button_widget.dart';
import 'package:let/features/community/domain/entity/profile_entity.dart';

class ProfileCardWidget extends StatelessWidget {
  final ProfileEntity profile;
  const ProfileCardWidget({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage(profile.profilePic), // Profile picture
            ),
            const SizedBox(height: 10),
            // Name
            Text(
              profile.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            // Title
            Text(
              profile.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            // Number of connections
            Text(
              profile.connections,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            const Spacer(),
            // Add Connection Button
            ButtonWidget(title: 'connect', onPressed: () => {},),
          ],
        ),
      ),
    );
  }
}
