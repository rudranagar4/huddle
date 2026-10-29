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

abstract class Bookmark implements _i1.SerializableModel {
  Bookmark._({
    this.id,
    required this.studentId,
    required this.itemType,
    required this.itemId,
    required this.createdAt,
  });

  factory Bookmark({
    int? id,
    required int studentId,
    required String itemType,
    required int itemId,
    required DateTime createdAt,
  }) = _BookmarkImpl;

  factory Bookmark.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bookmark(
      id: jsonSerialization['id'] as int?,
      studentId: jsonSerialization['studentId'] as int,
      itemType: jsonSerialization['itemType'] as String,
      itemId: jsonSerialization['itemId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int studentId;

  String itemType;

  int itemId;

  DateTime createdAt;

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Bookmark copyWith({
    int? id,
    int? studentId,
    String? itemType,
    int? itemId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'studentId': studentId,
      'itemType': itemType,
      'itemId': itemId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookmarkImpl extends Bookmark {
  _BookmarkImpl({
    int? id,
    required int studentId,
    required String itemType,
    required int itemId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         studentId: studentId,
         itemType: itemType,
         itemId: itemId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Bookmark copyWith({
    Object? id = _Undefined,
    int? studentId,
    String? itemType,
    int? itemId,
    DateTime? createdAt,
  }) {
    return Bookmark(
      id: id is int? ? id : this.id,
      studentId: studentId ?? this.studentId,
      itemType: itemType ?? this.itemType,
      itemId: itemId ?? this.itemId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
