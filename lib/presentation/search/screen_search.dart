import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/domain/core/deBounce/debounce.dart';
import 'package:netflix_app/presentation/search/resul.dart';
import 'package:netflix_app/presentation/search/search_idl.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w300_and_h450_bestv2/qBcIUgJmDGrcAKbhRwCd6AmO0ZW.jpg';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1000);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              backgroundColor: Color.fromARGB(255, 51, 51, 51),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: TextStyle(
                color: whit,
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context)
                      .add(SearchMovie(movieQuery: value));
                });
              },
            ),
            // Expanded(child: SearchResult()),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state.searchresultList.isEmpty) {
                    return const searchidlWidget();
                  } else {
                    return SearchResult();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
