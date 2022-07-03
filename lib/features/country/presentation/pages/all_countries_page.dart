import 'package:boycott_islamophobes/core/router/app_router.dart';
import 'package:boycott_islamophobes/core/widgets/k_appbar.dart';
import 'package:boycott_islamophobes/core/widgets/k_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/widgets/k_grid.dart';
import '../../domain/entities/country_entity.dart';
import '../bloc/country_bloc.dart';

class AllCountriesPage extends StatefulWidget {
  const AllCountriesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AllCountriesPage> createState() => _AllCountriesPageState();
}

class _AllCountriesPageState extends State<AllCountriesPage> {
  List<CountryEntity> countries = [];

  @override
  void initState() {
    context.read<CountryBloc>().add(GetAllCountriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppbar(
        title: 'Blacklisted Countries',
      ),
      body: SafeArea(
        child: BlocBuilder<CountryBloc, CountryState>(
          builder: (context, state) {
            if (state is CountryListLoaded) {
              countries = state.countries;
            }
            return Container(
              color: KColors.primary.shade100,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: KGrid(
                        isLoading: (state is CountryListLoading) ? true : false,
                        items: countries,
                        childAspectRatio: 1,
                        itemBuilder: (context, index) {
                          final country = countries[index];

                          return KItemCard(
                            tag: country.id,
                            name: country.name,
                            imageUrl: country.flagUrl,
                            imageFit: BoxFit.cover,
                            padding: 0,
                            onTap: () {
                              router.pushNamed(
                                AppRouter.countryPage,
                                params: {
                                  RouterParams.id: country.id.toString()
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
