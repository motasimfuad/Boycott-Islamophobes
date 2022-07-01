part of 'internet_bloc.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetLoadingState extends InternetState {}

class InternetConnectedState extends InternetState {}

class InternetDisconnectedState extends InternetState {}
