import 'package:boycott_islamophobes/core/error/exceptions.dart';
import 'package:boycott_islamophobes/features/country/data/datasources/country_remote_data_source.dart';
import 'package:boycott_islamophobes/features/country/domain/entities/country_entity.dart';
import 'package:boycott_islamophobes/core/error/failures.dart';
import 'package:boycott_islamophobes/features/country/domain/repositories/country_repository.dart';
import 'package:dartz/dartz.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource dataSource;
  CountryRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<CountryEntity>>> getAllCountries() async {
    try {
      List<CountryEntity> countries = await dataSource.getAllCountries();
      return Right(countries);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }

  @override
  Future<Either<Failure, CountryEntity>> getCountry({required int id}) async {
    try {
      CountryEntity country = await dataSource.getCountry(id);
      return Right(country);
    } on RemoteException {
      return Left(RemoteFailure());
    }
  }
}
