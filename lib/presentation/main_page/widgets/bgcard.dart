import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class bgCard extends StatelessWidget {
  const bgCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.thedirect.com/media/photos/posd1_1.jpg"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 100,
            color: trans,
          ),
        ),
        _playButton(),
      ],
    );
  }
}

_playButton() {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: whit,
                size: 30,
              ),
            ),
            const Text('My List'),
          ],
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(
            Icons.play_arrow,
            size: 25,
          ),
          label: const Padding(
            padding: EdgeInsets.only(left: 5, right: 10),
            child: Text(
              'Play',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(whit),
          ),
        ),
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
            const Text('Info'),
          ],
        ),
      ],
    ),
  );
}
