import 'dart:convert';

import 'package:boycott_islamophobes/features/faq/domain/entities/faq_entity.dart';

class FaqModel extends FaqEntity {
  const FaqModel({
    required super.id,
    required super.question,
    required super.answer,
    super.link,
    super.imageUrl,
  });

  FaqModel copyWith({
    int? id,
    String? question,
    String? answer,
    String? link,
    String? imageUrl,
  }) {
    return FaqModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      link: link ?? this.link,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'answer': answer,
      'link': link,
      'imageUrl': imageUrl,
    };
  }

  factory FaqModel.fromMap(Map<String, dynamic> map) {
    return FaqModel(
      id: map['id']?.toInt() ?? 0,
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      link: map['link'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqModel.fromJson(String source) =>
      FaqModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FaqModel(id: $id, question: $question, answer: $answer, link: $link, imageUrl: $imageUrl)';
  }
}
