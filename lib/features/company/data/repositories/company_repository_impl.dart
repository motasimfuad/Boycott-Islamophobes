import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/company/data/datasources/company_remote_data_source.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/company/domain/repositories/company_repository.dart';
import 'package:dartz/dartz.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  final CompanyRemoteDataSource dataSource;
  CompanyRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CompanyEntity>>> getAllCompanies() async {
    try {
      List<CompanyEntity> companies = await dataSource.getAllCompanies();
      return Right(companies);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }

  @override
  Future<Either<Failure, CompanyEntity>> getCompany({required int id}) async {
    try {
      CompanyEntity company = await dataSource.getCompany(id);
      return Right(company);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }
}
