import 'package:g_p_alaa/feature/comunity_screen/data/models/user_model.dart';

class CommentModel {
  final String id;
  final User user;
  final String postId;
  final String content;
  final DateTime createdAt;
  final int repliesCount;
  final List<dynamic> likes;
  final int likesCount;
  final bool isLiked;

  CommentModel({
    required this.id,
    required this.user,
    required this.postId,
    required this.content,
    required this.createdAt,
    required this.repliesCount,
    required this.likes,
    required this.likesCount,
    required this.isLiked,
  });

  factory CommentModel.fromJson(jsonData) {
    return CommentModel(
      id: jsonData['_id'],
      user: User.fromJson(jsonData['userId']),
      postId: jsonData['postId'],
      content: jsonData['content'],
      createdAt: DateTime.parse(jsonData['createdAt']),
      repliesCount: jsonData['repliesCount'],
      likes: jsonData['likes'],
      likesCount: jsonData['likesCount'],
      isLiked: jsonData['isLiked'],
    );
  }
}
