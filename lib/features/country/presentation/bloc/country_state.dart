part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryListLoading extends CountryState {}

class CountryListError extends CountryState {
  final String message;
  const CountryListError({required this.message});

  @override
  List<Object> get props => [message];
}

class CountryListLoaded extends CountryState {
  final List<CountryEntity> countries;
  const CountryListLoaded({required this.countries});

  @override
  List<Object> get props => [countries];
}

class CountryLoading extends CountryState {}

class CountryError extends CountryState {
  final String message;
  const CountryError({required this.message});

  @override
  List<Object> get props => [message];
}

class CountryLoaded extends CountryState {
  final CountryEntity country;
  const CountryLoaded({required this.country});

  @override
  List<Object> get props => [country];
}
