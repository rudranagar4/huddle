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

abstract class QuizQuestion implements _i1.SerializableModel {
  QuizQuestion._({
    this.id,
    required this.quizId,
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });

  factory QuizQuestion({
    int? id,
    required int quizId,
    required String questionText,
    required List<String> options,
    required int correctOptionIndex,
    required String explanation,
  }) = _QuizQuestionImpl;

  factory QuizQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizQuestion(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      questionText: jsonSerialization['questionText'] as String,
      options: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['options'],
      ),
      correctOptionIndex: jsonSerialization['correctOptionIndex'] as int,
      explanation: jsonSerialization['explanation'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int quizId;

  String questionText;

  List<String> options;

  int correctOptionIndex;

  String explanation;

  /// Returns a shallow copy of this [QuizQuestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QuizQuestion copyWith({
    int? id,
    int? quizId,
    String? questionText,
    List<String>? options,
    int? correctOptionIndex,
    String? explanation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizQuestion',
      if (id != null) 'id': id,
      'quizId': quizId,
      'questionText': questionText,
      'options': options.toJson(),
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizQuestionImpl extends QuizQuestion {
  _QuizQuestionImpl({
    int? id,
    required int quizId,
    required String questionText,
    required List<String> options,
    required int correctOptionIndex,
    required String explanation,
  }) : super._(
         id: id,
         quizId: quizId,
         questionText: questionText,
         options: options,
         correctOptionIndex: correctOptionIndex,
         explanation: explanation,
       );

  /// Returns a shallow copy of this [QuizQuestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QuizQuestion copyWith({
    Object? id = _Undefined,
    int? quizId,
    String? questionText,
    List<String>? options,
    int? correctOptionIndex,
    String? explanation,
  }) {
    return QuizQuestion(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options.map((e0) => e0).toList(),
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
    );
  }
}
