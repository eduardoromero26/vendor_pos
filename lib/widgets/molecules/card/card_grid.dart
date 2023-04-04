import 'package:vendor_pos/widgets/molecules/card/card.dart';
import 'package:flutter/material.dart';

class CardGridWidget extends StatelessWidget {
  final List<Map<String, String>> cardsData;

  const CardGridWidget({super.key, required this.cardsData});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cardsData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (BuildContext context, int index) {
        return CardWidget(
          title: cardsData[index]['title']!,
          subTitle: cardsData[index]['subTitle']!,
          imageUrl: cardsData[index]['imageUrl']!,
        );
      },
    );
  }
}

// CardWidget(
//             title: cardsData[index]['title']!,
//             subTitle: cardsData[index]['subTitle']!,
//             imageUrl: cardsData[index]['imageUrl']!,
//           );