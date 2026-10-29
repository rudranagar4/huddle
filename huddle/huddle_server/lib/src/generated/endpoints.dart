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
import '../auth/email_idp_endpoint.dart' as _i2;
import '../auth/jwt_refresh_endpoint.dart' as _i3;
import '../endpoints/bookmark_endpoint.dart' as _i4;
import '../endpoints/chat_endpoint.dart' as _i5;
import '../endpoints/community_endpoint.dart' as _i6;
import '../endpoints/event_endpoint.dart' as _i7;
import '../endpoints/match_endpoint.dart' as _i8;
import '../endpoints/notification_endpoint.dart' as _i9;
import '../endpoints/profile_endpoint.dart' as _i10;
import '../endpoints/quiz_endpoint.dart' as _i11;
import '../endpoints/study_request_endpoint.dart' as _i12;
import '../greetings/greeting_endpoint.dart' as _i13;
import 'package:huddle_server/src/generated/community_post.dart' as _i14;
import 'package:huddle_server/src/generated/student.dart' as _i15;
import 'package:huddle_server/src/generated/quiz_attempt.dart' as _i16;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i17;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i18;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'emailIdp': _i2.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _i3.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'bookmark': _i4.BookmarkEndpoint()
        ..initialize(
          server,
          'bookmark',
          null,
        ),
      'chat': _i5.ChatEndpoint()
        ..initialize(
          server,
          'chat',
          null,
        ),
      'community': _i6.CommunityEndpoint()
        ..initialize(
          server,
          'community',
          null,
        ),
      'event': _i7.EventEndpoint()
        ..initialize(
          server,
          'event',
          null,
        ),
      'match': _i8.MatchEndpoint()
        ..initialize(
          server,
          'match',
          null,
        ),
      'notification': _i9.NotificationEndpoint()
        ..initialize(
          server,
          'notification',
          null,
        ),
      'profile': _i10.ProfileEndpoint()
        ..initialize(
          server,
          'profile',
          null,
        ),
      'quiz': _i11.QuizEndpoint()
        ..initialize(
          server,
          'quiz',
          null,
        ),
      'studyRequest': _i12.StudyRequestEndpoint()
        ..initialize(
          server,
          'studyRequest',
          null,
        ),
      'greeting': _i13.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _i1.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i2.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _i1.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['jwtRefresh'] as _i3.JwtRefreshEndpoint)
                  .refreshAccessToken(
                    session,
                    refreshToken: params['refreshToken'],
                  ),
        ),
      },
    );
    connectors['bookmark'] = _i1.EndpointConnector(
      name: 'bookmark',
      endpoint: endpoints['bookmark']!,
      methodConnectors: {
        'toggleBookmark': _i1.MethodConnector(
          name: 'toggleBookmark',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'itemType': _i1.ParameterDescription(
              name: 'itemType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'itemId': _i1.ParameterDescription(
              name: 'itemId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['bookmark'] as _i4.BookmarkEndpoint)
                  .toggleBookmark(
                    session,
                    params['studentId'],
                    params['itemType'],
                    params['itemId'],
                  ),
        ),
        'isBookmarked': _i1.MethodConnector(
          name: 'isBookmarked',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'itemType': _i1.ParameterDescription(
              name: 'itemType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'itemId': _i1.ParameterDescription(
              name: 'itemId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['bookmark'] as _i4.BookmarkEndpoint).isBookmarked(
                    session,
                    params['studentId'],
                    params['itemType'],
                    params['itemId'],
                  ),
        ),
        'getBookmarks': _i1.MethodConnector(
          name: 'getBookmarks',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'itemType': _i1.ParameterDescription(
              name: 'itemType',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['bookmark'] as _i4.BookmarkEndpoint).getBookmarks(
                    session,
                    params['studentId'],
                    itemType: params['itemType'],
                  ),
        ),
      },
    );
    connectors['chat'] = _i1.EndpointConnector(
      name: 'chat',
      endpoint: endpoints['chat']!,
      methodConnectors: {
        'getConversation': _i1.MethodConnector(
          name: 'getConversation',
          params: {
            'student1Id': _i1.ParameterDescription(
              name: 'student1Id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'student2Id': _i1.ParameterDescription(
              name: 'student2Id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['chat'] as _i5.ChatEndpoint).getConversation(
                    session,
                    params['student1Id'],
                    params['student2Id'],
                  ),
        ),
        'sendMessage': _i1.MethodConnector(
          name: 'sendMessage',
          params: {
            'senderId': _i1.ParameterDescription(
              name: 'senderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'receiverId': _i1.ParameterDescription(
              name: 'receiverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['chat'] as _i5.ChatEndpoint).sendMessage(
                session,
                params['senderId'],
                params['receiverId'],
                params['message'],
              ),
        ),
      },
    );
    connectors['community'] = _i1.EndpointConnector(
      name: 'community',
      endpoint: endpoints['community']!,
      methodConnectors: {
        'getCommunities': _i1.MethodConnector(
          name: 'getCommunities',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'search': _i1.ParameterDescription(
              name: 'search',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .getCommunities(
                    session,
                    category: params['category'],
                    search: params['search'],
                  ),
        ),
        'getCommunityDetails': _i1.MethodConnector(
          name: 'getCommunityDetails',
          params: {
            'communityId': _i1.ParameterDescription(
              name: 'communityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .getCommunityDetails(
                    session,
                    params['communityId'],
                  ),
        ),
        'joinCommunity': _i1.MethodConnector(
          name: 'joinCommunity',
          params: {
            'communityId': _i1.ParameterDescription(
              name: 'communityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .joinCommunity(
                    session,
                    params['communityId'],
                    params['studentId'],
                  ),
        ),
        'leaveCommunity': _i1.MethodConnector(
          name: 'leaveCommunity',
          params: {
            'communityId': _i1.ParameterDescription(
              name: 'communityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .leaveCommunity(
                    session,
                    params['communityId'],
                    params['studentId'],
                  ),
        ),
        'getMyCommunities': _i1.MethodConnector(
          name: 'getMyCommunities',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .getMyCommunities(
                    session,
                    params['studentId'],
                  ),
        ),
        'getCommunityPosts': _i1.MethodConnector(
          name: 'getCommunityPosts',
          params: {
            'communityId': _i1.ParameterDescription(
              name: 'communityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .getCommunityPosts(
                    session,
                    params['communityId'],
                  ),
        ),
        'addCommunityPost': _i1.MethodConnector(
          name: 'addCommunityPost',
          params: {
            'post': _i1.ParameterDescription(
              name: 'post',
              type: _i1.getType<_i14.CommunityPost>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['community'] as _i6.CommunityEndpoint)
                  .addCommunityPost(
                    session,
                    params['post'],
                  ),
        ),
      },
    );
    connectors['event'] = _i1.EndpointConnector(
      name: 'event',
      endpoint: endpoints['event']!,
      methodConnectors: {
        'getEvents': _i1.MethodConnector(
          name: 'getEvents',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'search': _i1.ParameterDescription(
              name: 'search',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i7.EventEndpoint).getEvents(
                session,
                category: params['category'],
                search: params['search'],
              ),
        ),
        'getEventDetails': _i1.MethodConnector(
          name: 'getEventDetails',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['event'] as _i7.EventEndpoint).getEventDetails(
                    session,
                    params['eventId'],
                  ),
        ),
        'registerForEvent': _i1.MethodConnector(
          name: 'registerForEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['event'] as _i7.EventEndpoint).registerForEvent(
                    session,
                    params['eventId'],
                    params['studentId'],
                  ),
        ),
        'unregisterFromEvent': _i1.MethodConnector(
          name: 'unregisterFromEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['event'] as _i7.EventEndpoint).unregisterFromEvent(
                    session,
                    params['eventId'],
                    params['studentId'],
                  ),
        ),
        'getMyRegisteredEvents': _i1.MethodConnector(
          name: 'getMyRegisteredEvents',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['event'] as _i7.EventEndpoint)
                  .getMyRegisteredEvents(
                    session,
                    params['studentId'],
                  ),
        ),
      },
    );
    connectors['match'] = _i1.EndpointConnector(
      name: 'match',
      endpoint: endpoints['match']!,
      methodConnectors: {
        'getSuggestedMatches': _i1.MethodConnector(
          name: 'getSuggestedMatches',
          params: {
            'currentStudentId': _i1.ParameterDescription(
              name: 'currentStudentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['match'] as _i8.MatchEndpoint).getSuggestedMatches(
                    session,
                    params['currentStudentId'],
                  ),
        ),
      },
    );
    connectors['notification'] = _i1.EndpointConnector(
      name: 'notification',
      endpoint: endpoints['notification']!,
      methodConnectors: {
        'getNotifications': _i1.MethodConnector(
          name: 'getNotifications',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['notification'] as _i9.NotificationEndpoint)
                  .getNotifications(
                    session,
                    params['studentId'],
                  ),
        ),
        'markAsRead': _i1.MethodConnector(
          name: 'markAsRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['notification'] as _i9.NotificationEndpoint)
                  .markAsRead(
                    session,
                    params['notificationId'],
                  ),
        ),
        'markAllAsRead': _i1.MethodConnector(
          name: 'markAllAsRead',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['notification'] as _i9.NotificationEndpoint)
                  .markAllAsRead(
                    session,
                    params['studentId'],
                  ),
        ),
      },
    );
    connectors['profile'] = _i1.EndpointConnector(
      name: 'profile',
      endpoint: endpoints['profile']!,
      methodConnectors: {
        'getProfile': _i1.MethodConnector(
          name: 'getProfile',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['profile'] as _i10.ProfileEndpoint).getProfile(
                    session,
                    params['studentId'],
                  ),
        ),
        'getMyProfile': _i1.MethodConnector(
          name: 'getMyProfile',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .getMyProfile(session),
        ),
        'createOrUpdateProfile': _i1.MethodConnector(
          name: 'createOrUpdateProfile',
          params: {
            'student': _i1.ParameterDescription(
              name: 'student',
              type: _i1.getType<_i15.Student>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['profile'] as _i10.ProfileEndpoint)
                  .createOrUpdateProfile(
                    session,
                    params['student'],
                  ),
        ),
        'getAllStudents': _i1.MethodConnector(
          name: 'getAllStudents',
          params: {
            'course': _i1.ParameterDescription(
              name: 'course',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'year': _i1.ParameterDescription(
              name: 'year',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'subject': _i1.ParameterDescription(
              name: 'subject',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['profile'] as _i10.ProfileEndpoint).getAllStudents(
                    session,
                    course: params['course'],
                    year: params['year'],
                    subject: params['subject'],
                  ),
        ),
      },
    );
    connectors['quiz'] = _i1.EndpointConnector(
      name: 'quiz',
      endpoint: endpoints['quiz']!,
      methodConnectors: {
        'getQuizzes': _i1.MethodConnector(
          name: 'getQuizzes',
          params: {
            'subject': _i1.ParameterDescription(
              name: 'subject',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['quiz'] as _i11.QuizEndpoint).getQuizzes(
                session,
                subject: params['subject'],
              ),
        ),
        'getQuizQuestions': _i1.MethodConnector(
          name: 'getQuizQuestions',
          params: {
            'quizId': _i1.ParameterDescription(
              name: 'quizId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['quiz'] as _i11.QuizEndpoint).getQuizQuestions(
                    session,
                    params['quizId'],
                  ),
        ),
        'submitQuizAttempt': _i1.MethodConnector(
          name: 'submitQuizAttempt',
          params: {
            'attempt': _i1.ParameterDescription(
              name: 'attempt',
              type: _i1.getType<_i16.QuizAttempt>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['quiz'] as _i11.QuizEndpoint).submitQuizAttempt(
                    session,
                    params['attempt'],
                  ),
        ),
        'getMyQuizAttempts': _i1.MethodConnector(
          name: 'getMyQuizAttempts',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['quiz'] as _i11.QuizEndpoint).getMyQuizAttempts(
                    session,
                    params['studentId'],
                  ),
        ),
      },
    );
    connectors['studyRequest'] = _i1.EndpointConnector(
      name: 'studyRequest',
      endpoint: endpoints['studyRequest']!,
      methodConnectors: {
        'sendStudyRequest': _i1.MethodConnector(
          name: 'sendStudyRequest',
          params: {
            'senderId': _i1.ParameterDescription(
              name: 'senderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'receiverId': _i1.ParameterDescription(
              name: 'receiverId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'message': _i1.ParameterDescription(
              name: 'message',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['studyRequest'] as _i12.StudyRequestEndpoint)
                      .sendStudyRequest(
                        session,
                        params['senderId'],
                        params['receiverId'],
                        params['message'],
                      ),
        ),
        'getIncomingRequests': _i1.MethodConnector(
          name: 'getIncomingRequests',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['studyRequest'] as _i12.StudyRequestEndpoint)
                      .getIncomingRequests(
                        session,
                        params['studentId'],
                      ),
        ),
        'getOutgoingRequests': _i1.MethodConnector(
          name: 'getOutgoingRequests',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['studyRequest'] as _i12.StudyRequestEndpoint)
                      .getOutgoingRequests(
                        session,
                        params['studentId'],
                      ),
        ),
        'getAcceptedRequests': _i1.MethodConnector(
          name: 'getAcceptedRequests',
          params: {
            'studentId': _i1.ParameterDescription(
              name: 'studentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['studyRequest'] as _i12.StudyRequestEndpoint)
                      .getAcceptedRequests(
                        session,
                        params['studentId'],
                      ),
        ),
        'respondToRequest': _i1.MethodConnector(
          name: 'respondToRequest',
          params: {
            'requestId': _i1.ParameterDescription(
              name: 'requestId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newStatus': _i1.ParameterDescription(
              name: 'newStatus',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['studyRequest'] as _i12.StudyRequestEndpoint)
                      .respondToRequest(
                        session,
                        params['requestId'],
                        params['newStatus'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i13.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i17.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i18.Endpoints()
      ..initializeEndpoints(server);
  }
}
