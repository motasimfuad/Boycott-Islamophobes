import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:boycott_islamophobes/features/country/domain/usecases/get_all_countries_usecase.dart';
import 'package:boycott_islamophobes/features/country/domain/usecases/get_country_usecase.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetAllCountriesUsecase getAllCountries;
  final GetCountryUsecase getCountry;
  CountryBloc({
    required this.getAllCountries,
    required this.getCountry,
  }) : super(CountryInitial()) {
    on<CountryEvent>((event, emit) async {
      // get all countries
      if (event is GetAllCountriesEvent) {
        emit(CountryListLoading());
        final either = await getAllCountries(NoParams());
        either.fold(
          (failure) => emit(CountryListError(message: failure.toString())),
          (r) => emit(CountryListLoaded(countries: r)),
        );
      }

      // get country by id
      if (event is GetCountryEvent) {
        emit(CountryLoading());
        final either = await getCountry(Params(id: event.countryId));
        either.fold(
          (l) => emit(CountryError(message: l.toString())),
          (r) => emit(CountryLoaded(country: r)),
        );
      }
    });
  }
}
