import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc() : super(InfoInitial()) {
    on<InfoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
