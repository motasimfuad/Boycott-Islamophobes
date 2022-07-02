import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/info/data/datasources/info_remote_datasource.dart';
import 'package:boycott_islamophobes/features/info/domain/entities/info_entity.dart';
import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/info/domain/repositories/info_repository.dart';
import 'package:dartz/dartz.dart';

class InfoRepositoryImpl implements InfoRepository {
  final InfoRemoteDatasource datasource;
  InfoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, InfoEntity>> getAppInfo() async {
    try {
      InfoEntity info = await datasource.getAppInfo();
      return Right(info);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }
}
