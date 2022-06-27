import 'package:boycott_islamophobes/dependency_injection.dart';
import 'package:boycott_islamophobes/features/company/presentation/bloc/company_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/category/presentation/bloc/category_bloc.dart';
import 'features/country/presentation/bloc/country_bloc.dart';
import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/quote/presentation/bloc/quote_bloc.dart';

class BlocProviders extends StatelessWidget {
  final Widget child;
  const BlocProviders({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CategoryBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CountryBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<CompanyBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<QuoteBloc>(),
        ),
      ],
      child: child,
    );
  }
}
