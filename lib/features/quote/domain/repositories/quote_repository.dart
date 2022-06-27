import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/quote_entity.dart';

abstract class QuoteRepository {
  Future<Either<Failure, List<QuoteEntity>>> getAllQuotes();
}
