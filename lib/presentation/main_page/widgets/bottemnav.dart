import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:netflix_app/core/colors/colors.dart';

ValueNotifier<int> indexchangeNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangeNotifier,
      builder: (BuildContext context, int newIndex, Widget? _) {
        return CurvedNavigationBar(
          backgroundColor: trans,
          height: 60,
          items: const <Widget>[
            Icon(
              Icons.home_filled,
              size: 30,
              color: Colors.white,
            ),
            Icon(Icons.hotel_class_outlined, size: 30, color: Colors.white),
            Icon(Icons.video_collection_outlined,
                size: 30, color: Colors.white),
            Icon(Icons.search, size: 30, color: Colors.white),
            Icon(Icons.download_for_offline, size: 30, color: Colors.white),
          ],
          color: red,
          onTap: (index) {
            indexchangeNotifier.value = index;
          },
        );
      },
    );
  }
}
