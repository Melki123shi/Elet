class PostEntity {
  final String? profilePic;
  final String name;
  final String image;
  final String title;
  final String description;
  bool isFavorite;

  PostEntity(
      {required this.description,
      required this.name,
      required this.image,
      this.profilePic,
      required this.title,
      this.isFavorite = false,
      });
}
