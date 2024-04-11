class ResponsePaginateModel<T> {
  int offset;
  int limit;
  int total;
  int count;
  List<T> results;

  ResponsePaginateModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  int get pageNumber => offset >= total ? -1 : (offset / limit).round() + 1;

  int? get prevPageNumber {
    if (offset - 4 < 0) return null;
    return pageNumber - 1;
  }

  int? get nextPageNumber {
    if (offset + 4 >= total) return null;
    return pageNumber + 1;
  }

  int? get nextByNextPageNumber {
    if (offset + 8 >= total) return null;
    return pageNumber + 2;
  }

  factory ResponsePaginateModel.fromJson(Map<String, dynamic> json,
          {required T Function(Map<String, dynamic> map) parser}) =>
      ResponsePaginateModel(
          offset: json['offset'],
          limit: json['limit'],
          total: json['total'],
          count: json['count'],
          results: (json['results'] as List).map((e) => parser(e)).toList());
}
