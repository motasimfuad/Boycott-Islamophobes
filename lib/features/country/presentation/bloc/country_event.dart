part of 'country_bloc.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object> get props => [];
}

class GetAllCountriesEvent extends CountryEvent {}

class GetCountryEvent extends CountryEvent {
  final int countryId;
  const GetCountryEvent({required this.countryId});

  @override
  List<Object> get props => [countryId];
}
