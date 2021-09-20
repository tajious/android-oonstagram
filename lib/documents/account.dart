import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 1)
class Account extends HiveObject {

  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String fullName;

  @HiveField(3)
  String title;

  @HiveField(4)
  String bio;

  @HiveField(5)
  String website;

  @HiveField(6)
  String image;

}