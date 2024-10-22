import 'package:flutter/material.dart';
import 'package:let/core/widgets/search_bar_widget.dart';
import 'package:let/features/home/domain/post_entity.dart';
import 'package:let/features/home/presentation/widgets/post_cards.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    // Define a list of posts with different images, titles, descriptions, and user details
    final List<PostEntity> posts = [
      PostEntity(
        profilePic: 'assets/yo.jpg',
        name: 'Hili Tesfaye',
        image: 'assets/e.jpg',
        title: 'Beautiful Sunset',
        description: 'Enjoy the view of this beautiful sunset.',
      ),
      PostEntity(
        profilePic: 'assets/yo.jpg',
        name: 'Hili Tesfaye',
        image: 'assets/e.jpg',
        title: 'Beautiful Sunset',
        description: 'Enjoy the view of this beautiful sunset.',
      ),
      PostEntity(
        profilePic: 'assets/yo.jpg',
        name: 'Hili Tesfaye',
        image: 'assets/e.jpg',
        title: 'Beautiful Sunset',
        description: 'Enjoy the view of this beautiful sunset.',
      ),
      PostEntity(
        profilePic: 'assets/yo.jpg',
        name: 'Hili Tesfaye',
        image: 'assets/e.jpg',
        title: 'Beautiful Sunset',
        description: 'Enjoy the view of this beautiful sunset.',
      ),
    ];

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomSearchBarWidget(
            controller: searchController,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 0.8,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: PostCardsWidget(post: posts[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
