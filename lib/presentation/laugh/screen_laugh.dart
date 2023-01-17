import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/reel/fast_laugh_bloc.dart';
import 'package:netflix_app/presentation/laugh/video_list.dart';

class ScreenLaugh extends StatelessWidget {
  const ScreenLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(body: SafeArea(
      child: BlocBuilder<FastLaughBloc, FastLaughState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return const Center(
              child: Icon(Icons.wifi_tethering_off_rounded),
            );
          } else if (state.videoList.isEmpty) {
            return const Center(
              child: Icon(Icons.wifi_tethering_off_rounded),
            );
          } else {
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(state.videoList.length, (index) {
                return VideoListItemInheritedwwidget(
                  widget: videoListItem(
                      key: Key(
                        index.toString(),
                      ),
                      index: index),
                  movieData: state.videoList[index],
                );
              }),
            );
          }
        },
      ),
    ));
  }
}
