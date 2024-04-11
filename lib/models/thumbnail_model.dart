class ThumbnailModel {
  String path;
  String extension;

  ThumbnailModel({required this.path, required this.extension});

  String get url => '$path.$extension';

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) =>
      ThumbnailModel(path: json['path'], extension: json['extension']);
}
