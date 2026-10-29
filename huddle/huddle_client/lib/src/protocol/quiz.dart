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

abstract class Quiz implements _i1.SerializableModel {
  Quiz._({
    this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.durationMinutes,
    required this.questionCount,
    required this.difficulty,
  });

  factory Quiz({
    int? id,
    required String title,
    required String subject,
    required String description,
    required int durationMinutes,
    required int questionCount,
    required String difficulty,
  }) = _QuizImpl;

  factory Quiz.fromJson(Map<String, dynamic> jsonSerialization) {
    return Quiz(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      subject: jsonSerialization['subject'] as String,
      description: jsonSerialization['description'] as String,
      durationMinutes: jsonSerialization['durationMinutes'] as int,
      questionCount: jsonSerialization['questionCount'] as int,
      difficulty: jsonSerialization['difficulty'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String subject;

  String description;

  int durationMinutes;

  int questionCount;

  String difficulty;

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Quiz copyWith({
    int? id,
    String? title,
    String? subject,
    String? description,
    int? durationMinutes,
    int? questionCount,
    String? difficulty,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Quiz',
      if (id != null) 'id': id,
      'title': title,
      'subject': subject,
      'description': description,
      'durationMinutes': durationMinutes,
      'questionCount': questionCount,
      'difficulty': difficulty,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizImpl extends Quiz {
  _QuizImpl({
    int? id,
    required String title,
    required String subject,
    required String description,
    required int durationMinutes,
    required int questionCount,
    required String difficulty,
  }) : super._(
         id: id,
         title: title,
         subject: subject,
         description: description,
         durationMinutes: durationMinutes,
         questionCount: questionCount,
         difficulty: difficulty,
       );

  /// Returns a shallow copy of this [Quiz]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Quiz copyWith({
    Object? id = _Undefined,
    String? title,
    String? subject,
    String? description,
    int? durationMinutes,
    int? questionCount,
    String? difficulty,
  }) {
    return Quiz(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      questionCount: questionCount ?? this.questionCount,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
