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

import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i1;
import 'package:serverpod_client/serverpod_client.dart' as _i2;
import 'dart:async' as _i3;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i4;
import 'package:huddle_client/src/protocol/bookmark.dart' as _i5;
import 'package:huddle_client/src/protocol/chat_message.dart' as _i6;
import 'package:huddle_client/src/protocol/community.dart' as _i7;
import 'package:huddle_client/src/protocol/community_post.dart' as _i8;
import 'package:huddle_client/src/protocol/campus_event.dart' as _i9;
import 'package:huddle_client/src/protocol/match_result.dart' as _i10;
import 'package:huddle_client/src/protocol/app_notification.dart' as _i11;
import 'package:huddle_client/src/protocol/student.dart' as _i12;
import 'package:huddle_client/src/protocol/quiz.dart' as _i13;
import 'package:huddle_client/src/protocol/quiz_question.dart' as _i14;
import 'package:huddle_client/src/protocol/quiz_attempt.dart' as _i15;
import 'package:huddle_client/src/protocol/study_request.dart' as _i16;
import 'package:huddle_client/src/protocol/greetings/greeting.dart' as _i17;
import 'protocol.dart' as _i18;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _i1.EndpointEmailIdpBase {
  EndpointEmailIdp(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<_i4.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i3.Future<_i2.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i3.Future<String> verifyRegistrationCode({
    required _i2.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i3.Future<_i4.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i3.Future<_i2.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i2.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i3.Future<String> verifyPasswordResetCode({
    required _i2.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i3.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _i3.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _i4.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i3.Future<_i4.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i4.AuthSuccess>(
    'jwtRefresh',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointBookmark extends _i2.EndpointRef {
  EndpointBookmark(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'bookmark';

  _i3.Future<bool> toggleBookmark(
    int studentId,
    String itemType,
    int itemId,
  ) => caller.callServerEndpoint<bool>(
    'bookmark',
    'toggleBookmark',
    {
      'studentId': studentId,
      'itemType': itemType,
      'itemId': itemId,
    },
  );

  _i3.Future<bool> isBookmarked(
    int studentId,
    String itemType,
    int itemId,
  ) => caller.callServerEndpoint<bool>(
    'bookmark',
    'isBookmarked',
    {
      'studentId': studentId,
      'itemType': itemType,
      'itemId': itemId,
    },
  );

  _i3.Future<List<_i5.Bookmark>> getBookmarks(
    int studentId, {
    String? itemType,
  }) => caller.callServerEndpoint<List<_i5.Bookmark>>(
    'bookmark',
    'getBookmarks',
    {
      'studentId': studentId,
      'itemType': itemType,
    },
  );
}

/// {@category Endpoint}
class EndpointChat extends _i2.EndpointRef {
  EndpointChat(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'chat';

  _i3.Future<List<_i6.ChatMessage>> getConversation(
    int student1Id,
    int student2Id,
  ) => caller.callServerEndpoint<List<_i6.ChatMessage>>(
    'chat',
    'getConversation',
    {
      'student1Id': student1Id,
      'student2Id': student2Id,
    },
  );

  _i3.Future<_i6.ChatMessage> sendMessage(
    int senderId,
    int receiverId,
    String message,
  ) => caller.callServerEndpoint<_i6.ChatMessage>(
    'chat',
    'sendMessage',
    {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
    },
  );
}

/// {@category Endpoint}
class EndpointCommunity extends _i2.EndpointRef {
  EndpointCommunity(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'community';

  _i3.Future<List<_i7.Community>> getCommunities({
    String? category,
    String? search,
  }) => caller.callServerEndpoint<List<_i7.Community>>(
    'community',
    'getCommunities',
    {
      'category': category,
      'search': search,
    },
  );

  _i3.Future<_i7.Community?> getCommunityDetails(int communityId) =>
      caller.callServerEndpoint<_i7.Community?>(
        'community',
        'getCommunityDetails',
        {'communityId': communityId},
      );

  _i3.Future<bool> joinCommunity(
    int communityId,
    int studentId,
  ) => caller.callServerEndpoint<bool>(
    'community',
    'joinCommunity',
    {
      'communityId': communityId,
      'studentId': studentId,
    },
  );

  _i3.Future<bool> leaveCommunity(
    int communityId,
    int studentId,
  ) => caller.callServerEndpoint<bool>(
    'community',
    'leaveCommunity',
    {
      'communityId': communityId,
      'studentId': studentId,
    },
  );

  _i3.Future<List<_i7.Community>> getMyCommunities(int studentId) =>
      caller.callServerEndpoint<List<_i7.Community>>(
        'community',
        'getMyCommunities',
        {'studentId': studentId},
      );

  _i3.Future<List<_i8.CommunityPost>> getCommunityPosts(int communityId) =>
      caller.callServerEndpoint<List<_i8.CommunityPost>>(
        'community',
        'getCommunityPosts',
        {'communityId': communityId},
      );

  _i3.Future<_i8.CommunityPost> addCommunityPost(_i8.CommunityPost post) =>
      caller.callServerEndpoint<_i8.CommunityPost>(
        'community',
        'addCommunityPost',
        {'post': post},
      );
}

/// {@category Endpoint}
class EndpointEvent extends _i2.EndpointRef {
  EndpointEvent(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'event';

  _i3.Future<List<_i9.CampusEvent>> getEvents({
    String? category,
    String? search,
  }) => caller.callServerEndpoint<List<_i9.CampusEvent>>(
    'event',
    'getEvents',
    {
      'category': category,
      'search': search,
    },
  );

  _i3.Future<_i9.CampusEvent?> getEventDetails(int eventId) =>
      caller.callServerEndpoint<_i9.CampusEvent?>(
        'event',
        'getEventDetails',
        {'eventId': eventId},
      );

  _i3.Future<bool> registerForEvent(
    int eventId,
    int studentId,
  ) => caller.callServerEndpoint<bool>(
    'event',
    'registerForEvent',
    {
      'eventId': eventId,
      'studentId': studentId,
    },
  );

  _i3.Future<bool> unregisterFromEvent(
    int eventId,
    int studentId,
  ) => caller.callServerEndpoint<bool>(
    'event',
    'unregisterFromEvent',
    {
      'eventId': eventId,
      'studentId': studentId,
    },
  );

  _i3.Future<List<_i9.CampusEvent>> getMyRegisteredEvents(int studentId) =>
      caller.callServerEndpoint<List<_i9.CampusEvent>>(
        'event',
        'getMyRegisteredEvents',
        {'studentId': studentId},
      );
}

/// {@category Endpoint}
class EndpointMatch extends _i2.EndpointRef {
  EndpointMatch(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'match';

  _i3.Future<List<_i10.MatchResult>> getSuggestedMatches(
    int currentStudentId,
  ) => caller.callServerEndpoint<List<_i10.MatchResult>>(
    'match',
    'getSuggestedMatches',
    {'currentStudentId': currentStudentId},
  );
}

/// {@category Endpoint}
class EndpointNotification extends _i2.EndpointRef {
  EndpointNotification(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'notification';

  _i3.Future<List<_i11.AppNotification>> getNotifications(int studentId) =>
      caller.callServerEndpoint<List<_i11.AppNotification>>(
        'notification',
        'getNotifications',
        {'studentId': studentId},
      );

  _i3.Future<bool> markAsRead(int notificationId) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'markAsRead',
        {'notificationId': notificationId},
      );

  _i3.Future<bool> markAllAsRead(int studentId) =>
      caller.callServerEndpoint<bool>(
        'notification',
        'markAllAsRead',
        {'studentId': studentId},
      );
}

/// {@category Endpoint}
class EndpointProfile extends _i2.EndpointRef {
  EndpointProfile(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  _i3.Future<_i12.Student?> getProfile(int studentId) =>
      caller.callServerEndpoint<_i12.Student?>(
        'profile',
        'getProfile',
        {'studentId': studentId},
      );

  _i3.Future<_i12.Student> getMyProfile() =>
      caller.callServerEndpoint<_i12.Student>(
        'profile',
        'getMyProfile',
        {},
      );

  _i3.Future<_i12.Student> createOrUpdateProfile(_i12.Student student) =>
      caller.callServerEndpoint<_i12.Student>(
        'profile',
        'createOrUpdateProfile',
        {'student': student},
      );

  _i3.Future<List<_i12.Student>> getAllStudents({
    String? course,
    int? year,
    String? subject,
  }) => caller.callServerEndpoint<List<_i12.Student>>(
    'profile',
    'getAllStudents',
    {
      'course': course,
      'year': year,
      'subject': subject,
    },
  );
}

/// {@category Endpoint}
class EndpointQuiz extends _i2.EndpointRef {
  EndpointQuiz(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'quiz';

  _i3.Future<List<_i13.Quiz>> getQuizzes({String? subject}) =>
      caller.callServerEndpoint<List<_i13.Quiz>>(
        'quiz',
        'getQuizzes',
        {'subject': subject},
      );

  _i3.Future<List<_i14.QuizQuestion>> getQuizQuestions(int quizId) =>
      caller.callServerEndpoint<List<_i14.QuizQuestion>>(
        'quiz',
        'getQuizQuestions',
        {'quizId': quizId},
      );

  _i3.Future<_i15.QuizAttempt> submitQuizAttempt(_i15.QuizAttempt attempt) =>
      caller.callServerEndpoint<_i15.QuizAttempt>(
        'quiz',
        'submitQuizAttempt',
        {'attempt': attempt},
      );

  _i3.Future<List<_i15.QuizAttempt>> getMyQuizAttempts(int studentId) =>
      caller.callServerEndpoint<List<_i15.QuizAttempt>>(
        'quiz',
        'getMyQuizAttempts',
        {'studentId': studentId},
      );
}

/// {@category Endpoint}
class EndpointStudyRequest extends _i2.EndpointRef {
  EndpointStudyRequest(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'studyRequest';

  _i3.Future<_i16.StudyRequest> sendStudyRequest(
    int senderId,
    int receiverId,
    String? message,
  ) => caller.callServerEndpoint<_i16.StudyRequest>(
    'studyRequest',
    'sendStudyRequest',
    {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
    },
  );

  _i3.Future<List<_i16.StudyRequest>> getIncomingRequests(int studentId) =>
      caller.callServerEndpoint<List<_i16.StudyRequest>>(
        'studyRequest',
        'getIncomingRequests',
        {'studentId': studentId},
      );

  _i3.Future<List<_i16.StudyRequest>> getOutgoingRequests(int studentId) =>
      caller.callServerEndpoint<List<_i16.StudyRequest>>(
        'studyRequest',
        'getOutgoingRequests',
        {'studentId': studentId},
      );

  _i3.Future<List<_i16.StudyRequest>> getAcceptedRequests(int studentId) =>
      caller.callServerEndpoint<List<_i16.StudyRequest>>(
        'studyRequest',
        'getAcceptedRequests',
        {'studentId': studentId},
      );

  _i3.Future<bool> respondToRequest(
    int requestId,
    String newStatus,
  ) => caller.callServerEndpoint<bool>(
    'studyRequest',
    'respondToRequest',
    {
      'requestId': requestId,
      'newStatus': newStatus,
    },
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i2.EndpointRef {
  EndpointGreeting(_i2.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i3.Future<_i17.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i17.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i1.Caller(client);
    serverpod_auth_core = _i4.Caller(client);
  }

  late final _i1.Caller serverpod_auth_idp;

  late final _i4.Caller serverpod_auth_core;
}

class Client extends _i2.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i2.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i2.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i18.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    bookmark = EndpointBookmark(this);
    chat = EndpointChat(this);
    community = EndpointCommunity(this);
    event = EndpointEvent(this);
    match = EndpointMatch(this);
    notification = EndpointNotification(this);
    profile = EndpointProfile(this);
    quiz = EndpointQuiz(this);
    studyRequest = EndpointStudyRequest(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointBookmark bookmark;

  late final EndpointChat chat;

  late final EndpointCommunity community;

  late final EndpointEvent event;

  late final EndpointMatch match;

  late final EndpointNotification notification;

  late final EndpointProfile profile;

  late final EndpointQuiz quiz;

  late final EndpointStudyRequest studyRequest;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i2.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'bookmark': bookmark,
    'chat': chat,
    'community': community,
    'event': event,
    'match': match,
    'notification': notification,
    'profile': profile,
    'quiz': quiz,
    'studyRequest': studyRequest,
    'greeting': greeting,
  };

  @override
  Map<String, _i2.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
