part of 'quote_bloc.dart';

abstract class QuoteState extends Equatable {
  const QuoteState();  

  @override
  List<Object> get props => [];
}
class QuoteInitial extends QuoteState {}
