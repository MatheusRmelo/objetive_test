import 'package:objetive_test/models/thumbnail_model.dart';

class HeroModel {
  int id;
  String name;
  String description;
  ThumbnailModel thumbnail;

  HeroModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail});

  factory HeroModel.fromJson(Map<String, dynamic> json) => HeroModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnail: ThumbnailModel.fromJson(json['thumbnail']));
}
