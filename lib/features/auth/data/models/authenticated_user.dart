import 'package:hive/hive.dart';

part 'authenticated_user.g.dart';

@HiveType(typeId: 0)
class AuthenticatedUserModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final String email;
  @HiveField(5)
  final String password;
  @HiveField(6)
  final String? picture;
  AuthenticatedUserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.email,
    required this.password,
    this.picture,
  });
}
