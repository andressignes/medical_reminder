import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

/// Gender of user
enum Gender {
  /// Enum value male.
  male,

  /// Enum value female.
  female,

  /// Enum value genderless.
  genderless,
}

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
@JsonSerializable()
class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    required this.email,
    this.name,
    this.birthDate,
    this.gender,
  });

  /// {@macro user}
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// toJson
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// The current user's id.
  final String id;

  /// The current user's email address.
  final String email;

  /// The current user's name (display name).
  final String? name;

  /// The birth date of the current user.
  final DateTime? birthDate;

  /// Gender of current user.
  final Gender? gender;

  @override
  List<Object?> get props => [id, name, email, birthDate, gender];

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '', email: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  User copyWith({
    String? id,
    String? email,
    String? name,
    DateTime? birthDate,
    Gender? gender,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
        gender: gender ?? this.gender,
      );
}
