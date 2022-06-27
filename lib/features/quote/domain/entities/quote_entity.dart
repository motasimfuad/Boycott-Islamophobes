import 'package:equatable/equatable.dart';

class QuoteEntity extends Equatable {
  final int id;
  final String quote;
  final String by;
  const QuoteEntity({
    required this.id,
    required this.quote,
    required this.by,
  });

  @override
  List<Object> get props => [id, quote, by];
}
