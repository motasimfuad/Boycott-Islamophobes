import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final int id;
  final String name;
  final String flagUrl;
  final bool isBlacklisted;
  final String? reason;
  const CountryEntity({
    required this.id,
    required this.name,
    required this.flagUrl,
    required this.isBlacklisted,
    this.reason,
  });

  @override
  List<Object> get props => [id, name, flagUrl, isBlacklisted];
}
