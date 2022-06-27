import 'package:boycott_islamophobes/features/category/domain/entities/category_entity.dart';
import 'package:boycott_islamophobes/features/category/presentation/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/widgets/k_grid.dart';
import '../widgets/category_card.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  List<CategoryEntity> categories = [];
  bool isLoading = false;

  @override
  void initState() {
    context.read<CategoryBloc>().add(GetAllCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        elevation: 1,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoriesLoading) {
              isLoading = true;
            }
            if (state is CategoriesLoaded) {
              categories = state.categories;
              isLoading = false;
            }
            return Container(
              color: KColors.primary.shade100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: KGrid(
                        isLoading: isLoading,
                        items: categories,
                        childAspectRatio: 1,
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          return CategoryCard(
                            category: category,
                            onTap: () {
                              router.pushNamed(
                                AppRouter.categoryPage,
                                params: {
                                  RouterParams.id: category.id.toString()
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
