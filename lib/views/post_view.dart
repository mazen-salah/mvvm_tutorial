import 'package:flutter/material.dart';
import 'package:mvvm_tutorial/view_models/post_view_model.dart';

class PostView extends StatelessWidget {
  final PostViewModel post;
  const PostView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Text(post.title!),
          Text(post.body!),
        ],
      ),
    );
  }
}
