import 'package:oonstagram/models/User.dart';

class Post {

  final User user;
  final String image;
  final String caption;
  final DateTime createdAt;

  Post({this.user, this.image, this.caption, this.createdAt});
}
