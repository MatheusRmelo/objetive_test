import 'package:flutter/material.dart';
import 'package:objetive_test/models/hero_model.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({super.key, required this.hero, this.onTap});
  final HeroModel hero;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).primaryColor))),
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 24),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    hero.thumbnail.url,
                    width: 64,
                    height: 64,
                  ),
                )),
            Expanded(
                child: Text(
              hero.name,
              style: const TextStyle(fontSize: 18),
            ))
          ],
        ),
      ),
    );
  }
}
