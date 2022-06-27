import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/quote/data/datasources/quote_remote_dara_source.dart';
import 'package:dartz/dartz.dart';

import 'package:boycott_islamophobes/features/quote/domain/entities/quote_entity.dart';

import 'package:boycott_islamophobes/core/error/failures.dart';

import '../../domain/repositories/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteRemoteDataSource dataSource;
  QuoteRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<QuoteEntity>>> getAllQuotes() async {
    try {
      List<QuoteEntity> quotes = await dataSource.getAllQuotes();
      return Right(quotes);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }
}
