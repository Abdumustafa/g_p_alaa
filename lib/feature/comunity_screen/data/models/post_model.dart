import 'package:g_p_alaa/feature/comunity_screen/data/models/comment_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/like_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/media_model.dart';
import 'package:g_p_alaa/feature/comunity_screen/data/models/user_model.dart';

class PostModel {
  final String id;
  final User user;
  final String content;
  final List<MediaModel> media;
  final String tag;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int commentCount;
  final List<LikeModel> likes;
  final int likesCount;
  final List<CommentModel> comments;
  final bool isLiked;

  PostModel({
    required this.id,
    required this.user,
    required this.content,
    required this.media,
    required this.tag,
    required this.createdAt,
    required this.updatedAt,
    required this.commentCount,
    required this.likes,
    required this.likesCount,
    required this.comments,
    required this.isLiked,
  });

  factory PostModel.fromJson(jsonData) {
    return PostModel(
      id: jsonData("_id"),
      user: User.fromJson(jsonData['userId']),
      content: jsonData['content'],
      media:
          (jsonData['media'] as List).map((e) => MediaModel.fromJson(e)).toList(),
      tag: jsonData['tag'],
      createdAt: DateTime.parse(jsonData['createdAt']),
      updatedAt: DateTime.parse(jsonData['updatedAt']),
      commentCount: jsonData['commentCount'],
      likes: (jsonData['likes'] as List).map((e) => LikeModel.fromJson(e)).toList(),
      likesCount: jsonData['likesCount'],
      comments:
          (jsonData['comments'] as List).map((e) => CommentModel.fromJson(e)).toList(),
      isLiked: jsonData['isLiked'],
    );
  }
}
