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

abstract class CampusEvent
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CampusEvent._({
    this.id,
    required this.title,
    required this.description,
    required this.organizer,
    required this.category,
    required this.date,
    required this.time,
    required this.venue,
    this.bannerUrl,
    required this.totalSeats,
    required this.registeredSeats,
    required this.isFree,
    this.price,
  });

  factory CampusEvent({
    int? id,
    required String title,
    required String description,
    required String organizer,
    required String category,
    required DateTime date,
    required String time,
    required String venue,
    String? bannerUrl,
    required int totalSeats,
    required int registeredSeats,
    required bool isFree,
    double? price,
  }) = _CampusEventImpl;

  factory CampusEvent.fromJson(Map<String, dynamic> jsonSerialization) {
    return CampusEvent(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      organizer: jsonSerialization['organizer'] as String,
      category: jsonSerialization['category'] as String,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      time: jsonSerialization['time'] as String,
      venue: jsonSerialization['venue'] as String,
      bannerUrl: jsonSerialization['bannerUrl'] as String?,
      totalSeats: jsonSerialization['totalSeats'] as int,
      registeredSeats: jsonSerialization['registeredSeats'] as int,
      isFree: _i1.BoolJsonExtension.fromJson(jsonSerialization['isFree']),
      price: (jsonSerialization['price'] as num?)?.toDouble(),
    );
  }

  static final t = CampusEventTable();

  static const db = CampusEventRepository._();

  @override
  int? id;

  String title;

  String description;

  String organizer;

  String category;

  DateTime date;

  String time;

  String venue;

  String? bannerUrl;

  int totalSeats;

  int registeredSeats;

  bool isFree;

  double? price;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CampusEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CampusEvent copyWith({
    int? id,
    String? title,
    String? description,
    String? organizer,
    String? category,
    DateTime? date,
    String? time,
    String? venue,
    String? bannerUrl,
    int? totalSeats,
    int? registeredSeats,
    bool? isFree,
    double? price,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CampusEvent',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'organizer': organizer,
      'category': category,
      'date': date.toJson(),
      'time': time,
      'venue': venue,
      if (bannerUrl != null) 'bannerUrl': bannerUrl,
      'totalSeats': totalSeats,
      'registeredSeats': registeredSeats,
      'isFree': isFree,
      if (price != null) 'price': price,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CampusEvent',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'organizer': organizer,
      'category': category,
      'date': date.toJson(),
      'time': time,
      'venue': venue,
      if (bannerUrl != null) 'bannerUrl': bannerUrl,
      'totalSeats': totalSeats,
      'registeredSeats': registeredSeats,
      'isFree': isFree,
      if (price != null) 'price': price,
    };
  }

  static CampusEventInclude include() {
    return CampusEventInclude._();
  }

  static CampusEventIncludeList includeList({
    _i1.WhereExpressionBuilder<CampusEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CampusEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CampusEventTable>? orderByList,
    CampusEventInclude? include,
  }) {
    return CampusEventIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CampusEvent.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CampusEvent.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CampusEventImpl extends CampusEvent {
  _CampusEventImpl({
    int? id,
    required String title,
    required String description,
    required String organizer,
    required String category,
    required DateTime date,
    required String time,
    required String venue,
    String? bannerUrl,
    required int totalSeats,
    required int registeredSeats,
    required bool isFree,
    double? price,
  }) : super._(
         id: id,
         title: title,
         description: description,
         organizer: organizer,
         category: category,
         date: date,
         time: time,
         venue: venue,
         bannerUrl: bannerUrl,
         totalSeats: totalSeats,
         registeredSeats: registeredSeats,
         isFree: isFree,
         price: price,
       );

  /// Returns a shallow copy of this [CampusEvent]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CampusEvent copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? organizer,
    String? category,
    DateTime? date,
    String? time,
    String? venue,
    Object? bannerUrl = _Undefined,
    int? totalSeats,
    int? registeredSeats,
    bool? isFree,
    Object? price = _Undefined,
  }) {
    return CampusEvent(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      organizer: organizer ?? this.organizer,
      category: category ?? this.category,
      date: date ?? this.date,
      time: time ?? this.time,
      venue: venue ?? this.venue,
      bannerUrl: bannerUrl is String? ? bannerUrl : this.bannerUrl,
      totalSeats: totalSeats ?? this.totalSeats,
      registeredSeats: registeredSeats ?? this.registeredSeats,
      isFree: isFree ?? this.isFree,
      price: price is double? ? price : this.price,
    );
  }
}

class CampusEventUpdateTable extends _i1.UpdateTable<CampusEventTable> {
  CampusEventUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> organizer(String value) => _i1.ColumnValue(
    table.organizer,
    value,
  );

