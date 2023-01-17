import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/Downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/widgets/appbar_widget.dart';
import 'dart:core';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widgetList = [
    const _Smartdownloads(),
    section2(),
    const sec3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBarW(
            title: "Downloads",
          ),
        ),
        body: ListView.separated(
            padding: const EdgeInsets.all(15),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 25,
                ),
            itemCount: _widgetList.length),
      ),
    );
  }
}

class section2 extends StatelessWidget {
  section2({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Introducing Downloads for You',
            style: TextStyle(
              color: whit,
              fontSize: 29,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        kwidth,
        const Text(
          "We'll download a personalised selection of \n movies and shows for you, so there's \n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        BlocBuilder<DownloadsBloc, DownloadsSatate>(
          builder: (context, state) {
            return SizedBox(
              width: size.width,
              height: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(alignment: Alignment.center, children: [
                      CircleAvatar(
                        radius: size.width * 0.35,
                        backgroundColor: const Color.fromARGB(255, 81, 81, 81),
                      ),
                      const DownloadsImageWidgets(
                        imageList:
                            "https://www.themoviedb.org/t/p/w220_and_h330_face/ryKwNlAfDXu0do6SX9h4G9Si1kG.jpg",
                        margin: EdgeInsets.only(left: 150),
                        angle: 20,
                      ),
                      const DownloadsImageWidgets(
                        imageList:
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/kAVRgw7GgK1CfYEJq8ME6EvRIgU.jpg',
                        margin: EdgeInsets.only(right: 150),
                        angle: -20,
                      ),
                      const DownloadsImageWidgets(
                        imageList:
                            'https://www.themoviedb.org/t/p/w220_and_h330_face/62HCnUTziyWcpDaBO2i1DX17ljH.jpg',
                        margin: EdgeInsets.only(right: 0),
                      ),
                      // DownloadsImageWidgets(
                      //   imageList:
                      //       "$imageAppendUrl${state.downloads![0].posterPath}",
                      //   margin: const EdgeInsets.only(left: 150),
                      //   angle: 20,
                      // ),
                      // DownloadsImageWidgets(
                      //   imageList:
                      //       '$imageAppendUrl${state.downloads![1].posterPath}',
                      //   margin: EdgeInsets.only(right: 150),
                      //   angle: -20,
                      // ),
                      // DownloadsImageWidgets(
                      //   imageList:
                      //       '$imageAppendUrl${state.downloads![2].posterPath}',
                      //   margin: EdgeInsets.only(right: 0),
                      // ),
                    ]),
            );
          },
        ),
      ],
    );
  }
}

class sec3 extends StatelessWidget {
  const sec3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 350,
          child: MaterialButton(
            color: red,
            onPressed: () {},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Set Up',
              style: TextStyle(
                color: whit,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: whit,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Text(
            'See What You Can Download',
            style: TextStyle(
              color: bgc,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _Smartdownloads extends StatelessWidget {
  const _Smartdownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.settings,
            color: whit,
          ),
        ),
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    this.angle = 0,
    required this.imageList,
    required this.margin,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(
              imageList,
            ),
          ),
        ),
      ),
    );
  }
}
