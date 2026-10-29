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

abstract class StudyRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = StudyRequestTable();

  static const db = StudyRequestRepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static StudyRequestInclude include() {
    return StudyRequestInclude._();
  }

  static StudyRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<StudyRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudyRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudyRequestTable>? orderByList,
    StudyRequestInclude? include,
  }) {
    return StudyRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudyRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StudyRequest.t),
      include: include,
    );
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

class StudyRequestUpdateTable extends _i1.UpdateTable<StudyRequestTable> {
  StudyRequestUpdateTable(super.table);

  _i1.ColumnValue<int, int> senderId(int value) => _i1.ColumnValue(
    table.senderId,
    value,
  );

  _i1.ColumnValue<int, int> receiverId(int value) => _i1.ColumnValue(
    table.receiverId,
    value,
  );

  _i1.ColumnValue<String, String> message(String? value) => _i1.ColumnValue(
    table.message,
    value,
  );

  _i1.ColumnValue<String, String> status(String value) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<String, String> senderName(String? value) => _i1.ColumnValue(
    table.senderName,
    value,
  );

  _i1.ColumnValue<String, String> senderCourse(String? value) =>
      _i1.ColumnValue(
        table.senderCourse,
        value,
      );

  _i1.ColumnValue<String, String> senderAvatar(String? value) =>
      _i1.ColumnValue(
        table.senderAvatar,
        value,
      );

  _i1.ColumnValue<String, String> receiverName(String? value) =>
      _i1.ColumnValue(
        table.receiverName,
        value,
      );
}

class StudyRequestTable extends _i1.Table<int?> {
  StudyRequestTable({super.tableRelation}) : super(tableName: 'study_request') {
    updateTable = StudyRequestUpdateTable(this);
    senderId = _i1.ColumnInt(
      'senderId',
      this,
    );
    receiverId = _i1.ColumnInt(
      'receiverId',
      this,
    );
    message = _i1.ColumnString(
      'message',
      this,
    );
    status = _i1.ColumnString(
      'status',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    senderName = _i1.ColumnString(
      'senderName',
      this,
    );
    senderCourse = _i1.ColumnString(
      'senderCourse',
      this,
    );
    senderAvatar = _i1.ColumnString(
      'senderAvatar',
      this,
    );
    receiverName = _i1.ColumnString(
      'receiverName',
      this,
    );
  }

  late final StudyRequestUpdateTable updateTable;

  late final _i1.ColumnInt senderId;

  late final _i1.ColumnInt receiverId;

  late final _i1.ColumnString message;

  late final _i1.ColumnString status;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString senderName;

  late final _i1.ColumnString senderCourse;

  late final _i1.ColumnString senderAvatar;

  late final _i1.ColumnString receiverName;

  @override
  List<_i1.Column> get columns => [
    id,
    senderId,
    receiverId,
    message,
    status,
    createdAt,
    senderName,
    senderCourse,
    senderAvatar,
    receiverName,
  ];
}

class StudyRequestInclude extends _i1.IncludeObject {
  StudyRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => StudyRequest.t;
}

class StudyRequestIncludeList extends _i1.IncludeList {
  StudyRequestIncludeList._({
    _i1.WhereExpressionBuilder<StudyRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StudyRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => StudyRequest.t;
}

class StudyRequestRepository {
  const StudyRequestRepository._();

  /// Returns a list of [StudyRequest]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<StudyRequest>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StudyRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudyRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudyRequestTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<StudyRequest>(
      where: where?.call(StudyRequest.t),
      orderBy: orderBy?.call(StudyRequest.t),
      orderByList: orderByList?.call(StudyRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [StudyRequest] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<StudyRequest?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StudyRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<StudyRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StudyRequestTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<StudyRequest>(
      where: where?.call(StudyRequest.t),
      orderBy: orderBy?.call(StudyRequest.t),
      orderByList: orderByList?.call(StudyRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [StudyRequest] by its [id] or null if no such row exists.
  Future<StudyRequest?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<StudyRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [StudyRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [StudyRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<StudyRequest>> insert(
    _i1.DatabaseSession session,
    List<StudyRequest> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<StudyRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [StudyRequest] and returns the inserted row.
  ///
  /// The returned [StudyRequest] will have its `id` field set.
  Future<StudyRequest> insertRow(
    _i1.DatabaseSession session,
    StudyRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StudyRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StudyRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StudyRequest>> update(
    _i1.DatabaseSession session,
    List<StudyRequest> rows, {
    _i1.ColumnSelections<StudyRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StudyRequest>(
      rows,
      columns: columns?.call(StudyRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudyRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StudyRequest> updateRow(
    _i1.DatabaseSession session,
    StudyRequest row, {
    _i1.ColumnSelections<StudyRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StudyRequest>(
      row,
      columns: columns?.call(StudyRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StudyRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StudyRequest?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<StudyRequestUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StudyRequest>(
      id,
      columnValues: columnValues(StudyRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StudyRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StudyRequest>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<StudyRequestUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StudyRequestTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StudyRequestTable>? orderBy,
    _i1.OrderByListBuilder<StudyRequestTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StudyRequest>(
      columnValues: columnValues(StudyRequest.t.updateTable),
      where: where(StudyRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StudyRequest.t),
      orderByList: orderByList?.call(StudyRequest.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StudyRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StudyRequest>> delete(
    _i1.DatabaseSession session,
    List<StudyRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StudyRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StudyRequest].
  Future<StudyRequest> deleteRow(
    _i1.DatabaseSession session,
    StudyRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StudyRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StudyRequest>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StudyRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StudyRequest>(
      where: where(StudyRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<StudyRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StudyRequest>(
      where: where?.call(StudyRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [StudyRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<StudyRequestTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<StudyRequest>(
      where: where(StudyRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
