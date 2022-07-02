import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/info/domain/entities/info_entity.dart';
import 'package:dartz/dartz.dart';

abstract class InfoRepository {
  Future<Either<Failure, InfoEntity>> getAppInfo();
}
