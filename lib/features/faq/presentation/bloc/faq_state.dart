part of 'faq_bloc.dart';

abstract class FaqState extends Equatable {
  const FaqState();

  @override
  List<Object> get props => [];
}

class FaqInitial extends FaqState {}

class FaqListLoading extends FaqState {}

class FaqListError extends FaqState {
  final String message;
  const FaqListError({required this.message});

  @override
  List<Object> get props => [message];
}

class FaqListLoaded extends FaqState {
  final List<FaqEntity> faqs;
  const FaqListLoaded({required this.faqs});

  @override
  List<Object> get props => [faqs];
}
