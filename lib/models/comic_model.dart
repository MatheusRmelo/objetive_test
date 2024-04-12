import 'package:objetive_test/models/detail_item_hero_model.dart';

class ComicModel extends DetailItemHeroModel {
  ComicModel({required super.resourceURI, required super.name});

  factory ComicModel.fromJson(Map<String, dynamic> json) =>
      ComicModel(resourceURI: json['resourceURI'], name: json['name']);
}
