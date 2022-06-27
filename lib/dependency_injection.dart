import 'package:boycott_islamophobes/features/category/data/datasources/category_remote_data_source.dart';
import 'package:boycott_islamophobes/features/category/data/repositories/category_repository_impl.dart';
import 'package:boycott_islamophobes/features/category/domain/repositories/category_repository.dart';
import 'package:boycott_islamophobes/features/category/domain/usecases/get_all_categories_usecase.dart';
import 'package:boycott_islamophobes/features/category/domain/usecases/get_category_usecase.dart';
import 'package:boycott_islamophobes/features/category/presentation/bloc/category_bloc.dart';
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

  // usecases
  getIt.registerLazySingleton(() => GetAllProductsUsecase(getIt()));
  getIt.registerLazySingleton(() => GetProductUsecase(getIt()));
  getIt.registerLazySingleton(() => GetFilteredProductsUsecase(getIt()));

  getIt.registerLazySingleton(() => GetAllCategoriesUsecase(getIt()));
  getIt.registerLazySingleton(() => GetCategoryUsecase(getIt()));

  // repositories
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt()));
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(getIt()));

  //! core
  //! data
  // data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(firestore: getIt()));
  getIt.registerLazySingleton<CategoryRemoteDataSource>(
      () => CategoryRemoteDataSourceImpl(getIt()));

  //! external
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}
