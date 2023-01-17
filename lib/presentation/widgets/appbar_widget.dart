import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';

class AppBarW extends StatelessWidget {
  const AppBarW({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
          ),
        ),
        Spacer(),
        Icon(
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
    );
  }
}
