import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class VideoWidget_1 extends StatelessWidget {
  final String url;
  const VideoWidget_1({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Center(
                  child: Icon(
                Icons.wifi_off,
              ));
            },
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: const Color.fromARGB(89, 0, 0, 0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.volume_off_sharp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
