import 'package:equatable/equatable.dart';
import 'package:let/features/authentication/data/model/user_model.dart';

class UserEntity extends Equatable {
  final String? id;
  final String name;
  final String email;
  final String password;
  final String? profilePicture;
  final String? bio;
  // final List<Post> posts;
  final String title;
  final double numberOfConnections;
  final List<String>? skills;
  final Location location;
  final List<Experience>? experiences;
  String? token;

  UserEntity(
      { this.id,
       this.bio,
      required this.email,
       this.experiences,
      required this.location,
      required this.name,
       this.numberOfConnections = 0,
      required this.password,
       this.profilePicture,
       this.skills,
      required this.title,
      this.token});

  @override
  List<Object?> get props => [
        id,
        bio,
        email,
        experiences,
        location,
        name,
        numberOfConnections,
        password,
        profilePicture,
        skills,
        title,
        token
      ];
}

class Location extends Equatable {
  final String city;
  final String country;

  const Location({
    required this.city,
    required this.country,
  });

  @override
  List<Object?> get props => [];
}

class Experience extends Equatable {
  final String workTitle;
  final String startDate;
  final String description;
  final String endDate;

  const Experience({
    required this.workTitle,
    required this.description,
    required this.endDate,
    required this.startDate,
  });
  @override
  List<Object?> get props => [];
}
