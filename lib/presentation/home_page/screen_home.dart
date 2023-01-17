import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/main_page/widgets/bgcard.dart';
import 'package:netflix_app/presentation/main_page/widgets/main_card.dart';
import 'package:netflix_app/presentation/main_page/widgets/top_10.dart';
import 'package:netflix_app/presentation/search/titlese.dart';

import '../main_page/widgets/title_w_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(false);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, index, Widget? _) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: Stack(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (ctx, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      );
                    } else if (state.hasError) {
                      return const Center(
                        child: Text(
                          'error',
                        ),
                      );
                    }
                    final _releasedPastYear = state.pastYearListMovies.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    final _trending = state.trendingMovielist.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _trending.shuffle();
                    final _tensdramaMlt = state.tensDramamovieList.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _tensdramaMlt.shuffle();
                    final _southindianMovieList =
                        state.southIndianMovielist.map((m) {
                      return '$imageAppendUrl${m.posterPath}';
                    }).toList();
                    _southindianMovieList.shuffle();
                    final _toTentvShow = state.trndingTvList.map((t) {
                      return '$imageAppendUrl${t.posterPath}';
                    }).toList();
                    print(state.trndingTvList);

                    return ListView(children: [
                      bgCard(),
                      if (_releasedPastYear.length >= 10)
                        MainTitleCard(
                          title: 'Released in The Past Year',
                          posterList: _releasedPastYear.sublist(0, 10),
                        ),
                      if (_trending.length >= 10)
                        MainTitleCard(
                          title: 'Trending Now ',
                          posterList: _trending.sublist(0, 10),
                        ),
                      if (_toTentvShow.length >= 10)
                        TopTenWidget(
                          posterList: _toTentvShow.sublist(0, 10),
                        ),
                      if (_tensdramaMlt.length >= 10)
                        MainTitleCard(
                          title: 'Tens Dramas ',
                          posterList: _tensdramaMlt.sublist(0, 10),
                        ),
                      if (_southindianMovieList.length >= 10)
                        MainTitleCard(
                          title: 'Most Watching',
                          posterList: _southindianMovieList.sublist(0, 10),
                        ),
                    ]);
                  },
                ),
                scrollNotifier.value == true
                    ? AnimatedContainer(
                        duration: Duration(seconds: 3),
                        width: double.infinity,
                        height: 150,
                        color: trans,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Row(
                                children: [
                                  kwidth,
                                  const CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://cdn3.vox-cdn.com/thumbor/jpUPVZY3IZ1nERDnYQbGC8QJ_iw=/39x0:3111x2048/1280x854/cdn0.vox-cdn.com/uploads/chorus_image/image/49901753/netflixlogo.0.0.png"),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.cast,
                                    color: whit,
                                  ),
                                  kwidth,
                                  Container(
                                    width: 25,
                                    height: 25,
                                    color: red,
                                  ),
                                  kwidth,
                                ],
                              ),
                            ),
                            kHeight,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'TV Shows',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Categories ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    : kHeight
              ],
            ),
          );
        },
      ),
    );
  }
}
