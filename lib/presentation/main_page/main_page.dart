import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/screen_down.dart';
import 'package:netflix_app/presentation/home_page/screen_home.dart';
import 'package:netflix_app/presentation/laugh/screen_laugh.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottemnav.dart';
import 'package:netflix_app/presentation/new_hot/screen_new.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class sMainPage extends StatelessWidget {
  sMainPage({super.key});
  final _pages = [
    ScreenHome(),
    ScreenNewh(),
    ScreenLaugh(),
    ScreenSearch(),
    ScreenDownload(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgc,
      body: ValueListenableBuilder(
        valueListenable: indexchangeNotifier,
        builder: (BuildContext context, int index, Widget? _) {
          return _pages[index];
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
