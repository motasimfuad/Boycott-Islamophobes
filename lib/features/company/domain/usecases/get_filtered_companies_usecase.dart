import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/core/usecases/usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/features/company/domain/repositories/company_repository.dart';
import 'package:dartz/dartz.dart';

class GetFilteredCompaniesUsecase
    implements Usecase<List<CompanyEntity>, Params> {
  final CompanyRepository repository;
  GetFilteredCompaniesUsecase(this.repository);

  @override
  Future<Either<Failure, List<CompanyEntity>>> call(params) async {
    return await repository.getFilteredCompanies(countryId: params.countryId!);
  }
}
