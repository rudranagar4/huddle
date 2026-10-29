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
import 'app_notification.dart' as _i2;
import 'bookmark.dart' as _i3;
import 'campus_event.dart' as _i4;
import 'chat_message.dart' as _i5;
import 'community.dart' as _i6;
import 'community_member.dart' as _i7;
import 'community_post.dart' as _i8;
import 'event_registration.dart' as _i9;
import 'greetings/greeting.dart' as _i10;
import 'match_result.dart' as _i11;
import 'quiz.dart' as _i12;
import 'quiz_attempt.dart' as _i13;
import 'quiz_question.dart' as _i14;
import 'student.dart' as _i15;
import 'study_request.dart' as _i16;
import 'package:huddle_client/src/protocol/bookmark.dart' as _i17;
import 'package:huddle_client/src/protocol/chat_message.dart' as _i18;
import 'package:huddle_client/src/protocol/community.dart' as _i19;
import 'package:huddle_client/src/protocol/community_post.dart' as _i20;
import 'package:huddle_client/src/protocol/campus_event.dart' as _i21;
import 'package:huddle_client/src/protocol/match_result.dart' as _i22;
import 'package:huddle_client/src/protocol/app_notification.dart' as _i23;
import 'package:huddle_client/src/protocol/student.dart' as _i24;
import 'package:huddle_client/src/protocol/quiz.dart' as _i25;
import 'package:huddle_client/src/protocol/quiz_question.dart' as _i26;
import 'package:huddle_client/src/protocol/quiz_attempt.dart' as _i27;
import 'package:huddle_client/src/protocol/study_request.dart' as _i28;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i29;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i30;
export 'app_notification.dart';
export 'bookmark.dart';
export 'campus_event.dart';
export 'chat_message.dart';
export 'community.dart';
export 'community_member.dart';
export 'community_post.dart';
export 'event_registration.dart';
export 'greetings/greeting.dart';
export 'match_result.dart';
export 'quiz.dart';
export 'quiz_attempt.dart';
export 'quiz_question.dart';
export 'student.dart';
export 'study_request.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.AppNotification) {
      return _i2.AppNotification.fromJson(data) as T;
    }
    if (t == _i3.Bookmark) {
      return _i3.Bookmark.fromJson(data) as T;
    }
    if (t == _i4.CampusEvent) {
      return _i4.CampusEvent.fromJson(data) as T;
    }
    if (t == _i5.ChatMessage) {
      return _i5.ChatMessage.fromJson(data) as T;
    }
    if (t == _i6.Community) {
      return _i6.Community.fromJson(data) as T;
    }
    if (t == _i7.CommunityMember) {
      return _i7.CommunityMember.fromJson(data) as T;
    }
    if (t == _i8.CommunityPost) {
      return _i8.CommunityPost.fromJson(data) as T;
    }
    if (t == _i9.EventRegistration) {
      return _i9.EventRegistration.fromJson(data) as T;
    }
    if (t == _i10.Greeting) {
      return _i10.Greeting.fromJson(data) as T;
    }
    if (t == _i11.MatchResult) {
      return _i11.MatchResult.fromJson(data) as T;
    }
    if (t == _i12.Quiz) {
      return _i12.Quiz.fromJson(data) as T;
    }
    if (t == _i13.QuizAttempt) {
      return _i13.QuizAttempt.fromJson(data) as T;
    }
    if (t == _i14.QuizQuestion) {
      return _i14.QuizQuestion.fromJson(data) as T;
    }
    if (t == _i15.Student) {
      return _i15.Student.fromJson(data) as T;
    }
    if (t == _i16.StudyRequest) {
      return _i16.StudyRequest.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.AppNotification?>()) {
      return (data != null ? _i2.AppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Bookmark?>()) {
      return (data != null ? _i3.Bookmark.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CampusEvent?>()) {
      return (data != null ? _i4.CampusEvent.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ChatMessage?>()) {
      return (data != null ? _i5.ChatMessage.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Community?>()) {
      return (data != null ? _i6.Community.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CommunityMember?>()) {
      return (data != null ? _i7.CommunityMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CommunityPost?>()) {
      return (data != null ? _i8.CommunityPost.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.EventRegistration?>()) {
      return (data != null ? _i9.EventRegistration.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Greeting?>()) {
      return (data != null ? _i10.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.MatchResult?>()) {
      return (data != null ? _i11.MatchResult.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Quiz?>()) {
      return (data != null ? _i12.Quiz.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.QuizAttempt?>()) {
      return (data != null ? _i13.QuizAttempt.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.QuizQuestion?>()) {
      return (data != null ? _i14.QuizQuestion.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Student?>()) {
      return (data != null ? _i15.Student.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.StudyRequest?>()) {
      return (data != null ? _i16.StudyRequest.fromJson(data) : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i17.Bookmark>) {
      return (data as List).map((e) => deserialize<_i17.Bookmark>(e)).toList()
          as T;
    }
    if (t == List<_i18.ChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_i18.ChatMessage>(e))
              .toList()
          as T;
    }
    if (t == List<_i19.Community>) {
      return (data as List).map((e) => deserialize<_i19.Community>(e)).toList()
          as T;
    }
    if (t == List<_i20.CommunityPost>) {
      return (data as List)
              .map((e) => deserialize<_i20.CommunityPost>(e))
              .toList()
          as T;
    }
    if (t == List<_i21.CampusEvent>) {
      return (data as List)
              .map((e) => deserialize<_i21.CampusEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_i22.MatchResult>) {
      return (data as List)
              .map((e) => deserialize<_i22.MatchResult>(e))
              .toList()
          as T;
    }
    if (t == List<_i23.AppNotification>) {
      return (data as List)
              .map((e) => deserialize<_i23.AppNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_i24.Student>) {
      return (data as List).map((e) => deserialize<_i24.Student>(e)).toList()
          as T;
    }
    if (t == List<_i25.Quiz>) {
      return (data as List).map((e) => deserialize<_i25.Quiz>(e)).toList() as T;
    }
    if (t == List<_i26.QuizQuestion>) {
      return (data as List)
              .map((e) => deserialize<_i26.QuizQuestion>(e))
              .toList()
          as T;
    }
    if (t == List<_i27.QuizAttempt>) {
      return (data as List)
              .map((e) => deserialize<_i27.QuizAttempt>(e))
              .toList()
          as T;
    }
    if (t == List<_i28.StudyRequest>) {
      return (data as List)
              .map((e) => deserialize<_i28.StudyRequest>(e))
              .toList()
          as T;
    }
    try {
      return _i29.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i30.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.AppNotification => 'AppNotification',
      _i3.Bookmark => 'Bookmark',
      _i4.CampusEvent => 'CampusEvent',
      _i5.ChatMessage => 'ChatMessage',
      _i6.Community => 'Community',
      _i7.CommunityMember => 'CommunityMember',
      _i8.CommunityPost => 'CommunityPost',
      _i9.EventRegistration => 'EventRegistration',
      _i10.Greeting => 'Greeting',
      _i11.MatchResult => 'MatchResult',
      _i12.Quiz => 'Quiz',
      _i13.QuizAttempt => 'QuizAttempt',
      _i14.QuizQuestion => 'QuizQuestion',
      _i15.Student => 'Student',
      _i16.StudyRequest => 'StudyRequest',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('huddle.', '');
    }

    switch (data) {
      case _i2.AppNotification():
        return 'AppNotification';
      case _i3.Bookmark():
        return 'Bookmark';
      case _i4.CampusEvent():
        return 'CampusEvent';
      case _i5.ChatMessage():
        return 'ChatMessage';
      case _i6.Community():
        return 'Community';
      case _i7.CommunityMember():
        return 'CommunityMember';
      case _i8.CommunityPost():
        return 'CommunityPost';
      case _i9.EventRegistration():
        return 'EventRegistration';
      case _i10.Greeting():
        return 'Greeting';
      case _i11.MatchResult():
        return 'MatchResult';
      case _i12.Quiz():
        return 'Quiz';
      case _i13.QuizAttempt():
        return 'QuizAttempt';
      case _i14.QuizQuestion():
        return 'QuizQuestion';
      case _i15.Student():
        return 'Student';
      case _i16.StudyRequest():
        return 'StudyRequest';
    }
    className = _i29.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i30.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'AppNotification') {
      return deserialize<_i2.AppNotification>(data['data']);
    }
    if (dataClassName == 'Bookmark') {
      return deserialize<_i3.Bookmark>(data['data']);
    }
    if (dataClassName == 'CampusEvent') {
      return deserialize<_i4.CampusEvent>(data['data']);
    }
    if (dataClassName == 'ChatMessage') {
      return deserialize<_i5.ChatMessage>(data['data']);
    }
    if (dataClassName == 'Community') {
      return deserialize<_i6.Community>(data['data']);
    }
    if (dataClassName == 'CommunityMember') {
      return deserialize<_i7.CommunityMember>(data['data']);
    }
    if (dataClassName == 'CommunityPost') {
      return deserialize<_i8.CommunityPost>(data['data']);
    }
    if (dataClassName == 'EventRegistration') {
      return deserialize<_i9.EventRegistration>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i10.Greeting>(data['data']);
    }
    if (dataClassName == 'MatchResult') {
      return deserialize<_i11.MatchResult>(data['data']);
    }
    if (dataClassName == 'Quiz') {
      return deserialize<_i12.Quiz>(data['data']);
    }
    if (dataClassName == 'QuizAttempt') {
      return deserialize<_i13.QuizAttempt>(data['data']);
    }
    if (dataClassName == 'QuizQuestion') {
      return deserialize<_i14.QuizQuestion>(data['data']);
    }
    if (dataClassName == 'Student') {
      return deserialize<_i15.Student>(data['data']);
    }
    if (dataClassName == 'StudyRequest') {
      return deserialize<_i16.StudyRequest>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i29.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i30.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i29.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i30.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
