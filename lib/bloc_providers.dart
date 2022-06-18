import 'package:boycott_islamophobes/dependency_injection.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/product/presentation/bloc/product_bloc.dart';

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
      ],
      child: child,
    );
  }
}
