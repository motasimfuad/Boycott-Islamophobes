import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/faq/domain/entities/faq_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FaqRepository {
  Future<Either<Failure, List<FaqEntity>>> getAllFaqs();
}
