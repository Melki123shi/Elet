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
          CustomSearchBarWidget(controller: seacrchController),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio:
                  0.80, 
              mainAxisSpacing: 20, 
              crossAxisSpacing: 20, 
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
