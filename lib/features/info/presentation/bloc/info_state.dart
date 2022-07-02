part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class LogoDownloaded extends InfoState {}
