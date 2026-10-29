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

import 'package:serverpod/serverpod.dart' as _i1;
import 'student.dart' as _i2;
import 'package:huddle_server/src/generated/protocol.dart' as _i3;

abstract class MatchResult
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  MatchResult._({
    required this.student,
    required this.matchScore,
    required this.sharedSubjects,
    required this.sharedInterests,
    required this.compatibilityReason,
  });

  factory MatchResult({
    required _i2.Student student,
    required int matchScore,
    required List<String> sharedSubjects,
    required List<String> sharedInterests,
    required String compatibilityReason,
  }) = _MatchResultImpl;

  factory MatchResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return MatchResult(
      student: _i3.Protocol().deserialize<_i2.Student>(
        jsonSerialization['student'],
      ),
      matchScore: jsonSerialization['matchScore'] as int,
      sharedSubjects: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['sharedSubjects'],
      ),
      sharedInterests: _i3.Protocol().deserialize<List<String>>(
        jsonSerialization['sharedInterests'],
      ),
      compatibilityReason: jsonSerialization['compatibilityReason'] as String,
    );
  }

  _i2.Student student;

  int matchScore;

  List<String> sharedSubjects;

  List<String> sharedInterests;

  String compatibilityReason;

  /// Returns a shallow copy of this [MatchResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MatchResult copyWith({
    _i2.Student? student,
    int? matchScore,
    List<String>? sharedSubjects,
    List<String>? sharedInterests,
    String? compatibilityReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'MatchResult',
      'student': student.toJson(),
      'matchScore': matchScore,
      'sharedSubjects': sharedSubjects.toJson(),
      'sharedInterests': sharedInterests.toJson(),
      'compatibilityReason': compatibilityReason,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'MatchResult',
      'student': student.toJsonForProtocol(),
      'matchScore': matchScore,
      'sharedSubjects': sharedSubjects.toJson(),
      'sharedInterests': sharedInterests.toJson(),
      'compatibilityReason': compatibilityReason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MatchResultImpl extends MatchResult {
  _MatchResultImpl({
    required _i2.Student student,
    required int matchScore,
    required List<String> sharedSubjects,
    required List<String> sharedInterests,
    required String compatibilityReason,
  }) : super._(
         student: student,
         matchScore: matchScore,
         sharedSubjects: sharedSubjects,
         sharedInterests: sharedInterests,
         compatibilityReason: compatibilityReason,
       );

  /// Returns a shallow copy of this [MatchResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MatchResult copyWith({
    _i2.Student? student,
    int? matchScore,
    List<String>? sharedSubjects,
    List<String>? sharedInterests,
    String? compatibilityReason,
  }) {
    return MatchResult(
      student: student ?? this.student.copyWith(),
      matchScore: matchScore ?? this.matchScore,
      sharedSubjects:
          sharedSubjects ?? this.sharedSubjects.map((e0) => e0).toList(),
      sharedInterests:
          sharedInterests ?? this.sharedInterests.map((e0) => e0).toList(),
      compatibilityReason: compatibilityReason ?? this.compatibilityReason,
    );
  }
}
