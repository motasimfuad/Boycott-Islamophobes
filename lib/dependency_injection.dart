import 'package:boycott_islamophobes/features/category/data/datasources/category_remote_data_source.dart';
import 'package:boycott_islamophobes/features/category/data/repositories/category_repository_impl.dart';
import 'package:boycott_islamophobes/features/category/domain/repositories/category_repository.dart';
import 'package:boycott_islamophobes/features/category/domain/usecases/get_all_categories_usecase.dart';
import 'package:boycott_islamophobes/features/category/domain/usecases/get_category_usecase.dart';
import 'package:boycott_islamophobes/features/category/presentation/bloc/category_bloc.dart';
import 'package:boycott_islamophobes/features/company/data/datasources/company_remote_data_source.dart';
import 'package:boycott_islamophobes/features/company/data/repositories/company_repository_impl.dart';
import 'package:boycott_islamophobes/features/company/domain/repositories/company_repository.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_all_companies_usecase.dart';
import 'package:boycott_islamophobes/features/company/domain/usecases/get_company_usecase.dart';
import 'package:boycott_islamophobes/features/company/presentation/bloc/company_bloc.dart';
import 'package:boycott_islamophobes/features/country/data/datasources/country_remote_data_source.dart';
import 'package:boycott_islamophobes/features/country/data/repositories/country_repository_impl.dart';
import 'package:boycott_islamophobes/features/country/domain/repositories/country_repository.dart';
import 'package:boycott_islamophobes/features/country/domain/usecases/get_all_countries_usecase.dart';
import 'package:boycott_islamophobes/features/country/domain/usecases/get_country_usecase.dart';
import 'package:boycott_islamophobes/features/country/presentation/bloc/country_bloc.dart';
import 'package:boycott_islamophobes/features/product/data/datasources/product_remote_data_source.dart';
import 'package:boycott_islamophobes/features/product/data/repositories/product_repository_impl.dart';
import 'package:boycott_islamophobes/features/product/domain/repositories/product_repository.dart';
import 'package:boycott_islamophobes/features/product/presentation/bloc/product_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'features/product/domain/usecases/get_all_products_usecase.dart';
import 'features/product/domain/usecases/get_filtered_products_usecase.dart';
import 'features/product/domain/usecases/get_product_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! features
  // blocs
  getIt.registerFactory(
    () => ProductBloc(
      getAllProducts: getIt(),
      getProduct: getIt(),
      getFilteredProducts: getIt(),
    ),
  );

  getIt.registerFactory(
    () => CategoryBloc(
      getAllCategories: getIt(),
      getCategory: getIt(),
    ),
  );

  getIt.registerFactory(
    () => CountryBloc(
      getAllCountries: getIt(),
      getCountry: getIt(),
    ),
  );

  getIt.registerFactory(
    () => CompanyBloc(
      getCompanies: getIt(),
      getCompany: getIt(),
    ),
  );

  // usecases
  // --- products
  getIt.registerLazySingleton(() => GetAllProductsUsecase(getIt()));
  getIt.registerLazySingleton(() => GetProductUsecase(getIt()));
  getIt.registerLazySingleton(() => GetFilteredProductsUsecase(getIt()));
  // --- categories
  getIt.registerLazySingleton(() => GetAllCategoriesUsecase(getIt()));
  getIt.registerLazySingleton(() => GetCategoryUsecase(getIt()));
  // --- categories
  getIt.registerLazySingleton(() => GetAllCountriesUsecase(getIt()));
  getIt.registerLazySingleton(() => GetCountryUsecase(getIt()));
  // --- companies
  getIt.registerLazySingleton(() => GetAllCompaniesUsecase(getIt()));
  getIt.registerLazySingleton(() => GetCompanyUsecase(getIt()));

  // repositories
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()));
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(getIt()));
  getIt.registerLazySingleton<CountryRepository>(
      () => CountryRepositoryImpl(getIt()));
  getIt.registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(getIt()));

  //! core
  //! data
  // data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(firestore: getIt()));
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(getIt()));
  getIt.registerLazySingleton<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSourceImpl(getIt()));

  //! external
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}
