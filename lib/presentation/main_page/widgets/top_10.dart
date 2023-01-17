import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/search/titlese.dart';
import '../../search/titlese.dart';
import 'main_card.dart';

class TopTenWidget extends StatelessWidget {
  const TopTenWidget({
    super.key,
    required this.posterList,
  });
  final List<String> posterList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleName(title: "Top 10 TV Shows"),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: List.generate(
                10,
                (index) => Numbercard(
                  index: index,
                  imageurl: posterList[index],
                ),
              )),
        ),
      ],
    );
  }
}

class Numbercard extends StatelessWidget {
  const Numbercard({
    Key? key,
    required this.index,
    required this.imageurl,
  }) : super(key: key);
  final int index;
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 200,
            ),
            Container(
              width: 120,
              // height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageurl),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: 0,
          child: BorderedText(
            strokeWidth: 1.0,
            strokeColor: whit,
            child: Text(
              "${index + 1}",
              style: GoogleFonts.montserrat(
                  fontSize: 100, color: bgc, fontWeight: FontWeight.w800),
            ),
          ),
        )
      ],
    );
  }
}