  _i1.ColumnValue<String, String> category(String value) => _i1.ColumnValue(
    table.category,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> time(String value) => _i1.ColumnValue(
    table.time,
    value,
  );

  _i1.ColumnValue<String, String> venue(String value) => _i1.ColumnValue(
    table.venue,
    value,
  );

  _i1.ColumnValue<String, String> bannerUrl(String? value) => _i1.ColumnValue(
    table.bannerUrl,
    value,
  );

  _i1.ColumnValue<int, int> totalSeats(int value) => _i1.ColumnValue(
    table.totalSeats,
    value,
  );

  _i1.ColumnValue<int, int> registeredSeats(int value) => _i1.ColumnValue(
    table.registeredSeats,
    value,
  );

  _i1.ColumnValue<bool, bool> isFree(bool value) => _i1.ColumnValue(
    table.isFree,
    value,
  );

  _i1.ColumnValue<double, double> price(double? value) => _i1.ColumnValue(
    table.price,
    value,
  );
}

class CampusEventTable extends _i1.Table<int?> {
  CampusEventTable({super.tableRelation}) : super(tableName: 'campus_event') {
    updateTable = CampusEventUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    organizer = _i1.ColumnString(
      'organizer',
      this,
    );
    category = _i1.ColumnString(
      'category',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    time = _i1.ColumnString(
      'time',
      this,
    );
    venue = _i1.ColumnString(
      'venue',
      this,
    );
    bannerUrl = _i1.ColumnString(
      'bannerUrl',
      this,
    );
    totalSeats = _i1.ColumnInt(
      'totalSeats',
      this,
    );
    registeredSeats = _i1.ColumnInt(
      'registeredSeats',
      this,
    );
    isFree = _i1.ColumnBool(
      'isFree',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
  }

  late final CampusEventUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnString organizer;

  late final _i1.ColumnString category;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnString time;

  late final _i1.ColumnString venue;

  late final _i1.ColumnString bannerUrl;

  late final _i1.ColumnInt totalSeats;

  late final _i1.ColumnInt registeredSeats;

  late final _i1.ColumnBool isFree;

  late final _i1.ColumnDouble price;

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    description,
    organizer,
    category,
    date,
    time,
    venue,
    bannerUrl,
    totalSeats,
    registeredSeats,
    isFree,
    price,
  ];
}

class CampusEventInclude extends _i1.IncludeObject {
  CampusEventInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => CampusEvent.t;
}

class CampusEventIncludeList extends _i1.IncludeList {
  CampusEventIncludeList._({
    _i1.WhereExpressionBuilder<CampusEventTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CampusEvent.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CampusEvent.t;
}

class CampusEventRepository {
  const CampusEventRepository._();

  /// Returns a list of [CampusEvent]s matching the given query parameters.
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
  Future<List<CampusEvent>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CampusEventTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CampusEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CampusEventTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<CampusEvent>(
      where: where?.call(CampusEvent.t),
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [CampusEvent] matching the given query parameters.
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
  Future<CampusEvent?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CampusEventTable>? where,
    int? offset,
    _i1.OrderByBuilder<CampusEventTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CampusEventTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<CampusEvent>(
      where: where?.call(CampusEvent.t),
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [CampusEvent] by its [id] or null if no such row exists.
  Future<CampusEvent?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<CampusEvent>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [CampusEvent]s in the list and returns the inserted rows.
  ///
  /// The returned [CampusEvent]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<CampusEvent>> insert(
    _i1.DatabaseSession session,
    List<CampusEvent> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<CampusEvent>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [CampusEvent] and returns the inserted row.
  ///
  /// The returned [CampusEvent] will have its `id` field set.
  Future<CampusEvent> insertRow(
    _i1.DatabaseSession session,
    CampusEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CampusEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CampusEvent]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CampusEvent>> update(
    _i1.DatabaseSession session,
    List<CampusEvent> rows, {
    _i1.ColumnSelections<CampusEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CampusEvent>(
      rows,
      columns: columns?.call(CampusEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CampusEvent]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CampusEvent> updateRow(
    _i1.DatabaseSession session,
    CampusEvent row, {
    _i1.ColumnSelections<CampusEventTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CampusEvent>(
      row,
      columns: columns?.call(CampusEvent.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CampusEvent] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<CampusEvent?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<CampusEventUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<CampusEvent>(
      id,
      columnValues: columnValues(CampusEvent.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [CampusEvent]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<CampusEvent>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<CampusEventUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<CampusEventTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CampusEventTable>? orderBy,
    _i1.OrderByListBuilder<CampusEventTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<CampusEvent>(
      columnValues: columnValues(CampusEvent.t.updateTable),
      where: where(CampusEvent.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CampusEvent.t),
      orderByList: orderByList?.call(CampusEvent.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [CampusEvent]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CampusEvent>> delete(
    _i1.DatabaseSession session,
    List<CampusEvent> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CampusEvent>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CampusEvent].
  Future<CampusEvent> deleteRow(
    _i1.DatabaseSession session,
    CampusEvent row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CampusEvent>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CampusEvent>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CampusEventTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CampusEvent>(
      where: where(CampusEvent.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<CampusEventTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CampusEvent>(
      where: where?.call(CampusEvent.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [CampusEvent] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<CampusEventTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<CampusEvent>(
      where: where(CampusEvent.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
