import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/hotAndNew/hot_and_new_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/domain/HotAndNew/models/hot_and_new/hot_and_new.dart';
import 'package:netflix_app/presentation/main_page/widgets/Video_widget.dart';
import 'package:netflix_app/presentation/widgets/appbar_widget.dart';

import '../../core/constants.dart';

class ScreenNewh extends StatelessWidget {
  const ScreenNewh({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'New & Hot',
            style: GoogleFonts.montserrat(
              fontSize: 20,
            ),
          ),
          actions: [
            const Icon(
              Icons.cast,
              color: whit,
            ),
            kwidth,
            Container(
              width: 15,
              height: 45,
              color: red,
            ),
            kwidth,
          ],
          bottom: TabBar(
              isScrollable: true,
              indicator: BoxDecoration(
                color: whit,
                borderRadius: kradius30,
              ),
              unselectedLabelColor: whit,
              labelColor: bgc,
              tabs: const [
                Tab(
                  text: "🍿 Coming Soon",
                ),
                Tab(
                  text: "👀 Everyone's Watching",
                ),
              ]),
        ),
        body: const TabBarView(children: [
          ComingSoonList(
            key: Key("COMing_soON"),
          ),
          everyOneQatchinlist(
            key: Key('every_one'),
          ),
        ]),
      ),
    );
  }

  Widget _buildhz() {
    return const Scaffold();
  }
}

class Every1WatcchWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String discrption;
  const Every1WatcchWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.discrption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color.fromARGB(255, 244, 242, 242)),
        ),
        kHeight,
        Text(
          discrption,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.grey),
        ),
        kHeight,
        VideoWidget_1(
          url: posterPath,
        ),
        Row(
          children: [
            Text(
              movieName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserrat(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            const ButtenText_1(text: "Share", icon: Icons.share),
            kwidth,
            const ButtenText_1(text: "Mylist", icon: Icons.add),
            kwidth,
            const ButtenText_1(text: "Play", icon: Icons.play_circle_outlined),
          ],
        ),
      ],
    );
  }
}

class ButtenText_1 extends StatelessWidget {
  const ButtenText_1({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: whit,
            size: 30,
          ),
        ),
        Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String backdropPath;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String discrption;
  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.discrption,
    required this.backdropPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                month,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey),
              ),
              Text(
                day,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget_1(
                url: backdropPath,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.moonDance(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_outlined,
                          color: whit,
                          size: 30,
                        ),
                      ),
                      const Text(
                        'Remind Me',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  kwidth,
                  kwidth,
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info_outline,
                          color: whit,
                          size: 30,
                        ),
                      ),
                      const Text('Info ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              kHeight,
              Text(
                'Coming on $day $month',
              ),
              kHeight,
              Text(
                movieName,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color.fromARGB(255, 244, 242, 242)),
              ),
              kHeight,
              Text(
                discrption,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context).add(const LoaddatainComingsoon());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoaddatainComingsoon());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('ERROR'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('EMPTY'),
            );
          } else {
            return ListView.builder(
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }
                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate.split(' ').first.substring(0, 3);
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {}
                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? "noTitle",
                    discrption: movie.overview ?? 'No Discription',
                    backdropPath: '$imageAppendUrl${movie.backdropPath}',
                  );
                });
          }
        },
      ),
    );
  }
}

class everyOneQatchinlist extends StatelessWidget {
  const everyOneQatchinlist({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const LoaddatainEveryOneWcthing());
    });
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoaddatainEveryOneWcthing());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('ERROR'),
            );
          } else if (state.evoryOnesWatching.isEmpty) {
            return const Center(
              child: Text('EMPTY'),
            );
          } else {
            return ListView.builder(
                padding: EdgeInsets.all(15),
                itemCount: state.evoryOnesWatching.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.evoryOnesWatching[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }

                  final tv = state.evoryOnesWatching[index];
                  return Every1WatcchWidget(
                    posterPath: '$imageAppendUrl${tv.backdropPath}',
                    movieName: tv.originalName ?? 'no name',
                    discrption: tv.overview ?? 'no discription',
                  );
                });
          }
        },
      ),
    );
  }
}
