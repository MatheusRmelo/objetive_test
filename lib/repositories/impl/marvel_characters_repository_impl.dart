import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:objetive_test/constants/app_keys.dart';
import 'package:objetive_test/models/hero_model.dart';
import 'package:objetive_test/models/paginate_response_model.dart';
import 'package:objetive_test/models/response_model.dart';
import 'package:objetive_test/repositories/characters_repository.dart';
import 'package:http/http.dart' as http;

class MarvelCharactersRepositoryImpl extends CharactersRepository {
  final String _baseUrl = 'https://gateway.marvel.com/v1/public/';
  final String _path = 'characters';

  String _generateHash(int timestamp) {
    return md5
        .convert(utf8.encode(
            '$timestamp${AppKeys.privateApiKey}${AppKeys.publicApiKey}'))
        .toString();
  }

  @override
  Future<ResponseModel<ResponsePaginateModel<HeroModel>>> findAll(
      {int offset = 0, int limit = 4, String? search}) async {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    var response = await http.get(Uri.parse(
      '$_baseUrl$_path?orderBy=name&offset=$offset&limit=$limit${(search ?? '').isEmpty ? '' : '&nameStartsWith=$search'}&apikey=${AppKeys.publicApiKey}&hash=${_generateHash(timestamp)}&ts=$timestamp',
    ));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return ResponseModel(
          result: ResponsePaginateModel.fromJson(result['data'],
              parser: HeroModel.fromJson));
    }
    return ResponseModel(error: 'Falha ao buscar herois');
  }
}
