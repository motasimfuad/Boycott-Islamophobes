import 'dart:convert';

import '../../domain/entities/quote_entity.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel({
    required super.id,
    required super.quote,
    required super.by,
  });

  QuoteModel copyWith({
    int? id,
    String? quote,
    String? by,
  }) {
    return QuoteModel(
      id: id ?? this.id,
      quote: quote ?? this.quote,
      by: by ?? this.by,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quote': quote,
      'by': by,
    };
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['id']?.toInt() ?? 0,
      quote: map['quote'] ?? '',
      by: map['by'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteModel.fromJson(String source) =>
      QuoteModel.fromMap(json.decode(source));

  @override
  String toString() => 'CompanyEntity(id: $id, quote: $quote, by: $by)';
}
