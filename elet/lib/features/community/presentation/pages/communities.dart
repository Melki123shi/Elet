import 'package:flutter/material.dart';
import 'package:let/core/widgets/search_bar_widget.dart';
import 'package:let/features/community/domain/entity/profile_entity.dart';
import 'package:let/features/community/presentation/widgets/profile_card_widget.dart';

class OsiPage extends StatelessWidget {
  const OsiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProfileEntity> profiles = [
      ProfileEntity(
        profilePic: 'assets/yo.jpg',
        name: 'Hili Tesfaye',
        title: 'Software Engineer',
        connections: '500+ Connections',
      ),
      ProfileEntity(
        profilePic: 'assets/yo.jpg',
        name: 'Hili Tesfaye',
        title: 'Product Manager',
        connections: '300 Connections',
      ),
      ProfileEntity(
        profilePic: 'assets/profile3.jpg',
        name: 'Hili Tesfaye',
        title: 'UX Designer',
        connections: '150 Connections',
      ),
      ProfileEntity(
        profilePic: 'assets/profile3.jpg',
        name: 'John Doe',
        title: 'UX Designer',
        connections: '150 Connections',
      ),
      ProfileEntity(
        profilePic: 'assets/profile3.jpg',
        name: 'John Doe',
        title: 'UX Designer',
        connections: '150 Connections',
      ),
      ProfileEntity(
        profilePic: 'assets/profile3.jpg',
        name: 'John Doe',
        title: 'UX Designer',
        connections: '150 Connections',
      ),
    ];

    final TextEditingController seacrchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Search bar container
          CustomSearchBarWidget(controller: seacrchController),
          // Grid with profiles
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio:
                  0.60, // Adjust to control width/height ratio of items
              mainAxisSpacing: 20, // Space between items vertically
              crossAxisSpacing: 20, // Space between items horizontally
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: profiles.map((profile) {
                return ProfileCardWidget(profile: profile);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
