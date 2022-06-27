import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final int id;
  final String name;
  final String logoUrl;
  const CompanyEntity({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  @override
  List<Object> get props => [id, name, logoUrl];
}
