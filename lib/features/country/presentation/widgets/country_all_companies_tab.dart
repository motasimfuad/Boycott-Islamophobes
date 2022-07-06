import 'package:boycott_islamophobes/core/widgets/k_item_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_grid.dart';
import '../../../company/domain/entities/company_entity.dart';

class CountryAllCompaniesTab extends StatelessWidget {
  final List<CompanyEntity> companies;
  final bool? isLoading;
  const CountryAllCompaniesTab({
    Key? key,
    required this.companies,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KColors.kBackgroundColor,
      child: (companies.isEmpty && isLoading != true)
          ? const Center(
              child: Text(
                'No company found!',
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: KGrid(
                      isLoading: isLoading,
                      items: companies,
                      itemBuilder: (context, index) {
                        final company = companies[index];

                        return KItemCard(
                          tag: company.id,
                          name: company.name,
                          imageUrl: company.logoUrl,
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
