import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:boycott_islamophobes/core/widgets/k_item_card.dart';
import 'package:boycott_islamophobes/features/company/domain/entities/company_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_grid.dart';
import '../../../company/presentation/bloc/company_bloc.dart';

class AllCompaniesPage extends StatefulWidget {
  const AllCompaniesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCompaniesPage> createState() => _AllCompaniesPageState();
}

class _AllCompaniesPageState extends State<AllCompaniesPage> {
  List<CompanyEntity> companies = [];

  @override
  void initState() {
    context.read<CompanyBloc>().add(GetAllCompaniesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppbar(
        title: 'Blacklisted Companies',
      ),
      body: SafeArea(
        child: BlocBuilder<CompanyBloc, CompanyState>(
          builder: (context, state) {
            if (state is CompanyListLoaded) {
              companies = state.companies;
            }
            return Container(
              color: KColors.primary.shade100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: KGrid(
                        isLoading: (state is CompanyListLoading) ? true : false,
                        items: companies,
                        childAspectRatio: 1,
                        itemBuilder: (context, index) {
                          final company = companies[index];

                          return KItemCard(
                            tag: company.id,
                            name: company.name,
                            imageUrl: company.logoUrl,
                            // imageFit: BoxFit.cover,
                            // padding: 0,
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
