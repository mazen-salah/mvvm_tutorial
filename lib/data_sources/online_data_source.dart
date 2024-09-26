import 'package:mvvm_tutorial/models/post_model.dart';
import 'package:mvvm_tutorial/repositories/posts_repo.dart';
import 'package:dio/dio.dart';

class OnlinePostsData extends PostsRepo {
  Dio dio = Dio();
  String endPoint = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<void> deleteByID(String id) async {
    String postLink = "$endPoint/$id";
    await dio.delete(postLink);
  }

  @override
  Future<PostModel> getByID(String id) async {
    String postLink = "$endPoint/$id";
    var response = await dio.get(postLink);
    PostModel post = PostModel.fromJson(response.data);
    return post;
  }

  @override
  Future<List<PostModel>> getData() async {
    final response = await dio.get(endPoint);
    final List<dynamic> postsResponse = response.data as List<dynamic>;
    return postsResponse
        .map((post) => PostModel.fromJson(post as Map<String, dynamic>))
        .toList();
  }
}
