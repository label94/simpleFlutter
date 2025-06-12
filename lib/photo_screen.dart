import 'package:flutter/material.dart';

/// 서브 화면
class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("cat Photo"),
        backgroundColor: Colors.tealAccent,
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      body: Center(
          child: Image(
            image: NetworkImage("https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg"),
          )
      ),
    );
  }
}
