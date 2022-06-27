import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/company_entity.dart';
import '../repositories/company_repository.dart';

class GetCompany implements Usecase<CompanyEntity, Params> {
  final CompanyRepository repository;
  GetCompany(this.repository);

  @override
  Future<Either<Failure, CompanyEntity>> call(Params params) async {
    return await repository.getCompany(id: params.id!);
  }
}
