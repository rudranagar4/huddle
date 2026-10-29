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
import 'package:huddle_server/src/generated/protocol.dart' as _i2;

abstract class QuizQuestion
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  QuizQuestion._({
    this.id,
    required this.quizId,
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    required this.explanation,
  });

  factory QuizQuestion({
    int? id,
    required int quizId,
    required String questionText,
    required List<String> options,
    required int correctOptionIndex,
    required String explanation,
  }) = _QuizQuestionImpl;

  factory QuizQuestion.fromJson(Map<String, dynamic> jsonSerialization) {
    return QuizQuestion(
      id: jsonSerialization['id'] as int?,
      quizId: jsonSerialization['quizId'] as int,
      questionText: jsonSerialization['questionText'] as String,
      options: _i2.Protocol().deserialize<List<String>>(
        jsonSerialization['options'],
      ),
      correctOptionIndex: jsonSerialization['correctOptionIndex'] as int,
      explanation: jsonSerialization['explanation'] as String,
    );
  }

  static final t = QuizQuestionTable();

  static const db = QuizQuestionRepository._();

  @override
  int? id;

  int quizId;

  String questionText;

  List<String> options;

  int correctOptionIndex;

  String explanation;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [QuizQuestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  QuizQuestion copyWith({
    int? id,
    int? quizId,
    String? questionText,
    List<String>? options,
    int? correctOptionIndex,
    String? explanation,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'QuizQuestion',
      if (id != null) 'id': id,
      'quizId': quizId,
      'questionText': questionText,
      'options': options.toJson(),
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'QuizQuestion',
      if (id != null) 'id': id,
      'quizId': quizId,
      'questionText': questionText,
      'options': options.toJson(),
      'correctOptionIndex': correctOptionIndex,
      'explanation': explanation,
    };
  }

  static QuizQuestionInclude include() {
    return QuizQuestionInclude._();
  }

  static QuizQuestionIncludeList includeList({
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    QuizQuestionInclude? include,
  }) {
    return QuizQuestionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(QuizQuestion.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _QuizQuestionImpl extends QuizQuestion {
  _QuizQuestionImpl({
    int? id,
    required int quizId,
    required String questionText,
    required List<String> options,
    required int correctOptionIndex,
    required String explanation,
  }) : super._(
         id: id,
         quizId: quizId,
         questionText: questionText,
         options: options,
         correctOptionIndex: correctOptionIndex,
         explanation: explanation,
       );

  /// Returns a shallow copy of this [QuizQuestion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  QuizQuestion copyWith({
    Object? id = _Undefined,
    int? quizId,
    String? questionText,
    List<String>? options,
    int? correctOptionIndex,
    String? explanation,
  }) {
    return QuizQuestion(
      id: id is int? ? id : this.id,
      quizId: quizId ?? this.quizId,
      questionText: questionText ?? this.questionText,
      options: options ?? this.options.map((e0) => e0).toList(),
      correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
      explanation: explanation ?? this.explanation,
    );
  }
}

class QuizQuestionUpdateTable extends _i1.UpdateTable<QuizQuestionTable> {
  QuizQuestionUpdateTable(super.table);

  _i1.ColumnValue<int, int> quizId(int value) => _i1.ColumnValue(
    table.quizId,
    value,
  );

  _i1.ColumnValue<String, String> questionText(String value) => _i1.ColumnValue(
    table.questionText,
    value,
  );

  _i1.ColumnValue<List<String>, List<String>> options(List<String> value) =>
      _i1.ColumnValue(
        table.options,
        value,
      );

  _i1.ColumnValue<int, int> correctOptionIndex(int value) => _i1.ColumnValue(
    table.correctOptionIndex,
    value,
  );

  _i1.ColumnValue<String, String> explanation(String value) => _i1.ColumnValue(
    table.explanation,
    value,
  );
}

class QuizQuestionTable extends _i1.Table<int?> {
  QuizQuestionTable({super.tableRelation}) : super(tableName: 'quiz_question') {
    updateTable = QuizQuestionUpdateTable(this);
    quizId = _i1.ColumnInt(
      'quizId',
      this,
    );
    questionText = _i1.ColumnString(
      'questionText',
      this,
    );
    options = _i1.ColumnSerializable<List<String>>(
      'options',
      this,
    );
    correctOptionIndex = _i1.ColumnInt(
      'correctOptionIndex',
      this,
    );
    explanation = _i1.ColumnString(
      'explanation',
      this,
    );
  }

  late final QuizQuestionUpdateTable updateTable;

  late final _i1.ColumnInt quizId;

  late final _i1.ColumnString questionText;

  late final _i1.ColumnSerializable<List<String>> options;

  late final _i1.ColumnInt correctOptionIndex;

  late final _i1.ColumnString explanation;

  @override
  List<_i1.Column> get columns => [
    id,
    quizId,
    questionText,
    options,
    correctOptionIndex,
    explanation,
  ];
}

class QuizQuestionInclude extends _i1.IncludeObject {
  QuizQuestionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => QuizQuestion.t;
}

class QuizQuestionIncludeList extends _i1.IncludeList {
  QuizQuestionIncludeList._({
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(QuizQuestion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => QuizQuestion.t;
}

class QuizQuestionRepository {
  const QuizQuestionRepository._();

  /// Returns a list of [QuizQuestion]s matching the given query parameters.
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
  Future<List<QuizQuestion>> find(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<QuizQuestion>(
      where: where?.call(QuizQuestion.t),
      orderBy: orderBy?.call(QuizQuestion.t),
      orderByList: orderByList?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [QuizQuestion] matching the given query parameters.
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
  Future<QuizQuestion?> findFirstRow(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<QuizQuestion>(
      where: where?.call(QuizQuestion.t),
      orderBy: orderBy?.call(QuizQuestion.t),
      orderByList: orderByList?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [QuizQuestion] by its [id] or null if no such row exists.
  Future<QuizQuestion?> findById(
    _i1.DatabaseSession session,
    int id, {
    _i1.Transaction? transaction,
    _i1.LockMode? lockMode,
    _i1.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<QuizQuestion>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [QuizQuestion]s in the list and returns the inserted rows.
  ///
  /// The returned [QuizQuestion]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  Future<List<QuizQuestion>> insert(
    _i1.DatabaseSession session,
    List<QuizQuestion> rows, {
    _i1.Transaction? transaction,
    bool ignoreConflicts = false,
  }) async {
    return session.db.insert<QuizQuestion>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
    );
  }

  /// Inserts a single [QuizQuestion] and returns the inserted row.
  ///
  /// The returned [QuizQuestion] will have its `id` field set.
  Future<QuizQuestion> insertRow(
    _i1.DatabaseSession session,
    QuizQuestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<QuizQuestion>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [QuizQuestion]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<QuizQuestion>> update(
    _i1.DatabaseSession session,
    List<QuizQuestion> rows, {
    _i1.ColumnSelections<QuizQuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<QuizQuestion>(
      rows,
      columns: columns?.call(QuizQuestion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuizQuestion]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<QuizQuestion> updateRow(
    _i1.DatabaseSession session,
    QuizQuestion row, {
    _i1.ColumnSelections<QuizQuestionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<QuizQuestion>(
      row,
      columns: columns?.call(QuizQuestion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [QuizQuestion] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<QuizQuestion?> updateById(
    _i1.DatabaseSession session,
    int id, {
    required _i1.ColumnValueListBuilder<QuizQuestionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<QuizQuestion>(
      id,
      columnValues: columnValues(QuizQuestion.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [QuizQuestion]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<QuizQuestion>> updateWhere(
    _i1.DatabaseSession session, {
    required _i1.ColumnValueListBuilder<QuizQuestionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<QuizQuestionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<QuizQuestionTable>? orderBy,
    _i1.OrderByListBuilder<QuizQuestionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<QuizQuestion>(
      columnValues: columnValues(QuizQuestion.t.updateTable),
      where: where(QuizQuestion.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(QuizQuestion.t),
      orderByList: orderByList?.call(QuizQuestion.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [QuizQuestion]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<QuizQuestion>> delete(
    _i1.DatabaseSession session,
    List<QuizQuestion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<QuizQuestion>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [QuizQuestion].
  Future<QuizQuestion> deleteRow(
    _i1.DatabaseSession session,
    QuizQuestion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<QuizQuestion>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<QuizQuestion>> deleteWhere(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<QuizQuestionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<QuizQuestion>(
      where: where(QuizQuestion.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.DatabaseSession session, {
    _i1.WhereExpressionBuilder<QuizQuestionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<QuizQuestion>(
      where: where?.call(QuizQuestion.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [QuizQuestion] rows matching the [where] expression.
  Future<void> lockRows(
    _i1.DatabaseSession session, {
    required _i1.WhereExpressionBuilder<QuizQuestionTable> where,
    required _i1.LockMode lockMode,
    required _i1.Transaction transaction,
    _i1.LockBehavior lockBehavior = _i1.LockBehavior.wait,
  }) async {
    return session.db.lockRows<QuizQuestion>(
      where: where(QuizQuestion.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
