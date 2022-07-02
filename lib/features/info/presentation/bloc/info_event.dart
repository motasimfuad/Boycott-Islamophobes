part of 'info_bloc.dart';

abstract class InfoEvent extends Equatable {
  const InfoEvent();

  @override
  List<Object> get props => [];
}

class DownloadHQLogoEvent extends InfoEvent {}
