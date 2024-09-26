import 'package:mvvm_tutorial/models/post_model.dart';
import 'package:mvvm_tutorial/repositories/posts_repo.dart';

class DummyDataSource extends PostsRepo {
  final List<Map<String, dynamic>> _dummyData = [
    {
      "userId": 1,
      "id": 1,
      "title":
          "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body":
          "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    },
    {
      "userId": 1,
      "id": 2,
      "title": "qui est esse",
      "body":
          "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    },
    {
      "userId": 1,
      "id": 3,
      "title": "ea molestias quasi exercitationem repellat qui ipsa sit aut",
      "body":
          "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
    },
  ];

  @override
  Future<void> deleteByID(String id) async {
    _dummyData.removeWhere((element) => element["id"].toString() == id);
  }

  @override
  Future<PostModel> getByID(String id) async {
    final post =
        _dummyData.firstWhere((element) => element["id"].toString() == id);
    return PostModel.fromJson(post);
  }

  @override
  Future<List<PostModel>> getData() async {
    return _dummyData.map((post) => PostModel.fromJson(post)).toList();
  }
}
