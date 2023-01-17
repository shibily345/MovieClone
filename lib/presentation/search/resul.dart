import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';
import 'package:netflix_app/presentation/search/titlese.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleName(title: 'Movies & TV'),
        kHeight,
        Expanded(
          child:
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return GridView.count(
              shrinkWrap: true,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: List.generate(
                state.searchresultList.length,
                (index) {
                  final movie = state.searchresultList[index];
                  return MainCard(
                    imagUrl: '$imageAppendUrl${movie.posterPath}',
                  );
                },
              ),
            );
          }),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imagUrl;
  const MainCard({super.key, required this.imagUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imagUrl),
        ),
      ),
    );
  }
}
