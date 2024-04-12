import 'package:objetive_test/models/detail_item_hero_model.dart';

class StoryModel extends DetailItemHeroModel {
  String type;

  StoryModel(
      {required super.resourceURI, required super.name, required this.type});

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
      resourceURI: json['resourceURI'], name: json['name'], type: json['type']);
}
