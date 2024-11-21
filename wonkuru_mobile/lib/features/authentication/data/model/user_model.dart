import 'package:let/features/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
   UserModel(
      {required super.id,
      required super.bio,
      required super.email,
      required super.experiences,
      required super.location,
      required super.name,
      required super.numberOfConnections,
      required super.password,
      required super.profilePicture,
      required super.skills,
      required super.title,
      super.token,
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['hashed_password'] ?? '',
      title: json['title'] ?? '',
      bio: json['bio'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      experiences: json['experiences']
          ? json['experiences']
              .map((exp) => {
                    Experience(
                      description: exp.description ?? '',
                      workTitle: exp.workTitle ?? '',
                      endDate: exp.endDate ?? DateTime.now().toString(),
                      startDate: exp.startDate ?? DateTime.now().toString(),
                    )
                  })
              .toList()
          : [],
      location: json['location']
              .map((loc) => {
                    Location(
                      city: loc.city ?? '',
                      country: loc.country ?? '',
                    )
                  })
              .toList() ??
          [],
      numberOfConnections: double.parse(json['numberOfConnections']),
      skills: json['skills'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'title': title,
      'bio': bio,
      'profilePicture': profilePicture,
      'experiences': experiences,
      'location': location,
      'skills': skills,
      'numberOfConnections': numberOfConnections,
    };
  }


  factory UserModel.toModel(UserEntity user) {
    return UserModel(
      id: user.id,
      bio: user.bio,
      email: user.email,
      experiences: user.experiences,
      location: user.location,
      name: user.name,
      numberOfConnections: user.numberOfConnections,
      password: user.password,
      profilePicture: user.profilePicture,
      skills: user.skills,
      title: user.title,
    );
  }

}
