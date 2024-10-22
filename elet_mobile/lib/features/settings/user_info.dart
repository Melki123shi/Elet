import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of notifications
    final List<Map<String, dynamic>> notifications = [
      {
        'icon': Icons.mail_outline,
        'title': 'New Job Alert',
        'subtitle': 'Software Engineer positions available near you.',
        'time': '2 hours ago',
      },
      {
        'icon': Icons.notifications_active_outlined,
        'title': 'Profile Views',
        'subtitle': 'Your profile has been viewed 5 times today.',
        'time': '4 hours ago',
      },
      {
        'icon': Icons.thumb_up_off_alt,
        'title': 'Job Application',
        'subtitle': 'Your application for UX Designer has been accepted.',
        'time': '1 day ago',
      },
      {
        'icon': Icons.work_outline,
        'title': 'Job Recommendation',
        'subtitle': 'New Product Manager roles matching your profile.',
        'time': '3 days ago',
      },
      // Add more notifications as needed...
    ];

    return Scaffold(
     backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              color: Colors.white,
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: Icon(
                  notification['icon'] as IconData,
                  color: Color(0xFF04FAA0),
                  size: 40,
                ),
                title: Text(
                  notification['title']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification['subtitle']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      notification['time']!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  // Handle notification tap
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
