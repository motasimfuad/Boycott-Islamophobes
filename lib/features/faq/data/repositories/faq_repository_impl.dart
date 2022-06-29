import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/faq/data/datasources/faq_remote_data_source.dart';
import 'package:boycott_islamophobes/features/faq/domain/entities/faq_entity.dart';
import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/faq/domain/repositories/faq_repository.dart';
import 'package:dartz/dartz.dart';

class FaqRepositoryImpl implements FaqRepository {
  final FaqRemoteDataSource dataSource;
  FaqRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<FaqEntity>>> getAllFaqs() async {
    try {
      List<FaqEntity> faqs = await dataSource.getAllFaqs();
      return Right(faqs);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }
}
