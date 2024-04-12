import 'package:flutter/material.dart';
import 'package:objetive_test/models/detail_item_hero_model.dart';

class DetailItemCard extends StatelessWidget {
  const DetailItemCard({super.key, required this.item});
  final DetailItemHeroModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      padding: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        item.name,
        style: const TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}
