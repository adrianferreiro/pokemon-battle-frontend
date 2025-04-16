import 'package:pokemon_app/features/battle/domain/entities/entities.dart';

class WinnerModel {
  final String id;
  final String name;
  final String imageUrl;

  WinnerModel({required this.id, required this.name, required this.imageUrl});

  factory WinnerModel.fromJson(Map<String, dynamic> json) {
    return WinnerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Winner toEntity() {
    return Winner(id: id, name: name, imageUrl: imageUrl);
  }
}
