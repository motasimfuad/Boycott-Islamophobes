part of 'info_bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoState {}

class LogoDownloading extends InfoState {}

class LogoDownloaded extends InfoState {}

class LogoDownloadError extends InfoState {
  final String message;
  const LogoDownloadError({required this.message});

  @override
  List<Object> get props => [message];
}
