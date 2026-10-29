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

abstract class QuizAttempt implements _i1.SerializableModel {
  QuizAttempt._({
    this.id,
    required this.quizId,
    required this.studentId,
    required this.score,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.completedAt,
  });

  factory QuizAttempt({
    int? id,
    required int quizId,
    required int studentId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
    required int wrongAnswers,
    required DateTime completedAt,
  }) = _QuizAttemptImpl;

  factory QuizAttempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizAttempt(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      studentId: jsonSerialization['studentId'] as int,
      score: jsonSerialization['score'] as int,
      totalQuestions: jsonSerialization['totalQuestions'] as int,
      correctAnswers: jsonSerialization['correctAnswers'] as int,
      wrongAnswers: jsonSerialization['wrongAnswers'] as int,
      completedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['completedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int quizId;

  int studentId;

  int score;

  int totalQuestions;

  int correctAnswers;

  int wrongAnswers;

  DateTime completedAt;

  /// Returns a shallow copy of this [QuizAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QuizAttempt copyWith({
    int? id,
    int? quizId,
    int? studentId,
    int? score,
    int? totalQuestions,
    int? correctAnswers,
    int? wrongAnswers,
    DateTime? completedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizAttempt',
      if (id != null) 'id': id,
      'quizId': quizId,
      'studentId': studentId,
      'score': score,
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'completedAt': completedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizAttemptImpl extends QuizAttempt {
  _QuizAttemptImpl({
    int? id,
    required int quizId,
    required int studentId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
    required int wrongAnswers,
    required DateTime completedAt,
  }) : super._(
         id: id,
         quizId: quizId,
         studentId: studentId,
         score: score,
         totalQuestions: totalQuestions,
         correctAnswers: correctAnswers,
         wrongAnswers: wrongAnswers,
         completedAt: completedAt,
       );

  /// Returns a shallow copy of this [QuizAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QuizAttempt copyWith({
    Object? id = _Undefined,
    int? quizId,
    int? studentId,
    int? score,
    int? totalQuestions,
    int? correctAnswers,
    int? wrongAnswers,
    DateTime? completedAt,
  }) {
    return QuizAttempt(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      studentId: studentId ?? this.studentId,
      score: score ?? this.score,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}
