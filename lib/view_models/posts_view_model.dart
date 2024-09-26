import 'package:mvvm_tutorial/repositories/posts_repo.dart';
import 'package:mvvm_tutorial/view_models/post_view_model.dart';

class PostsViewModel {
  final PostsRepo postsRepo;
  PostsViewModel({required this.postsRepo});
  String title = "All Posts";

  Future<List<PostViewModel>> fetchPosts() async {
    final posts = await postsRepo.getData();
    List<PostViewModel> postsData = posts
        .map((post) => PostViewModel(title: post.title, body: post.body))
        .toList();

    return postsData;
  }
}
