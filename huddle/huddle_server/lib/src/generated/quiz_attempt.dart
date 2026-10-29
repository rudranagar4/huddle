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

abstract class QuizAttempt
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  QuizAttempt._({
    this.id,
    required this.quizId,
    required this.studentId,
    required this.score,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.completedAt,
  });

  factory QuizAttempt({
    int? id,
    required int quizId,
    required int studentId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
    required int wrongAnswers,
    required DateTime completedAt,
  }) = _QuizAttemptImpl;

  factory QuizAttempt.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizAttempt(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      studentId: jsonSerialization['studentId'] as int,
      score: jsonSerialization['score'] as int,
      totalQuestions: jsonSerialization['totalQuestions'] as int,
      correctAnswers: jsonSerialization['correctAnswers'] as int,
      wrongAnswers: jsonSerialization['wrongAnswers'] as int,
      completedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['completedAt'],
      ),
    );
  }

  static final t = QuizAttemptTable();

  static const db = QuizAttemptRepository._();

  @override
  int? id;

  int quizId;

  int studentId;

  int score;

  int totalQuestions;

  int correctAnswers;

  int wrongAnswers;

  DateTime completedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [QuizAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QuizAttempt copyWith({
    int? id,
    int? quizId,
    int? studentId,
    int? score,
    int? totalQuestions,
    int? correctAnswers,
    int? wrongAnswers,
    DateTime? completedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizAttempt',
      if (id != null) 'id': id,
      'quizId': quizId,
      'studentId': studentId,
      'score': score,
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'completedAt': completedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizAttempt',
      if (id != null) 'id': id,
      'quizId': quizId,
      'studentId': studentId,
      'score': score,
      'totalQuestions': totalQuestions,
      'correctAnswers': correctAnswers,
      'wrongAnswers': wrongAnswers,
      'completedAt': completedAt.toJson(),
    };
  }

  static QuizAttemptInclude include() {
    return QuizAttemptInclude._();
  }

  static QuizAttemptIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizAttemptTable>? orderByList,
    QuizAttemptInclude? include,
  }) {
    return QuizAttemptIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizAttempt.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(QuizAttempt.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizAttemptImpl extends QuizAttempt {
  _QuizAttemptImpl({
    int? id,
    required int quizId,
    required int studentId,
    required int score,
    required int totalQuestions,
    required int correctAnswers,
    required int wrongAnswers,
    required DateTime completedAt,
  }) : super._(
         id: id,
         quizId: quizId,
         studentId: studentId,
         score: score,
         totalQuestions: totalQuestions,
         correctAnswers: correctAnswers,
         wrongAnswers: wrongAnswers,
         completedAt: completedAt,
       );

  /// Returns a shallow copy of this [QuizAttempt]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QuizAttempt copyWith({
    Object? id = _Undefined,
    int? quizId,
    int? studentId,
    int? score,
    int? totalQuestions,
    int? correctAnswers,
    int? wrongAnswers,
    DateTime? completedAt,
  }) {
    return QuizAttempt(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      studentId: studentId ?? this.studentId,
      score: score ?? this.score,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      completedAt: completedAt ?? this.completedAt,
    );
  }
}

class QuizAttemptUpdateTable extends _i1.UpdateTable<QuizAttemptTable> {
  QuizAttemptUpdateTable(super.table);

  _i1.ColumnValue<int, int> quizId(int value) => _i1.ColumnValue(
    table.quizId,
    value,
  );

  _i1.ColumnValue<int, int> studentId(int value) => _i1.ColumnValue(
    table.studentId,
    value,
  );

  _i1.ColumnValue<int, int> score(int value) => _i1.ColumnValue(
    table.score,
    value,
  );

  _i1.ColumnValue<int, int> totalQuestions(int value) => _i1.ColumnValue(
    table.totalQuestions,
    value,
  );

  _i1.ColumnValue<int, int> correctAnswers(int value) => _i1.ColumnValue(
    table.correctAnswers,
    value,
  );

  _i1.ColumnValue<int, int> wrongAnswers(int value) => _i1.ColumnValue(
    table.wrongAnswers,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> completedAt(DateTime value) =>
      _i1.ColumnValue(
        table.completedAt,
        value,
      );
}

class QuizAttemptTable extends _i1.Table<int?> {
  QuizAttemptTable({super.tableRelation}) : super(tableName: 'quiz_attempt') {
    updateTable = QuizAttemptUpdateTable(this);
    quizId = _i1.ColumnInt(
      'quizId',
      this,
    );
    studentId = _i1.ColumnInt(
      'studentId',
      this,
    );
    score = _i1.ColumnInt(
      'score',
      this,
    );
    totalQuestions = _i1.ColumnInt(
      'totalQuestions',
      this,
    );
    correctAnswers = _i1.ColumnInt(
      'correctAnswers',
      this,
    );
    wrongAnswers = _i1.ColumnInt(
      'wrongAnswers',
      this,
    );
    completedAt = _i1.ColumnDateTime(
      'completedAt',
      this,
    );
  }

