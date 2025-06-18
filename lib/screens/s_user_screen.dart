import 'package:flutter/material.dart';
import 'package:simple_flutter/models/data/dto_posts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/logger_dart.dart';

/// 실제 데이터 가져오는 예제
Future<List<Posts>> fetchPosts() async {
  // rest api 요청
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  LoggerDart.customLog("TestRestAPI", response.statusCode);

  if (response.statusCode == 200) {
    // 응답 성공
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Posts.fromJson(json)).toList();
  } else {
    // 응답 실패
    throw Exception('Failed to load posts');
  }
}

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Posts>>(
      future: fetchPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data == null || snapshot.data?.isEmpty == true) {
          return const Center(child: Text('No posts found.'));
        } else {
          // 데이터 있음 처리
          final posts = snapshot.data!;

          // ListView로 데이터 출력
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        }
      }, // builder
    );
  }
}