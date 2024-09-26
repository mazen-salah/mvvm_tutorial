import 'package:mvvm_tutorial/models/post_model.dart';

abstract class PostsRepo {
  Future<List<PostModel>> getData();
  Future<PostModel> getByID(String id);
  Future<void> deleteByID(String id);
}
