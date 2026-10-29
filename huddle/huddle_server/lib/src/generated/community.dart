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

abstract class Community
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Community._({
    this.id,
    required this.name,
    required this.category,
    required this.description,
    this.iconUrl,
    this.bannerUrl,
    required this.memberCount,
    required this.upcomingEventsCount,
  });

  factory Community({
    int? id,
    required String name,
    required String category,
    required String description,
    String? iconUrl,
    String? bannerUrl,
    required int memberCount,
    required int upcomingEventsCount,
  }) = _CommunityImpl;

  factory Community.fromJson(Map<String, dynamic> jsonSerialization) {
    return Community(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      category: jsonSerialization['category'] as String,
      description: jsonSerialization['description'] as String,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      bannerUrl: jsonSerialization['bannerUrl'] as String?,
      memberCount: jsonSerialization['memberCount'] as int,
      upcomingEventsCount: jsonSerialization['upcomingEventsCount'] as int,
    );
  }

  static final t = CommunityTable();

  static const db = CommunityRepository._();

  @override
  int? id;

  String name;

  String category;

  String description;

  String? iconUrl;

  String? bannerUrl;

  int memberCount;

  int upcomingEventsCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Community copyWith({
    int? id,
    String? name,
    String? category,
    String? description,
    String? iconUrl,
    String? bannerUrl,
    int? memberCount,
    int? upcomingEventsCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'category': category,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (bannerUrl != null) 'bannerUrl': bannerUrl,
      'memberCount': memberCount,
      'upcomingEventsCount': upcomingEventsCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Community',
      if (id != null) 'id': id,
      'name': name,
      'category': category,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (bannerUrl != null) 'bannerUrl': bannerUrl,
      'memberCount': memberCount,
      'upcomingEventsCount': upcomingEventsCount,
    };
  }

  static CommunityInclude include() {
    return CommunityInclude._();
  }

  static CommunityIncludeList includeList({
    _i1.WhereExpressionBuilder<CommunityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityTable>? orderByList,
    CommunityInclude? include,
  }) {
    return CommunityIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Community.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Community.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityImpl extends Community {
  _CommunityImpl({
    int? id,
    required String name,
    required String category,
    required String description,
    String? iconUrl,
    String? bannerUrl,
    required int memberCount,
    required int upcomingEventsCount,
  }) : super._(
         id: id,
         name: name,
         category: category,
         description: description,
         iconUrl: iconUrl,
         bannerUrl: bannerUrl,
         memberCount: memberCount,
         upcomingEventsCount: upcomingEventsCount,
       );

  /// Returns a shallow copy of this [Community]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Community copyWith({
    Object? id = _Undefined,
    String? name,
    String? category,
    String? description,
    Object? iconUrl = _Undefined,
    Object? bannerUrl = _Undefined,
    int? memberCount,
    int? upcomingEventsCount,
  }) {
    return Community(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      bannerUrl: bannerUrl is String? ? bannerUrl : this.bannerUrl,
      memberCount: memberCount ?? this.memberCount,
      upcomingEventsCount: upcomingEventsCount ?? this.upcomingEventsCount,
    );
  }
}

class CommunityUpdateTable extends _i1.UpdateTable<CommunityTable> {
  CommunityUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> iconUrl(String? value) => _i1.ColumnValue(
    table.iconUrl,
    value,
  );

  _i1.ColumnValue<String, String> bannerUrl(String? value) => _i1.ColumnValue(
    table.bannerUrl,
    value,
  );

  _i1.ColumnValue<int, int> memberCount(int value) => _i1.ColumnValue(
    table.memberCount,
    value,
  );

  _i1.ColumnValue<int, int> upcomingEventsCount(int value) => _i1.ColumnValue(
    table.upcomingEventsCount,
    value,
  );
}

class CommunityTable extends _i1.Table<int?> {
  CommunityTable({super.tableRelation}) : super(tableName: 'community') {
    updateTable = CommunityUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    iconUrl = _i1.ColumnString(
      'iconUrl',
      this,
    );
    bannerUrl = _i1.ColumnString(
      'bannerUrl',
      this,
    );
    memberCount = _i1.ColumnInt(
      'memberCount',
      this,
    );
    upcomingEventsCount = _i1.ColumnInt(
      'upcomingEventsCount',
      this,
    );
  }

  late final CommunityUpdateTable updateTable;

  late final _i1.ColumnString name;

  late final _i1.ColumnString category;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconUrl;

  late final _i1.ColumnString bannerUrl;

  late final _i1.ColumnInt memberCount;

  late final _i1.ColumnInt upcomingEventsCount;

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    category,
    description,
    iconUrl,
    bannerUrl,
    memberCount,
    upcomingEventsCount,
  ];
}

class CommunityInclude extends _i1.IncludeObject {
  CommunityInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Community.t;
}

class CommunityIncludeList extends _i1.IncludeList {
  CommunityIncludeList._({
    _i1.WhereExpressionBuilder<CommunityTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Community.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Community.t;
}

class CommunityRepository {
  const CommunityRepository._();

  /// Returns a list of [Community]s matching the given query parameters.
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
  Future<List<Community>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Community>(
      where: where?.call(Community.t),
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [Community] matching the given query parameters.
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
  Future<Community?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityTable>? where,
    int? offset,
    _i1.OrderByBuilder<CommunityTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CommunityTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Community>(
      where: where?.call(Community.t),
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Community] by its [id] or null if no such row exists.
  Future<Community?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Community>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Community]s in the list and returns the inserted rows.
  ///
  /// The returned [Community]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<Community>> insert(
    _i1.DatabaseSession session,
    List<Community> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<Community>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [Community] and returns the inserted row.
  ///
  /// The returned [Community] will have its `id` field set.
  Future<Community> insertRow(
    _i1.DatabaseSession session,
    Community row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Community>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Community]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Community>> update(
    _i1.DatabaseSession session,
    List<Community> rows, {
    _i1.ColumnSelections<CommunityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Community>(
      rows,
      columns: columns?.call(Community.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Community]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Community> updateRow(
    _i1.DatabaseSession session,
    Community row, {
    _i1.ColumnSelections<CommunityTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Community>(
      row,
      columns: columns?.call(Community.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Community] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Community?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<CommunityUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Community>(
      id,
      columnValues: columnValues(Community.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Community]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Community>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<CommunityUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CommunityTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CommunityTable>? orderBy,
    _i1.OrderByListBuilder<CommunityTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Community>(
      columnValues: columnValues(Community.t.updateTable),
      where: where(Community.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Community.t),
      orderByList: orderByList?.call(Community.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Community]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Community>> delete(
    _i1.DatabaseSession session,
    List<Community> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Community>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Community].
  Future<Community> deleteRow(
    _i1.DatabaseSession session,
    Community row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Community>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Community>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CommunityTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Community>(
      where: where(Community.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CommunityTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Community>(
      where: where?.call(Community.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Community] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CommunityTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Community>(
      where: where(Community.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
