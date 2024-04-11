part of 'heroes_cubit.dart';

class HeroesState {
  bool isLoading;
  String? error;
  ResponsePaginateModel<HeroModel>? paginate;
  TextEditingController searchController;

  HeroesState({
    this.isLoading = false,
    this.error,
    this.paginate,
    TextEditingController? searchController,
  }) : searchController = searchController ?? TextEditingController();

  HeroesState copyWith(
          {bool? isLoading,
          String? error,
          ResponsePaginateModel<HeroModel>? paginate}) =>
      HeroesState(
          isLoading: isLoading ?? this.isLoading,
          paginate: paginate ?? this.paginate,
          searchController: searchController,
          error: error);
}
