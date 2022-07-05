import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/info/domain/entities/info_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:boycott_islamophobes/features/info/domain/usecases/get_app_info_usecase.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final GetAppInfoUsecase getAppInfo;
  InfoBloc({
    required this.getAppInfo,
  }) : super(InfoInitial()) {
    on<InfoEvent>((event, emit) async {
      if (event is DownloadHQLogoEvent) {
        emit(LogoDownloading());
        InfoEntity? info;
        dynamic downloadResult;
        Response? response;

        var either = await getAppInfo(NoParams());
        either.fold(
          (l) => emit(LogoDownloadError(message: l.toString())),
          (r) {
            info = r;
          },
        );

        _save() async {
          response = await Dio().get(
            info!.logoHqUrl,
            options: Options(responseType: ResponseType.bytes),
          );
          downloadResult = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response?.data),
            quality: 100,
            name: "Boycott Islamophobes logo",
          );
        }

        if (info != null) {
          await _save();
          if (downloadResult['isSuccess'] == true) {
            emit(LogoDownloaded());
          } else {
            emit(const LogoDownloadError(message: 'Downloading Failed'));
          }
        }
        if (response == null) {
          emit(const LogoDownloadError(message: 'Downloading Failed'));
        }
      }
    });
  }
}
