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

abstract class Bookmark
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Bookmark._({
    this.id,
    required this.studentId,
    required this.itemType,
    required this.itemId,
    required this.createdAt,
  });

  factory Bookmark({
    int? id,
    required int studentId,
    required String itemType,
    required int itemId,
    required DateTime createdAt,
  }) = _BookmarkImpl;

  factory Bookmark.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bookmark(
      id: jsonSerialization['id'] as int?,
      studentId: jsonSerialization['studentId'] as int,
      itemType: jsonSerialization['itemType'] as String,
      itemId: jsonSerialization['itemId'] as int,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = BookmarkTable();

  static const db = BookmarkRepository._();

  @override
  int? id;

  int studentId;

  String itemType;

  int itemId;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Bookmark copyWith({
    int? id,
    int? studentId,
    String? itemType,
    int? itemId,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'studentId': studentId,
      'itemType': itemType,
      'itemId': itemId,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Bookmark',
      if (id != null) 'id': id,
      'studentId': studentId,
      'itemType': itemType,
      'itemId': itemId,
      'createdAt': createdAt.toJson(),
    };
  }

  static BookmarkInclude include() {
    return BookmarkInclude._();
  }

  static BookmarkIncludeList includeList({
    _i1.WhereExpressionBuilder<BookmarkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BookmarkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookmarkTable>? orderByList,
    BookmarkInclude? include,
  }) {
    return BookmarkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bookmark.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Bookmark.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BookmarkImpl extends Bookmark {
  _BookmarkImpl({
    int? id,
    required int studentId,
    required String itemType,
    required int itemId,
    required DateTime createdAt,
  }) : super._(
         id: id,
         studentId: studentId,
         itemType: itemType,
         itemId: itemId,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Bookmark]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Bookmark copyWith({
    Object? id = _Undefined,
    int? studentId,
    String? itemType,
    int? itemId,
    DateTime? createdAt,
  }) {
    return Bookmark(
      id: id is int? ? id : this.id,
      studentId: studentId ?? this.studentId,
      itemType: itemType ?? this.itemType,
      itemId: itemId ?? this.itemId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class BookmarkUpdateTable extends _i1.UpdateTable<BookmarkTable> {
  BookmarkUpdateTable(super.table);

  _i1.ColumnValue<int, int> studentId(int value) => _i1.ColumnValue(
    table.studentId,
    value,
  );

  _i1.ColumnValue<String, String> itemType(String value) => _i1.ColumnValue(
    table.itemType,
    value,
  );

  _i1.ColumnValue<int, int> itemId(int value) => _i1.ColumnValue(
    table.itemId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );
}

class BookmarkTable extends _i1.Table<int?> {
  BookmarkTable({super.tableRelation}) : super(tableName: 'bookmark') {
    updateTable = BookmarkUpdateTable(this);
    studentId = _i1.ColumnInt(
      'studentId',
      this,
    );
    itemType = _i1.ColumnString(
      'itemType',
      this,
    );
    itemId = _i1.ColumnInt(
      'itemId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final BookmarkUpdateTable updateTable;

  late final _i1.ColumnInt studentId;

  late final _i1.ColumnString itemType;

  late final _i1.ColumnInt itemId;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
    id,
    studentId,
    itemType,
    itemId,
    createdAt,
  ];
}

class BookmarkInclude extends _i1.IncludeObject {
  BookmarkInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Bookmark.t;
}

class BookmarkIncludeList extends _i1.IncludeList {
  BookmarkIncludeList._({
    _i1.WhereExpressionBuilder<BookmarkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Bookmark.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Bookmark.t;
}

class BookmarkRepository {
  const BookmarkRepository._();

  /// Returns a list of [Bookmark]s matching the given query parameters.
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
  Future<List<Bookmark>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BookmarkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BookmarkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookmarkTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Bookmark>(
      where: where?.call(Bookmark.t),
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Bookmark] matching the given query parameters.
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
  Future<Bookmark?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BookmarkTable>? where,
    int? offset,
    _i1.OrderByBuilder<BookmarkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BookmarkTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Bookmark>(
      where: where?.call(Bookmark.t),
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Bookmark] by its [id] or null if no such row exists.
  Future<Bookmark?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Bookmark>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Bookmark]s in the list and returns the inserted rows.
  ///
  /// The returned [Bookmark]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Bookmark>> insert(
    _i1.DatabaseSession session,
    List<Bookmark> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Bookmark>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Bookmark] and returns the inserted row.
  ///
  /// The returned [Bookmark] will have its `id` field set.
  Future<Bookmark> insertRow(
    _i1.DatabaseSession session,
    Bookmark row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Bookmark>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Bookmark]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Bookmark>> update(
    _i1.DatabaseSession session,
    List<Bookmark> rows, {
    _i1.ColumnSelections<BookmarkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Bookmark>(
      rows,
      columns: columns?.call(Bookmark.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Bookmark]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Bookmark> updateRow(
    _i1.DatabaseSession session,
    Bookmark row, {
    _i1.ColumnSelections<BookmarkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Bookmark>(
      row,
      columns: columns?.call(Bookmark.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Bookmark] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Bookmark?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<BookmarkUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Bookmark>(
      id,
      columnValues: columnValues(Bookmark.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Bookmark]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Bookmark>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<BookmarkUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<BookmarkTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BookmarkTable>? orderBy,
    _i1.OrderByListBuilder<BookmarkTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Bookmark>(
      columnValues: columnValues(Bookmark.t.updateTable),
      where: where(Bookmark.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bookmark.t),
      orderByList: orderByList?.call(Bookmark.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Bookmark]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Bookmark>> delete(
    _i1.DatabaseSession session,
    List<Bookmark> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Bookmark>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Bookmark].
  Future<Bookmark> deleteRow(
    _i1.DatabaseSession session,
    Bookmark row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Bookmark>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Bookmark>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<BookmarkTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Bookmark>(
      where: where(Bookmark.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<BookmarkTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Bookmark>(
      where: where?.call(Bookmark.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Bookmark] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<BookmarkTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Bookmark>(
      where: where(Bookmark.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
