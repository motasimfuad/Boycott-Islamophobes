import 'dart:convert';

import 'package:boycott_islamophobes/features/info/domain/entities/info_entity.dart';

class InfoModel extends InfoEntity {
  const InfoModel({
    required super.name,
    required super.logoUrl,
    required super.logoHqUrl,
  });

  InfoModel copyWith({
    String? name,
    String? logoUrl,
    String? logoHqUrl,
  }) {
    return InfoModel(
      name: name ?? this.name,
      logoUrl: logoUrl ?? this.logoUrl,
      logoHqUrl: logoHqUrl ?? this.logoHqUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logoUrl': logoUrl,
      'logoHqUrl': logoHqUrl,
    };
  }

  factory InfoModel.fromMap(Map<String, dynamic> map) {
    return InfoModel(
      name: map['name'] ?? '',
      logoUrl: map['logoUrl'] ?? '',
      logoHqUrl: map['logoHqUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InfoModel.fromJson(String source) =>
      InfoModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'InfoModel(name: $name, logoUrl: $logoUrl, logoHqUrl: $logoHqUrl)';
}
