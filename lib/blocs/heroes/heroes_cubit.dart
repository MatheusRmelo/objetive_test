import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:objetive_test/helpers/debouncer.dart';
import 'package:objetive_test/models/hero_model.dart';
import 'package:objetive_test/models/paginate_response_model.dart';
import 'package:objetive_test/repositories/characters_repository.dart';

part 'heroes_state.dart';

class HeroesCubit extends Cubit<HeroesState> {
  final _repository = GetIt.I<CharactersRepository>();
  final _debouncer = Debouncer(milliseconds: 2000);

  HeroesCubit() : super(HeroesState());

  void init() {
    state.searchController.addListener(() {
      _debouncer.run(() {
        getHeroes(
          limit: 4,
          offset: 0,
        );
      });
    });
    getHeroes();
  }

  void prevPage() {
    if (state.paginate == null) return;
    if (state.paginate!.offset - 4 >= 0) {
      getHeroes(offset: state.paginate!.offset - 4);
    }
  }

  void nextPage() {
    if (state.paginate == null) return;
    if (state.paginate!.offset + 4 <= state.paginate!.total) {
      getHeroes(offset: state.paginate!.offset + 4);
    }
  }

  void goToPage(int page) {
    if (state.paginate == null) return;
    if ((page - 1) * 4 <= state.paginate!.total) {
      getHeroes(offset: (page - 1) * 4);
    }
  }

  Future<void> getHeroes({int offset = 0, int limit = 4}) async {
    emit(state.copyWith(isLoading: true));
    var response = await _repository.findAll(
        limit: limit, offset: offset, search: state.searchController.text);
    emit(state.copyWith(
        isLoading: false, paginate: response.result, error: response.error));
  }
}
