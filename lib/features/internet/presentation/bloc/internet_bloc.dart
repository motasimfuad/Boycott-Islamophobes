import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final InternetConnectionChecker internetChecker;

  InternetBloc({
    required this.internetChecker,
  }) : super(InternetInitial()) {
    on<InternetEvent>((event, emit) async {
      if (event is CheckInternetEvent) {
        emit(InternetLoadingState());
        internetChecker.onStatusChange.listen((status) {
          if (status == InternetConnectionStatus.connected) {
            emit(InternetConnectedState());
          } else {
            emit(InternetDisconnectedState());
          }
        });
      }
    });
  }
}
