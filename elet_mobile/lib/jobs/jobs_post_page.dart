import 'package:flutter/material.dart';
import 'package:let/core/widgets/button_widget.dart';

class JobPostsPage extends StatelessWidget {
  const JobPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of job posts with details
    final List<Map<String, String>> jobPosts = [
      {
        'jobTitle': 'Software Engineer',
        'companyName': 'Tech Corp',
        'location': 'San Francisco, CA',
        'description': 'Develop and maintain software applications.',
      },
      {
        'jobTitle': 'Product Manager',
        'companyName': 'Innovate Inc.',
        'location': 'New York, NY',
        'description': 'Lead product development from ideation to launch.',
      },
      {
        'jobTitle': 'UX Designer',
        'companyName': 'Creative Studio',
        'location': 'Austin, TX',
        'description': 'Design user-centric digital experiences.',
      },
      {
        'jobTitle': 'Data Scientist',
        'companyName': 'DataWorks',
        'location': 'Boston, MA',
        'description':
            'Analyze and interpret complex data to aid decision making.',
      },
      // Add more job posts as needed...
    ];

    return Scaffold(
      backgroundColor:Colors.white, 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Jobs',
                style: TextStyle(
                  color: const Color.fromARGB(255, 3, 253, 87),
                  fontWeight: FontWeight.w500,
                  fontSize: 34,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: jobPosts.length,
                itemBuilder: (context, index) {
                  final job = jobPosts[index];
                  return Card(
                    color: Colors.white,
                    elevation: 4.0,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Job Title
                          Text(
                            job['jobTitle']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                job['companyName']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.location_on,
                                  size: 16, color: Colors.grey),
                              Text(
                                job['location']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            job['description']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ButtonWidget(
                              title: 'Apply',
                              onPressed: () => {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: JobPostsPage(),
    ));
