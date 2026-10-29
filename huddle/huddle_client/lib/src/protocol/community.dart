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

abstract class Community implements _i1.SerializableModel {
  Community._({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    this.iconUrl,
    this.bannerUrl,
    required this.memberCount,
    required this.upcomingEventsCount,
  });

  factory Community({
    int? id,
    required String name,
    required String category,
    required String description,
    String? iconUrl,
    String? bannerUrl,
    required int memberCount,
    required int upcomingEventsCount,
  }) = _CommunityImpl;

  factory Community.fromJson(Map<String, dynamic> jsonSerialization) {
    return Community(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      category: jsonSerialization['category'] as String,
      description: jsonSerialization['description'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      bannerUrl: jsonSerialization['bannerUrl'] as String?,
      memberCount: jsonSerialization['memberCount'] as int,
      upcomingEventsCount: jsonSerialization['upcomingEventsCount'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String category;

  String description;

  String? iconUrl;

  String? bannerUrl;

  int memberCount;

  int upcomingEventsCount;

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Community copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? iconUrl,
    String? bannerUrl,
    int? memberCount,
    int? upcomingEventsCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'category': category,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (bannerUrl != null) 'bannerUrl': bannerUrl,
      'memberCount': memberCount,
      'upcomingEventsCount': upcomingEventsCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityImpl extends Community {
  _CommunityImpl({
    int? id,
    required String name,
    required String category,
    required String description,
    String? iconUrl,
    String? bannerUrl,
    required int memberCount,
    required int upcomingEventsCount,
  }) : super._(
         id: id,
         name: name,
         category: category,
         description: description,
         iconUrl: iconUrl,
         bannerUrl: bannerUrl,
         memberCount: memberCount,
         upcomingEventsCount: upcomingEventsCount,
       );

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Community copyWith({
    Object? id = _Undefined,
    String? name,
    String? category,
    String? description,
    Object? iconUrl = _Undefined,
    Object? bannerUrl = _Undefined,
    int? memberCount,
    int? upcomingEventsCount,
  }) {
    return Community(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      bannerUrl: bannerUrl is String? ? bannerUrl : this.bannerUrl,
      memberCount: memberCount ?? this.memberCount,
      upcomingEventsCount: upcomingEventsCount ?? this.upcomingEventsCount,
    );
  }
}
