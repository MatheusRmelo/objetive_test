import 'package:objetive_test/models/detail_item_hero_model.dart';

class SerieModel extends DetailItemHeroModel {
  SerieModel({required super.resourceURI, required super.name});

  factory SerieModel.fromJson(Map<String, dynamic> json) =>
      SerieModel(resourceURI: json['resourceURI'], name: json['name']);
}
