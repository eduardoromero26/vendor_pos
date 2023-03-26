import 'package:eco_tours_yucatan/widgets/molecules/card/card.dart';
import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  final List<Map<String, String>> cardsData;

  const CardListWidget({super.key, required this.cardsData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cardsData.length,
        itemBuilder: (BuildContext context, int index) {
          return CardWidget(
            title: cardsData[index]['title']!,
            subTitle: cardsData[index]['subTitle']!,
            imageUrl: cardsData[index]['imageUrl']!,
          );
        },
      ),
    );
  }
}
