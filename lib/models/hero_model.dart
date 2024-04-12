import 'package:objetive_test/models/comic_model.dart';
import 'package:objetive_test/models/serie_model.dart';
import 'package:objetive_test/models/story_model.dart';
import 'package:objetive_test/models/thumbnail_model.dart';

class HeroModel {
  int id;
  String name;
  String description;
  ThumbnailModel thumbnail;
  List<ComicModel> comics;
  List<SerieModel> series;
  List<StoryModel> stories;

  HeroModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail,
      this.comics = const [],
      this.series = const [],
      this.stories = const []});

  factory HeroModel.fromJson(Map<String, dynamic> json) => HeroModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnail: ThumbnailModel.fromJson(json['thumbnail']),
      comics: (json['comics']['items'] as List)
          .map((e) => ComicModel.fromJson(e))
          .toList(),
      series: (json['series']['items'] as List)
          .map((e) => SerieModel.fromJson(e))
          .toList(),
      stories: (json['stories']['items'] as List)
          .map((e) => StoryModel.fromJson(e))
          .toList());
}
