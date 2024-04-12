import 'package:flutter/material.dart';
import 'package:objetive_test/models/detail_item_hero_model.dart';
import 'package:objetive_test/views/widgets/detail_item_card.dart';

class ListDetailHero extends StatelessWidget {
  const ListDetailHero({super.key, required this.title, required this.items});

  final String title;
  final List<DetailItemHeroModel> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 120,
            margin: const EdgeInsets.only(top: 8),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 8,
              ),
              itemBuilder: (context, index) => DetailItemCard(
                item: items[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
