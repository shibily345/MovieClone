import 'package:flutter/material.dart';

import '../../search/titlese.dart';
import 'main_card.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.title,
    required this.posterList,
  }) : super(key: key);
  final String title;
  final List<String> posterList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleName(title: title),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                posterList.length,
                (index) => MainhCard(imageUrl: posterList[index]),
              )),
        ),
      ],
    );
  }
}
