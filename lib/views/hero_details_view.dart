import 'package:flutter/material.dart';
import 'package:objetive_test/models/hero_model.dart';
import 'package:objetive_test/views/widgets/list_detail_hero.dart';
import 'package:objetive_test/views/widgets/marvel_app_bar.dart';

class HeroDetailsView extends StatelessWidget {
  const HeroDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final hero = ModalRoute.of(context)!.settings.arguments as HeroModel;

    return Scaffold(
      appBar: MarvelAppBar(
        title: hero.name,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(80)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                        hero.thumbnail.url,
                        width: 160,
                        height: 160,
                      ),
                    )),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                hero.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                hero.description,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.5)),
              ),
              const SizedBox(
                height: 16,
              ),
              ListDetailHero(
                title: 'Comics',
                items: hero.comics,
              ),
              ListDetailHero(
                title: 'Series',
                items: hero.series,
              ),
              ListDetailHero(
                title: 'Stories',
                items: hero.stories,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
