import 'package:flutter/material.dart';
import 'package:let/features/home/domain/post_entity.dart';

class PostCardsWidget extends StatefulWidget {
  final PostEntity post;

  const PostCardsWidget({
    super.key,
    required this.post,
  });

  @override
  State<PostCardsWidget> createState() => _PostCardsWidgetState();
}

class _PostCardsWidgetState extends State<PostCardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile picture and name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(widget.post.profilePic!),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.post.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                     IconButton(
                    icon: Icon(Icons.comment, color: Color.fromARGB(255, 2, 69, 151), size: 20,),
                    onPressed: () {
                      // Add comment functionality here
                    },
                  ),
                  ],
                ),
                Row(
                  children: [
                   IconButton(
                  icon: const Icon(Icons.share, color: Color.fromARGB(255, 2, 69, 151)),
                  onPressed: () {
                    // Add share functionality here
                  },
                ),
                  IconButton(
                    icon: widget.post.isFavorite
                        ? const Icon(
                            Icons.favorite_outlined,
                            color: Colors.redAccent,
                          )
                        : const Icon(Icons.favorite_border),
                    onPressed: () {
                      // Add like functionality here
                      setState(() {
                        widget.post.isFavorite = !widget.post.isFavorite;
                      });
                    },
                  ),
                  
                 
                ]),
              ],
            ),
          ),
          // Text content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.post.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
               
                
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Image or content
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.post.image), // Post image
                  fit: BoxFit
                      .cover, // Ensure the image covers the entire container
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
