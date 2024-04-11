import 'package:objetive_test/models/hero_model.dart';
import 'package:objetive_test/models/paginate_response_model.dart';
import 'package:objetive_test/models/response_model.dart';

abstract class CharactersRepository {
  Future<ResponseModel<ResponsePaginateModel<HeroModel>>> findAll(
      {int offset = 0, int limit = 4, String? search});
}
