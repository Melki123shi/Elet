import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor:Color(0xFF0D2243),
       backgroundColor:Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header with Background Image
            Stack(
              clipBehavior: Clip.none, // Allow overflow of the CircleAvatar
              alignment: Alignment.center,
              children: [
                // Background Image
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/e.jpg'), // Replace with your background image asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Details
                const Positioned(
                  top: 120, // Position the profile picture to overlap the background
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/yo.jpg'), // Replace with your profile image asset
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Hili Tesfaye',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          // color: Colors.white, // Change to black for better contrast outside background image
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Software Engineer at Tech Corp',
                        style: TextStyle(
                          fontSize: 16,
                          // color: Colors.white, // Change to black54 for better contrast
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.location_on, color: Colors.black54, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'San Francisco, CA',
                            style: TextStyle(
                              fontSize: 14,
                              // color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150), // Adjusted to provide space for the overlapping profile picture

            // About Section
            _buildSectionHeader('About'),
            
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Experienced software engineer with a passion for developing innovative programs that expedite the efficiency and effectiveness of organizational success. Well-versed in technology and writing code to create systems that are reliable and user-friendly.',
                style: TextStyle(fontSize: 16,color: Colors.grey),
              ),
            ),

            // Experience Section
            _buildSectionHeader('Experience'),
            _buildExperienceItem(
              title: 'Software Engineer',
              company: 'Tech',
              duration: 'Jan 2023 - Present',
              location: 'Addis, ET',
              description:
                  'Developed and maintained web applications, collaborated with cross-functional teams to define project specifications, and implemented new features based on user feedback.',
            ),
            _buildExperienceItem(
              title: 'Junior Developer',
              company: 'Innovate Inc.',
              duration: 'Jun 2018 - Dec 2019',
              location: 'New York, NY',
              description:
                  'Assisted in developing mobile applications, wrote unit tests, and collaborated with senior developers to improve code quality and performance.',
            ),

            // Education Section
            _buildSectionHeader('Education'),
            _buildExperienceItem(
              title: 'B.Sc. in Computer Science',
              company: 'University of California, Berkeley',
              duration: '2014 - 2018',
              location: 'Berkeley, CA',
              description: '',
            ),

            // Skills Section
            _buildSectionHeader('Skills'),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  Chip(
                    label: Text('Flutter'),
                  ),
                  Chip(
                    label: Text('Dart'),
                  ),
                  Chip(
                    label: Text('JavaScript'),
                  ),
                  Chip(
                    label: Text('Python'),
                  ),
                  Chip(
                    label: Text('React'),
                  ),
                  Chip(
                    label: Text('Node.js'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
      ),
    );
  }

  Widget _buildExperienceItem({
    required String title,
    required String company,
    required String duration,
    required String location,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$company • $location',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            duration,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          if (description.isNotEmpty)
            const SizedBox(height: 8),
          if (description.isNotEmpty)
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey
              ),
            ),
        ],
      ),
    );
  }
}
