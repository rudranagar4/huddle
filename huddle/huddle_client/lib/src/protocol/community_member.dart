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

abstract class CommunityMember implements _i1.SerializableModel {
  CommunityMember._({
    this.id,
    required this.communityId,
    required this.studentId,
    required this.joinedAt,
  });

  factory CommunityMember({
    int? id,
    required int communityId,
    required int studentId,
    required DateTime joinedAt,
  }) = _CommunityMemberImpl;

  factory CommunityMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityMember(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      studentId: jsonSerialization['studentId'] as int,
      joinedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['joinedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int communityId;

  int studentId;

  DateTime joinedAt;

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommunityMember copyWith({
    int? id,
    int? communityId,
    int? studentId,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'studentId': studentId,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityMemberImpl extends CommunityMember {
  _CommunityMemberImpl({
    int? id,
    required int communityId,
    required int studentId,
    required DateTime joinedAt,
  }) : super._(
         id: id,
         communityId: communityId,
         studentId: studentId,
         joinedAt: joinedAt,
       );

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommunityMember copyWith({
    Object? id = _Undefined,
    int? communityId,
    int? studentId,
    DateTime? joinedAt,
  }) {
    return CommunityMember(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      studentId: studentId ?? this.studentId,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}
