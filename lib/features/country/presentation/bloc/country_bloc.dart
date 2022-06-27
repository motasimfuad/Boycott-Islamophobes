import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'country_event.dart';
part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    on<CountryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
