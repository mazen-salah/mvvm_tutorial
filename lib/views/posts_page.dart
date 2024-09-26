import 'package:flutter/material.dart';
import 'package:mvvm_tutorial/data_sources/online_data_source.dart';
import 'package:mvvm_tutorial/view_models/posts_view_model.dart';
import 'package:mvvm_tutorial/views/post_view.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    final PostsViewModel data = PostsViewModel(postsRepo: OnlinePostsData());
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: data.fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return PostView(
                    post: snapshot.data![index],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
