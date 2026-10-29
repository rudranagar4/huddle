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

abstract class CommunityPost
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CommunityPost._({
    this.id,
    required this.communityId,
    required this.authorName,
    this.authorAvatar,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.likesCount,
  });

  factory CommunityPost({
    int? id,
    required int communityId,
    required String authorName,
    String? authorAvatar,
    required String title,
    required String content,
    required DateTime createdAt,
    required int likesCount,
  }) = _CommunityPostImpl;

  factory CommunityPost.fromJson(Map<String, dynamic> jsonSerialization) {
    return CommunityPost(
      id: jsonSerialization['id'] as int?,
      communityId: jsonSerialization['communityId'] as int,
      authorName: jsonSerialization['authorName'] as String,
      authorAvatar: jsonSerialization['authorAvatar'] as String?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      likesCount: jsonSerialization['likesCount'] as int,
    );
  }

  static final t = CommunityPostTable();

  static const db = CommunityPostRepository._();

  @override
  int? id;

  int communityId;

  String authorName;

  String? authorAvatar;

  String title;

  String content;

  DateTime createdAt;

  int likesCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CommunityPost copyWith({
    int? id,
    int? communityId,
    String? authorName,
    String? authorAvatar,
    String? title,
    String? content,
    DateTime? createdAt,
    int? likesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorName': authorName,
      if (authorAvatar != null) 'authorAvatar': authorAvatar,
      'title': title,
      'content': content,
      'createdAt': createdAt.toJson(),
      'likesCount': likesCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityPost',
      if (id != null) 'id': id,
      'communityId': communityId,
      'authorName': authorName,
      if (authorAvatar != null) 'authorAvatar': authorAvatar,
      'title': title,
      'content': content,
      'createdAt': createdAt.toJson(),
      'likesCount': likesCount,
    };
  }

  static CommunityPostInclude include() {
    return CommunityPostInclude._();
  }

  static CommunityPostIncludeList includeList({
    _i1.WhereExpressionBuilder<CommunityPostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityPostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityPostTable>? orderByList,
    CommunityPostInclude? include,
  }) {
    return CommunityPostIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityPost.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CommunityPost.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityPostImpl extends CommunityPost {
  _CommunityPostImpl({
    int? id,
    required int communityId,
    required String authorName,
    String? authorAvatar,
    required String title,
    required String content,
    required DateTime createdAt,
    required int likesCount,
  }) : super._(
         id: id,
         communityId: communityId,
         authorName: authorName,
         authorAvatar: authorAvatar,
         title: title,
         content: content,
         createdAt: createdAt,
         likesCount: likesCount,
       );

  /// Returns a shallow copy of this [CommunityPost]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CommunityPost copyWith({
    Object? id = _Undefined,
    int? communityId,
    String? authorName,
    Object? authorAvatar = _Undefined,
    String? title,
    String? content,
    DateTime? createdAt,
    int? likesCount,
  }) {
    return CommunityPost(
      id: id is int? ? id : this.id,
      communityId: communityId ?? this.communityId,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar is String? ? authorAvatar : this.authorAvatar,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      likesCount: likesCount ?? this.likesCount,
    );
  }
}

class CommunityPostUpdateTable extends _i1.UpdateTable<CommunityPostTable> {
  CommunityPostUpdateTable(super.table);

  _i1.ColumnValue<int, int> communityId(int value) => _i1.ColumnValue(
    table.communityId,
    value,
  );

  _i1.ColumnValue<String, String> authorName(String value) => _i1.ColumnValue(
    table.authorName,
    value,
  );

