import 'package:equatable/equatable.dart';

class InfoEntity extends Equatable {
  final String name;
  final String logoUrl;
  final String logoHqUrl;
  const InfoEntity({
    required this.name,
    required this.logoUrl,
    required this.logoHqUrl,
  });

  @override
  List<Object?> get props => [name, logoUrl, logoHqUrl];
}