  late final QuizAttemptUpdateTable updateTable;

  late final _i1.ColumnInt quizId;

  late final _i1.ColumnInt studentId;

  late final _i1.ColumnInt score;

  late final _i1.ColumnInt totalQuestions;

  late final _i1.ColumnInt correctAnswers;

  late final _i1.ColumnInt wrongAnswers;

  late final _i1.ColumnDateTime completedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    quizId,
    studentId,
    score,
    totalQuestions,
    correctAnswers,
    wrongAnswers,
    completedAt,
  ];
}

class QuizAttemptInclude extends _i1.IncludeObject {
  QuizAttemptInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => QuizAttempt.t;
}

class QuizAttemptIncludeList extends _i1.IncludeList {
  QuizAttemptIncludeList._({
    _i1.WhereExpressionBuilder<QuizAttemptTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuizAttempt.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => QuizAttempt.t;
}

class QuizAttemptRepository {
  const QuizAttemptRepository._();

  /// Returns a list of [QuizAttempt]s matching the given query parameters.
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
  Future<List<QuizAttempt>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<QuizAttemptTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizAttemptTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<QuizAttempt>(
      where: where?.call(QuizAttempt.t),
      orderBy: orderBy?.call(QuizAttempt.t),
      orderByList: orderByList?.call(QuizAttempt.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [QuizAttempt] matching the given query parameters.
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
  Future<QuizAttempt?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<QuizAttemptTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizAttemptTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizAttemptTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<QuizAttempt>(
      where: where?.call(QuizAttempt.t),
      orderBy: orderBy?.call(QuizAttempt.t),
      orderByList: orderByList?.call(QuizAttempt.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [QuizAttempt] by its [id] or null if no such row exists.
  Future<QuizAttempt?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<QuizAttempt>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [QuizAttempt]s in the list and returns the inserted rows.
  ///
  /// The returned [QuizAttempt]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<QuizAttempt>> insert(
    _i1.DatabaseSession session,
    List<QuizAttempt> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<QuizAttempt>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [QuizAttempt] and returns the inserted row.
  ///
  /// The returned [QuizAttempt] will have its `id` field set.
  Future<QuizAttempt> insertRow(
    _i1.DatabaseSession session,
    QuizAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuizAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [QuizAttempt]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<QuizAttempt>> update(
    _i1.DatabaseSession session,
    List<QuizAttempt> rows, {
    _i1.ColumnSelections<QuizAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<QuizAttempt>(
      rows,
      columns: columns?.call(QuizAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuizAttempt]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<QuizAttempt> updateRow(
    _i1.DatabaseSession session,
    QuizAttempt row, {
    _i1.ColumnSelections<QuizAttemptTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuizAttempt>(
      row,
      columns: columns?.call(QuizAttempt.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuizAttempt] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<QuizAttempt?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<QuizAttemptUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<QuizAttempt>(
      id,
      columnValues: columnValues(QuizAttempt.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [QuizAttempt]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<QuizAttempt>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<QuizAttemptUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<QuizAttemptTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizAttemptTable>? orderBy,
    _i1.OrderByListBuilder<QuizAttemptTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<QuizAttempt>(
      columnValues: columnValues(QuizAttempt.t.updateTable),
      where: where(QuizAttempt.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizAttempt.t),
      orderByList: orderByList?.call(QuizAttempt.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [QuizAttempt]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<QuizAttempt>> delete(
    _i1.DatabaseSession session,
    List<QuizAttempt> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<QuizAttempt>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [QuizAttempt].
  Future<QuizAttempt> deleteRow(
    _i1.DatabaseSession session,
    QuizAttempt row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuizAttempt>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<QuizAttempt>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<QuizAttemptTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<QuizAttempt>(
      where: where(QuizAttempt.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<QuizAttemptTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<QuizAttempt>(
      where: where?.call(QuizAttempt.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [QuizAttempt] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<QuizAttemptTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<QuizAttempt>(
      where: where(QuizAttempt.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
