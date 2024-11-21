class PostEntity {
  final String? profilePic;
  final String name;
  String? image;
  final String title;
  final String description;
  final String timePosted;
  bool isFavorite;

  PostEntity({
    required this.description,
    required this.name,
    this.profilePic,
    required this.title,
    required this.timePosted,
    this.isFavorite = false,
    this.image,
  });
}
