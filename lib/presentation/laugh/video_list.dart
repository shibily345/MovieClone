import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/Downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../application/reel/fast_laugh_bloc.dart';

class VideoListItemInheritedwwidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedwwidget({
    super.key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedwwidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedwwidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedwwidget>();
  }
}

class videoListItem extends StatelessWidget {
  final int index;
  const videoListItem({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedwwidget.of(context)?.movieData.posterPath;
    final videourl = dummyvideoUrl[index % dummyvideoUrl.length];
    return Stack(
      children: [
        VideoWidget(
          videoUrl: videourl,
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(89, 0, 0, 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off_sharp,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                    ),
                    kHeight,
                    ValueListenableBuilder(
                      valueListenable: likedVideoNotifier,
                      builder: (BuildContext c, Set<int> newLikedvideids,
                          Widget? _) {
                        final _index = index;
                        if (newLikedvideids.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideoNotifier.value.remove(_index);
                              likedVideoNotifier.notifyListeners();
                              // BlocProvider.of<FastLaughBloc>(context)
                              //     .add(UnlikeVideo(id: _index));
                            },
                            child: const VideoActions(
                                icon: Icons.favorite, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideoNotifier.value.add(_index);
                            likedVideoNotifier.notifyListeners();
                            // BlocProvider.of<FastLaughBloc>(context)
                            //     .add(UnlikeVideo(id: _index));
                          },
                          child: VideoActions(
                              icon: Icons.emoji_emotions_outlined,
                              title: 'Like IT'),
                        );
                      },
                    ),
                    const VideoActions(
                        icon: Icons.add_box_rounded, title: "Add"),
                    GestureDetector(
                        onTap: () {
                          final movieName =
                              VideoListItemInheritedwwidget.of(context)
                                  ?.movieData
                                  .title;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: const VideoActions(
                            icon: Icons.share_outlined, title: "Share")),
                    const VideoActions(
                        icon: Icons.comment_rounded, title: "Tell To"),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon,
              color: whit,
              size: 35,
              shadows: [Shadow(color: Colors.black, blurRadius: 15.0)]),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  const VideoWidget(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoPleyerController;
  @override
  void initState() {
    _videoPleyerController = VideoPlayerController.network(widget.videoUrl);
    _videoPleyerController.initialize().then((value) {
      setState(() {});
      _videoPleyerController.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        // height: ,
        child: _videoPleyerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPleyerController.value.aspectRatio,
                child: VideoPlayer(_videoPleyerController),
              )
            : const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
      ),
    );
  }

  @override
  void dispose() {
    _videoPleyerController.dispose();
    super.dispose();
  }
}
