import 'package:equatable/equatable.dart';
import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class WinnerModel extends Equatable {
  final String id;
  final String name;
  final String imageUrl;

  const WinnerModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory WinnerModel.fromJson(Map<String, dynamic> json) {
    return WinnerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  WinnerEntity toEntity() {
    return WinnerEntity(id: id, name: name, imageUrl: imageUrl);
  }

  @override
  List<Object?> get props => [id, name, imageUrl];
}
