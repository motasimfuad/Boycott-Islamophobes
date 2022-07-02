import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/info/domain/entities/info_entity.dart';
import 'package:boycott_islamophobes/features/info/domain/repositories/info_repository.dart';
import 'package:dartz/dartz.dart';

class GetAppInfoUsecase implements Usecase<InfoEntity, NoParams> {
  final InfoRepository infoRepository;
  GetAppInfoUsecase(this.infoRepository);

  @override
  Future<Either<Failure, InfoEntity>> call(NoParams params) async {
    return await infoRepository.getAppInfo();
  }
}
