import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/info/data/models/info_model.dart';
import 'package:dartz/dartz.dart';

abstract class InfoRepository {
  Future<Either<Failure, InfoModel>> getAppInfo();
}
