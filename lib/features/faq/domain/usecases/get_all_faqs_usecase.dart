import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/faq/domain/entities/faq_entity.dart';
import 'package:boycott_islamophobes/features/faq/domain/repositories/faq_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllFaqsUsecase implements Usecase<List<FaqEntity>, NoParams> {
  final FaqRepository repository;
  GetAllFaqsUsecase(this.repository);

  @override
  Future<Either<Failure, List<FaqEntity>>> call(params) async {
    return await repository.getAllFaqs();
  }
}
