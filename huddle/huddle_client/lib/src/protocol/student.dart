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
import 'package:huddle_client/src/protocol/protocol.dart' as _i2;

abstract class Student implements _i1.SerializableModel {
  Student._({
    this.id,
    this.userId,
    required this.fullName,
    required this.email,
    required this.college,
    required this.course,
    required this.year,
    this.bio,
    this.avatarUrl,
    required this.subjects,
    required this.interests,
    required this.studyMode,
    required this.studyTime,
    required this.studyStyle,
  });

  factory Student({
    int? id,
    int? userId,
    required String fullName,
    required String email,
    required String college,
    required String course,
    required int year,
    String? bio,
    String? avatarUrl,
    required List<String> subjects,
    required List<String> interests,
    required String studyMode,
    required String studyTime,
    required String studyStyle,
  }) = _StudentImpl;

  factory Student.fromJson(Map<String, dynamic> jsonSerialization) {
    return Student(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      fullName: jsonSerialization['fullName'] as String,
      email: jsonSerialization['email'] as String,
      college: jsonSerialization['college'] as String,
      course: jsonSerialization['course'] as String,
      year: jsonSerialization['year'] as int,
      bio: jsonSerialization['bio'] as String?,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      subjects: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['subjects'],
      ),
      interests: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['interests'],
      ),
      studyMode: jsonSerialization['studyMode'] as String,
      studyTime: jsonSerialization['studyTime'] as String,
      studyStyle: jsonSerialization['studyStyle'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  String fullName;

  String email;

  String college;

  String course;

  int year;

  String? bio;

  String? avatarUrl;

  List<String> subjects;

  List<String> interests;

  String studyMode;

  String studyTime;

  String studyStyle;

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Student copyWith({
    int? id,
    int? userId,
    String? fullName,
    String? email,
    String? college,
    String? course,
    int? year,
    String? bio,
    String? avatarUrl,
    List<String>? subjects,
    List<String>? interests,
    String? studyMode,
    String? studyTime,
    String? studyStyle,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Student',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'fullName': fullName,
      'email': email,
      'college': college,
      'course': course,
      'year': year,
      if (bio != null) 'bio': bio,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'subjects': subjects.toJson(),
      'interests': interests.toJson(),
      'studyMode': studyMode,
      'studyTime': studyTime,
      'studyStyle': studyStyle,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudentImpl extends Student {
  _StudentImpl({
    int? id,
    int? userId,
    required String fullName,
    required String email,
    required String college,
    required String course,
    required int year,
    String? bio,
    String? avatarUrl,
    required List<String> subjects,
    required List<String> interests,
    required String studyMode,
    required String studyTime,
    required String studyStyle,
  }) : super._(
         id: id,
         userId: userId,
         fullName: fullName,
         email: email,
         college: college,
         course: course,
         year: year,
         bio: bio,
         avatarUrl: avatarUrl,
         subjects: subjects,
         interests: interests,
         studyMode: studyMode,
         studyTime: studyTime,
         studyStyle: studyStyle,
       );

  /// Returns a shallow copy of this [Student]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Student copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    String? fullName,
    String? email,
    String? college,
    String? course,
    int? year,
    Object? bio = _Undefined,
    Object? avatarUrl = _Undefined,
    List<String>? subjects,
    List<String>? interests,
    String? studyMode,
    String? studyTime,
    String? studyStyle,
  }) {
    return Student(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      college: college ?? this.college,
      course: course ?? this.course,
      year: year ?? this.year,
      bio: bio is String? ? bio : this.bio,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      subjects: subjects ?? this.subjects.map((e0) => e0).toList(),
      interests: interests ?? this.interests.map((e0) => e0).toList(),
      studyMode: studyMode ?? this.studyMode,
      studyTime: studyTime ?? this.studyTime,
      studyStyle: studyStyle ?? this.studyStyle,
    );
  }
}
