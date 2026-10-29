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

abstract class StudyRequest implements _i1.SerializableModel {
  StudyRequest._({
    this.id,
    required this.senderId,
    required this.receiverId,
    this.message,
    required this.status,
    required this.createdAt,
    this.senderName,
    this.senderCourse,
    this.senderAvatar,
    this.receiverName,
  });

  factory StudyRequest({
    int? id,
    required int senderId,
    required int receiverId,
    String? message,
    required String status,
    required DateTime createdAt,
    String? senderName,
    String? senderCourse,
    String? senderAvatar,
    String? receiverName,
  }) = _StudyRequestImpl;

  factory StudyRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return StudyRequest(
      id: jsonSerialization['id'] as int?,
      senderId: jsonSerialization['senderId'] as int,
      receiverId: jsonSerialization['receiverId'] as int,
      message: jsonSerialization['message'] as String?,
      status: jsonSerialization['status'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      senderName: jsonSerialization['senderName'] as String?,
      senderCourse: jsonSerialization['senderCourse'] as String?,
      senderAvatar: jsonSerialization['senderAvatar'] as String?,
      receiverName: jsonSerialization['receiverName'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int senderId;

  int receiverId;

  String? message;

  String status;

  DateTime createdAt;

  String? senderName;

  String? senderCourse;

  String? senderAvatar;

  String? receiverName;

  /// Returns a shallow copy of this [StudyRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StudyRequest copyWith({
    int? id,
    int? senderId,
    int? receiverId,
    String? message,
    String? status,
    DateTime? createdAt,
    String? senderName,
    String? senderCourse,
    String? senderAvatar,
    String? receiverName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StudyRequest',
      if (id != null) 'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      if (message != null) 'message': message,
      'status': status,
      'createdAt': createdAt.toJson(),
      if (senderName != null) 'senderName': senderName,
      if (senderCourse != null) 'senderCourse': senderCourse,
      if (senderAvatar != null) 'senderAvatar': senderAvatar,
      if (receiverName != null) 'receiverName': receiverName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StudyRequestImpl extends StudyRequest {
  _StudyRequestImpl({
    int? id,
    required int senderId,
    required int receiverId,
    String? message,
    required String status,
    required DateTime createdAt,
    String? senderName,
    String? senderCourse,
    String? senderAvatar,
    String? receiverName,
  }) : super._(
         id: id,
         senderId: senderId,
         receiverId: receiverId,
         message: message,
         status: status,
         createdAt: createdAt,
         senderName: senderName,
         senderCourse: senderCourse,
         senderAvatar: senderAvatar,
         receiverName: receiverName,
       );

  /// Returns a shallow copy of this [StudyRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StudyRequest copyWith({
    Object? id = _Undefined,
    int? senderId,
    int? receiverId,
    Object? message = _Undefined,
    String? status,
    DateTime? createdAt,
    Object? senderName = _Undefined,
    Object? senderCourse = _Undefined,
    Object? senderAvatar = _Undefined,
    Object? receiverName = _Undefined,
  }) {
    return StudyRequest(
      id: id is int? ? id : this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      message: message is String? ? message : this.message,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      senderName: senderName is String? ? senderName : this.senderName,
      senderCourse: senderCourse is String? ? senderCourse : this.senderCourse,
      senderAvatar: senderAvatar is String? ? senderAvatar : this.senderAvatar,
      receiverName: receiverName is String? ? receiverName : this.receiverName,
    );
  }
}
