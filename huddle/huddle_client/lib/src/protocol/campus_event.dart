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

abstract class CampusEvent implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
