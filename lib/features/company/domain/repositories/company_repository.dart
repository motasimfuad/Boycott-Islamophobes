import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies();
  Future<Either<Failure, CompanyEntity>> getCompany({required int id});
  Future<Either<Failure, List<CompanyEntity>>> getFilteredCompanies(
      {required int countryId});
}
