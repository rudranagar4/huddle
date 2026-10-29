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

abstract class CommunityMember
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CommunityMember._({
    this.id,
    required this.communityId,
    required this.studentId,
    required this.joinedAt,
  });

  factory CommunityMember({
    int? id,
    required int communityId,
    required int studentId,
    required DateTime joinedAt,
  }) = _CommunityMemberImpl;

  factory CommunityMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityMember(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      studentId: jsonSerialization['studentId'] as int,
      joinedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['joinedAt'],
      ),
    );
  }

  static final t = CommunityMemberTable();

  static const db = CommunityMemberRepository._();

  @override
  int? id;

  int communityId;

  int studentId;

  DateTime joinedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommunityMember copyWith({
    int? id,
    int? communityId,
    int? studentId,
    DateTime? joinedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'studentId': studentId,
      'joinedAt': joinedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityMember',
      if (id != null) 'id': id,
      'communityId': communityId,
      'studentId': studentId,
      'joinedAt': joinedAt.toJson(),
    };
  }

  static CommunityMemberInclude include() {
    return CommunityMemberInclude._();
  }

  static CommunityMemberIncludeList includeList({
    _i1.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityMemberTable>? orderByList,
    CommunityMemberInclude? include,
  }) {
    return CommunityMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityMember.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CommunityMember.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityMemberImpl extends CommunityMember {
  _CommunityMemberImpl({
    int? id,
    required int communityId,
    required int studentId,
    required DateTime joinedAt,
  }) : super._(
         id: id,
         communityId: communityId,
         studentId: studentId,
         joinedAt: joinedAt,
       );

  /// Returns a shallow copy of this [CommunityMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommunityMember copyWith({
    Object? id = _Undefined,
    int? communityId,
    int? studentId,
    DateTime? joinedAt,
  }) {
    return CommunityMember(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      studentId: studentId ?? this.studentId,
      joinedAt: joinedAt ?? this.joinedAt,
    );
  }
}

class CommunityMemberUpdateTable extends _i1.UpdateTable<CommunityMemberTable> {
  CommunityMemberUpdateTable(super.table);

  _i1.ColumnValue<int, int> communityId(int value) => _i1.ColumnValue(
    table.communityId,
    value,
  );

  _i1.ColumnValue<int, int> studentId(int value) => _i1.ColumnValue(
    table.studentId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> joinedAt(DateTime value) =>
      _i1.ColumnValue(
        table.joinedAt,
        value,
      );
}

class CommunityMemberTable extends _i1.Table<int?> {
  CommunityMemberTable({super.tableRelation})
    : super(tableName: 'community_member') {
    updateTable = CommunityMemberUpdateTable(this);
    communityId = _i1.ColumnInt(
      'communityId',
      this,
    );
    studentId = _i1.ColumnInt(
      'studentId',
      this,
    );
    joinedAt = _i1.ColumnDateTime(
      'joinedAt',
      this,
    );
  }

  late final CommunityMemberUpdateTable updateTable;

  late final _i1.ColumnInt communityId;

  late final _i1.ColumnInt studentId;

  late final _i1.ColumnDateTime joinedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    communityId,
    studentId,
    joinedAt,
  ];
}

class CommunityMemberInclude extends _i1.IncludeObject {
  CommunityMemberInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CommunityMember.t;
}

class CommunityMemberIncludeList extends _i1.IncludeList {
  CommunityMemberIncludeList._({
    _i1.WhereExpressionBuilder<CommunityMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommunityMember.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CommunityMember.t;
}

class CommunityMemberRepository {
  const CommunityMemberRepository._();

  /// Returns a list of [CommunityMember]s matching the given query parameters.
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
  Future<List<CommunityMember>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CommunityMember>(
      where: where?.call(CommunityMember.t),
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CommunityMember] matching the given query parameters.
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
  Future<CommunityMember?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommunityMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityMemberTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CommunityMember>(
      where: where?.call(CommunityMember.t),
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CommunityMember] by its [id] or null if no such row exists.
  Future<CommunityMember?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CommunityMember>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CommunityMember]s in the list and returns the inserted rows.
  ///
  /// The returned [CommunityMember]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<CommunityMember>> insert(
    _i1.DatabaseSession session,
    List<CommunityMember> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<CommunityMember>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [CommunityMember] and returns the inserted row.
  ///
  /// The returned [CommunityMember] will have its `id` field set.
  Future<CommunityMember> insertRow(
    _i1.DatabaseSession session,
    CommunityMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommunityMember>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CommunityMember]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CommunityMember>> update(
    _i1.DatabaseSession session,
    List<CommunityMember> rows, {
    _i1.ColumnSelections<CommunityMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CommunityMember>(
      rows,
      columns: columns?.call(CommunityMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityMember]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommunityMember> updateRow(
    _i1.DatabaseSession session,
    CommunityMember row, {
    _i1.ColumnSelections<CommunityMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommunityMember>(
      row,
      columns: columns?.call(CommunityMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityMember] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommunityMember?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<CommunityMemberUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CommunityMember>(
      id,
      columnValues: columnValues(CommunityMember.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityMember]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CommunityMember>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<CommunityMemberUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<CommunityMemberTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityMemberTable>? orderBy,
    _i1.OrderByListBuilder<CommunityMemberTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CommunityMember>(
      columnValues: columnValues(CommunityMember.t.updateTable),
      where: where(CommunityMember.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityMember.t),
      orderByList: orderByList?.call(CommunityMember.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CommunityMember]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CommunityMember>> delete(
    _i1.DatabaseSession session,
    List<CommunityMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CommunityMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CommunityMember].
  Future<CommunityMember> deleteRow(
    _i1.DatabaseSession session,
    CommunityMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommunityMember>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CommunityMember>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CommunityMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CommunityMember>(
      where: where(CommunityMember.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityMemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CommunityMember>(
      where: where?.call(CommunityMember.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CommunityMember] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CommunityMemberTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CommunityMember>(
      where: where(CommunityMember.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
