import 'package:boycott_islamophobes/features/product/data/datasources/product_remote_data_source.dart';
import 'package:boycott_islamophobes/features/product/data/repositories/product_repository_impl.dart';
import 'package:boycott_islamophobes/features/product/domain/repositories/product_repository.dart';
import 'package:boycott_islamophobes/features/product/presentation/bloc/product_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

import 'features/product/domain/usecases/get_all_products_usecase.dart';
import 'features/product/domain/usecases/get_product_usecase.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //! features
  // blocs
  getIt.registerFactory(
    () => ProductBloc(
      getAllProducts: getIt(),
      getProduct: getIt(),
    ),
  );

  // usecases
  getIt.registerLazySingleton(() => GetAllProductsUsecase(getIt()));
  getIt.registerLazySingleton(() => GetProductUsecase(getIt()));

  // repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );

  //! core
  //! data
  // data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(
      firestore: getIt(),
    ),
  );

  //! external
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);
}
