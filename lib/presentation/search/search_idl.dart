import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/search/titlese.dart';

import '../../core/constants.dart';

class searchidlWidget extends StatelessWidget {
  const searchidlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleName(
          title: "Top Searchs ",
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text("Not Found"),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text("Hey Nothing Here "),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = state.idleList[index];
                  return Topsearchitem(
                      title: movie.title ?? "no Title",
                      imageUrl: '$imageAppendUrl${movie.backdropPath}');
                },
                separatorBuilder: (context, index) => kHeight,
                itemCount: state.idleList.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class Topsearchitem extends StatelessWidget {
  final String title;
  final String imageUrl;
  Topsearchitem({super.key, required this.title, required this.imageUrl});
  String? backdropPath;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        kwidth,
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ),
        CircleAvatar(
          radius: 25,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: bgc,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.play_arrow_outlined)),
          ),
        )
      ],
    );
  }
}
