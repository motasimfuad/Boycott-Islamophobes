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
}