  _i1.ColumnValue<String, String> authorAvatar(String? value) =>
      _i1.ColumnValue(
        table.authorAvatar,
        value,
      );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> content(String value) => _i1.ColumnValue(
    table.content,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> likesCount(int value) => _i1.ColumnValue(
    table.likesCount,
    value,
  );
}

class CommunityPostTable extends _i1.Table<int?> {
  CommunityPostTable({super.tableRelation})
    : super(tableName: 'community_post') {
    updateTable = CommunityPostUpdateTable(this);
    communityId = _i1.ColumnInt(
      'communityId',
      this,
    );
    authorName = _i1.ColumnString(
      'authorName',
      this,
    );
    authorAvatar = _i1.ColumnString(
      'authorAvatar',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    content = _i1.ColumnString(
      'content',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    likesCount = _i1.ColumnInt(
      'likesCount',
      this,
    );
  }

  late final CommunityPostUpdateTable updateTable;

  late final _i1.ColumnInt communityId;

  late final _i1.ColumnString authorName;

  late final _i1.ColumnString authorAvatar;

  late final _i1.ColumnString title;

  late final _i1.ColumnString content;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt likesCount;

  @override
  List<_i1.Column> get columns => [
    id,
    communityId,
    authorName,
    authorAvatar,
    title,
    content,
    createdAt,
    likesCount,
  ];
}

class CommunityPostInclude extends _i1.IncludeObject {
  CommunityPostInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CommunityPost.t;
}

class CommunityPostIncludeList extends _i1.IncludeList {
  CommunityPostIncludeList._({
    _i1.WhereExpressionBuilder<CommunityPostTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CommunityPost.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CommunityPost.t;
}

class CommunityPostRepository {
  const CommunityPostRepository._();

  /// Returns a list of [CommunityPost]s matching the given query parameters.
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
  Future<List<CommunityPost>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityPostTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityPostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityPostTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CommunityPost>(
      where: where?.call(CommunityPost.t),
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CommunityPost] matching the given query parameters.
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
  Future<CommunityPost?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityPostTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommunityPostTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityPostTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CommunityPost>(
      where: where?.call(CommunityPost.t),
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CommunityPost] by its [id] or null if no such row exists.
  Future<CommunityPost?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CommunityPost>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CommunityPost]s in the list and returns the inserted rows.
  ///
  /// The returned [CommunityPost]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<CommunityPost>> insert(
    _i1.DatabaseSession session,
    List<CommunityPost> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<CommunityPost>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [CommunityPost] and returns the inserted row.
  ///
  /// The returned [CommunityPost] will have its `id` field set.
  Future<CommunityPost> insertRow(
    _i1.DatabaseSession session,
    CommunityPost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CommunityPost>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CommunityPost]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CommunityPost>> update(
    _i1.DatabaseSession session,
    List<CommunityPost> rows, {
    _i1.ColumnSelections<CommunityPostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CommunityPost>(
      rows,
      columns: columns?.call(CommunityPost.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityPost]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CommunityPost> updateRow(
    _i1.DatabaseSession session,
    CommunityPost row, {
    _i1.ColumnSelections<CommunityPostTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CommunityPost>(
      row,
      columns: columns?.call(CommunityPost.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CommunityPost] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CommunityPost?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<CommunityPostUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CommunityPost>(
      id,
      columnValues: columnValues(CommunityPost.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CommunityPost]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CommunityPost>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<CommunityPostUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CommunityPostTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityPostTable>? orderBy,
    _i1.OrderByListBuilder<CommunityPostTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CommunityPost>(
      columnValues: columnValues(CommunityPost.t.updateTable),
      where: where(CommunityPost.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CommunityPost.t),
      orderByList: orderByList?.call(CommunityPost.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CommunityPost]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CommunityPost>> delete(
    _i1.DatabaseSession session,
    List<CommunityPost> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CommunityPost>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CommunityPost].
  Future<CommunityPost> deleteRow(
    _i1.DatabaseSession session,
    CommunityPost row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CommunityPost>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CommunityPost>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CommunityPostTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CommunityPost>(
      where: where(CommunityPost.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityPostTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CommunityPost>(
      where: where?.call(CommunityPost.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CommunityPost] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CommunityPostTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CommunityPost>(
      where: where(CommunityPost.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
