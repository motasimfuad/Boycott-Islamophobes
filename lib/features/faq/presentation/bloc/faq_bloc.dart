import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'faq_event.dart';
part 'faq_state.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  FaqBloc() : super(FaqInitial()) {
    on<FaqEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
