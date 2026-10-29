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

abstract class EventRegistration
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  EventRegistration._({
    this.id,
    required this.eventId,
    required this.studentId,
    required this.registeredAt,
  });

  factory EventRegistration({
    int? id,
    required int eventId,
    required int studentId,
    required DateTime registeredAt,
  }) = _EventRegistrationImpl;

  factory EventRegistration.fromJson(Map<String, dynamic> jsonSerialization) {
    return EventRegistration(
      id: jsonSerialization['id'] as int?,
      eventId: jsonSerialization['eventId'] as int,
      studentId: jsonSerialization['studentId'] as int,
      registeredAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['registeredAt'],
      ),
    );
  }

  static final t = EventRegistrationTable();

  static const db = EventRegistrationRepository._();

  @override
  int? id;

  int eventId;

  int studentId;

  DateTime registeredAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EventRegistration copyWith({
    int? id,
    int? eventId,
    int? studentId,
    DateTime? registeredAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id,
      'eventId': eventId,
      'studentId': studentId,
      'registeredAt': registeredAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'EventRegistration',
      if (id != null) 'id': id,
      'eventId': eventId,
      'studentId': studentId,
      'registeredAt': registeredAt.toJson(),
    };
  }

  static EventRegistrationInclude include() {
    return EventRegistrationInclude._();
  }

  static EventRegistrationIncludeList includeList({
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    EventRegistrationInclude? include,
  }) {
    return EventRegistrationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(EventRegistration.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EventRegistrationImpl extends EventRegistration {
  _EventRegistrationImpl({
    int? id,
    required int eventId,
    required int studentId,
    required DateTime registeredAt,
  }) : super._(
         id: id,
         eventId: eventId,
         studentId: studentId,
         registeredAt: registeredAt,
       );

  /// Returns a shallow copy of this [EventRegistration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EventRegistration copyWith({
    Object? id = _Undefined,
    int? eventId,
    int? studentId,
    DateTime? registeredAt,
  }) {
    return EventRegistration(
      id: id is int? ? id : this.id,
      eventId: eventId ?? this.eventId,
      studentId: studentId ?? this.studentId,
      registeredAt: registeredAt ?? this.registeredAt,
    );
  }
}

class EventRegistrationUpdateTable
    extends _i1.UpdateTable<EventRegistrationTable> {
  EventRegistrationUpdateTable(super.table);

  _i1.ColumnValue<int, int> eventId(int value) => _i1.ColumnValue(
    table.eventId,
    value,
  );

  _i1.ColumnValue<int, int> studentId(int value) => _i1.ColumnValue(
    table.studentId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> registeredAt(DateTime value) =>
      _i1.ColumnValue(
        table.registeredAt,
        value,
      );
}

class EventRegistrationTable extends _i1.Table<int?> {
  EventRegistrationTable({super.tableRelation})
    : super(tableName: 'event_registration') {
    updateTable = EventRegistrationUpdateTable(this);
    eventId = _i1.ColumnInt(
      'eventId',
      this,
    );
    studentId = _i1.ColumnInt(
      'studentId',
      this,
    );
    registeredAt = _i1.ColumnDateTime(
      'registeredAt',
      this,
    );
  }

  late final EventRegistrationUpdateTable updateTable;

  late final _i1.ColumnInt eventId;

  late final _i1.ColumnInt studentId;

  late final _i1.ColumnDateTime registeredAt;

  @override
  List<_i1.Column> get columns => [
    id,
    eventId,
    studentId,
    registeredAt,
  ];
}

class EventRegistrationInclude extends _i1.IncludeObject {
  EventRegistrationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => EventRegistration.t;
}

class EventRegistrationIncludeList extends _i1.IncludeList {
  EventRegistrationIncludeList._({
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(EventRegistration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => EventRegistration.t;
}

class EventRegistrationRepository {
  const EventRegistrationRepository._();

  /// Returns a list of [EventRegistration]s matching the given query parameters.
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
  Future<List<EventRegistration>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [EventRegistration] matching the given query parameters.
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
  Future<EventRegistration?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<EventRegistration>(
      where: where?.call(EventRegistration.t),
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [EventRegistration] by its [id] or null if no such row exists.
  Future<EventRegistration?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<EventRegistration>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [EventRegistration]s in the list and returns the inserted rows.
  ///
  /// The returned [EventRegistration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<EventRegistration>> insert(
    _i1.DatabaseSession session,
    List<EventRegistration> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<EventRegistration>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [EventRegistration] and returns the inserted row.
  ///
  /// The returned [EventRegistration] will have its `id` field set.
  Future<EventRegistration> insertRow(
    _i1.DatabaseSession session,
    EventRegistration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<EventRegistration>> update(
    _i1.DatabaseSession session,
    List<EventRegistration> rows, {
    _i1.ColumnSelections<EventRegistrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<EventRegistration>(
      rows,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventRegistration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<EventRegistration> updateRow(
    _i1.DatabaseSession session,
    EventRegistration row, {
    _i1.ColumnSelections<EventRegistrationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<EventRegistration>(
      row,
      columns: columns?.call(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [EventRegistration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<EventRegistration?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<EventRegistrationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<EventRegistration>(
      id,
      columnValues: columnValues(EventRegistration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [EventRegistration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<EventRegistration>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<EventRegistrationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<EventRegistrationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EventRegistrationTable>? orderBy,
    _i1.OrderByListBuilder<EventRegistrationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<EventRegistration>(
      columnValues: columnValues(EventRegistration.t.updateTable),
      where: where(EventRegistration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(EventRegistration.t),
      orderByList: orderByList?.call(EventRegistration.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [EventRegistration]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<EventRegistration>> delete(
    _i1.DatabaseSession session,
    List<EventRegistration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<EventRegistration>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [EventRegistration].
  Future<EventRegistration> deleteRow(
    _i1.DatabaseSession session,
    EventRegistration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<EventRegistration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<EventRegistration>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventRegistrationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<EventRegistration>(
      where: where(EventRegistration.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<EventRegistrationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<EventRegistration>(
      where: where?.call(EventRegistration.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [EventRegistration] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<EventRegistrationTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<EventRegistration>(
      where: where(EventRegistration.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
