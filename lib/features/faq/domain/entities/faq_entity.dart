import 'dart:convert';

import 'package:equatable/equatable.dart';

class FaqEntity extends Equatable {
  final int id;
  final String question;
  final String answer;
  final String? link;
  final String? imageUrl;
  const FaqEntity({
    required this.id,
    required this.question,
    required this.answer,
    this.link,
    this.imageUrl,
  });

  @override
  List<Object> get props {
    return [
      id,
      question,
      answer,
    ];
  }

  FaqEntity copyWith({
    int? id,
    String? question,
    String? answer,
    String? link,
    String? imageUrl,
  }) {
    return FaqEntity(
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

  factory FaqEntity.fromMap(Map<String, dynamic> map) {
    return FaqEntity(
      id: map['id']?.toInt() ?? 0,
      question: map['question'] ?? '',
      answer: map['answer'] ?? '',
      link: map['link'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FaqEntity.fromJson(String source) =>
      FaqEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FaqEntity(id: $id, question: $question, answer: $answer, link: $link, imageUrl: $imageUrl)';
  }
}
