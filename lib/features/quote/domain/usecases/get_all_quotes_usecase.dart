import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quote_entity.dart';
import '../repositories/quote_repository.dart';

class GetAllQuotesUsecase implements Usecase<List<QuoteEntity>, NoParams> {
  final QuoteRepository repository;
  GetAllQuotesUsecase(this.repository);

  @override
  Future<Either<Failure, List<QuoteEntity>>> call(NoParams params) async {
    return await repository.getAllQuotes();
  }
}
