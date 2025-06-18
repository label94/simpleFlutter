import 'package:flutter/material.dart';

/// 서브 화면
class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Image(
          image: NetworkImage("https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg"),
        )
    );
  }
}
