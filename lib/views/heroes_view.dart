import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objetive_test/blocs/heroes/heroes_cubit.dart';
import 'package:objetive_test/views/widgets/error_widget.dart';
import 'package:objetive_test/views/widgets/form_field_widget.dart';
import 'package:objetive_test/views/widgets/hero_card.dart';
import 'package:objetive_test/views/widgets/loading_widget.dart';
import 'package:objetive_test/views/widgets/marvel_app_bar.dart';
import 'package:objetive_test/views/widgets/number_circle_widget.dart';
import 'package:objetive_test/views/widgets/text_field_widget.dart';

class HeroesView extends StatefulWidget {
  const HeroesView({super.key});

  @override
  State<HeroesView> createState() => _HeroesViewState();
}

class _HeroesViewState extends State<HeroesView> {
  final _bloc = HeroesCubit();

  @override
  void initState() {
    super.initState();
    _bloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MarvelAppBar(
        title: 'TESTE-FRONTEND',
      ),
      body: BlocBuilder<HeroesCubit, HeroesState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state.error != null) {
              return CustomErrorWidget(
                  error: state.error!, onRefresh: _bloc.getHeroes);
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: FormFieldWidget(
                      label: 'Nome do personagem',
                      child: TextFieldWidget(
                        controller: state.searchController,
                        placeholder: 'Digite o nome do personagem',
                      )),
                ),
                Container(
                  height: 40,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 24),
                        width: 64,
                      ),
                      const Expanded(
                          child: Text(
                        'Nome',
                        style: TextStyle(color: Colors.white),
                      ))
                    ],
                  ),
                ),
                Expanded(child: Builder(builder: (context) {
                  if (state.isLoading || state.paginate == null) {
                    return const LoadingWidget();
                  }
                  if (state.paginate!.results.isEmpty) {
                    return const Center(
                      child: Text('Nenhum resultado encontrado'),
                    );
                  }
                  return ListView.builder(
                      itemBuilder: (context, index) => HeroCard(
                            onTap: () {
                              Navigator.pushNamed(context, '/details',
                                  arguments: state.paginate!.results[index]);
                            },
                            hero: state.paginate!.results[index],
                          ),
                      itemCount: state.paginate!.results.length);
                })),
                Row(
                  children: [
                    IconButton(
                      onPressed: state.paginate == null ? null : _bloc.prevPage,
                      color: Theme.of(context).primaryColor,
                      iconSize: 64,
                      icon: const Icon(
                        Icons.arrow_left_rounded,
                      ),
                    ),
                    Expanded(
                        child: state.paginate == null
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (state.paginate!.prevPageNumber != null)
                                    NumberCircleWidget(
                                      onTap: () {
                                        _bloc.goToPage(
                                            state.paginate!.prevPageNumber!);
                                      },
                                      label: state.paginate!.prevPageNumber
                                          .toString(),
                                    ),
                                  if (state.paginate!.pageNumber != -1)
                                    NumberCircleWidget(
                                      label:
                                          state.paginate!.pageNumber.toString(),
                                      isActive: true,
                                    ),
                                  if (state.paginate!.nextPageNumber != null)
                                    NumberCircleWidget(
                                      onTap: () {
                                        _bloc.goToPage(
                                            state.paginate!.nextPageNumber!);
                                      },
                                      label: state.paginate!.nextPageNumber
                                          .toString(),
                                    ),
                                  if (state.paginate!.nextByNextPageNumber !=
                                      null)
                                    NumberCircleWidget(
                                      onTap: () {
                                        _bloc.goToPage(state
                                            .paginate!.nextByNextPageNumber!);
                                      },
                                      label: state
                                          .paginate!.nextByNextPageNumber
                                          .toString(),
                                    ),
                                ],
                              )),
                    IconButton(
                      onPressed: state.paginate == null ? null : _bloc.nextPage,
                      iconSize: 64,
                      color: Theme.of(context).primaryColor,
                      icon: const Icon(
                        Icons.arrow_right_rounded,
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
    );
  }
}
