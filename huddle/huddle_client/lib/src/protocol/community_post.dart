/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class CommunityPost implements _i1.SerializableModel {
  CommunityPost._({
    this.id,
    required this.communityId,
    required this.authorName,
    this.authorAvatar,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.likesCount,
  });

  factory CommunityPost({
    int? id,
    required int communityId,
    required String authorName,
    String? authorAvatar,
    required String title,
    required String content,
    required DateTime createdAt,
    required int likesCount,
  }) = _CommunityPostImpl;

  factory CommunityPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityPost(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      authorName: jsonSerialization['authorName'] as String,
      authorAvatar: jsonSerialization['authorAvatar'] as String?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      likesCount: jsonSerialization['likesCount'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int communityId;

  String authorName;

  String? authorAvatar;

  String title;

  String content;

  DateTime createdAt;

  int likesCount;

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommunityPost copyWith({
    int? id,
    int? communityId,
    String? authorName,
    String? authorAvatar,
    String? title,
    String? content,
    DateTime? createdAt,
    int? likesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorName': authorName,
      if (authorAvatar != null) 'authorAvatar': authorAvatar,
      'title': title,
      'content': content,
      'createdAt': createdAt.toJson(),
      'likesCount': likesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityPostImpl extends CommunityPost {
  _CommunityPostImpl({
    int? id,
    required int communityId,
    required String authorName,
    String? authorAvatar,
    required String title,
    required String content,
    required DateTime createdAt,
    required int likesCount,
  }) : super._(
         id: id,
         communityId: communityId,
         authorName: authorName,
         authorAvatar: authorAvatar,
         title: title,
         content: content,
         createdAt: createdAt,
         likesCount: likesCount,
       );

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommunityPost copyWith({
    Object? id = _Undefined,
    int? communityId,
    String? authorName,
    Object? authorAvatar = _Undefined,
    String? title,
    String? content,
    DateTime? createdAt,
    int? likesCount,
  }) {
    return CommunityPost(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar is String? ? authorAvatar : this.authorAvatar,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
    );
  }
}
