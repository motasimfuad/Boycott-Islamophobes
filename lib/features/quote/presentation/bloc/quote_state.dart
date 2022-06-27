part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();

  @override
  List<Object> get props => [];
}

class QuoteInitial extends QuoteState {}

class QuoteListLoading extends QuoteState {}

class QuoteListError extends QuoteState {
  final String message;
  const QuoteListError({required this.message});

  @override
  List<Object> get props => [message];
}

class QuoteListLoaded extends QuoteState {
  final List<QuoteEntity> quotes;
  const QuoteListLoaded({required this.quotes});

  @override
  List<Object> get props => [quotes];
}
