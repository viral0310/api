import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

//singleton class
class APIHelper {
  //1. create a private named constructor

  APIHelper._();

//2. create an object with the reference of private named constructor
  static final APIHelper apiHelper = APIHelper._();

  String BASE_URL = 'https://jsonplaceholder.typicode.com';
  String ENDPOINT = '/posts/3';
  final String MULTI_DATA_ENDPOUNT = '/posts';
  // dynamic total = BASE_URL + ENDPOINT;

  Future<Post?> fetchSinglePostData() async {
    http.Response res = await http.get(Uri.parse(BASE_URL + ENDPOINT));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      Post post = Post.fromJson(json: decodedData);

      return post;
    }
    return null;
  }

  Future<List<Post>?> fetchMultiplePostData() async {
    http.Response res =
        await http.get(Uri.parse(BASE_URL + MULTI_DATA_ENDPOUNT));

    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);

      List<Post> posts =
          decodedData.map((e) => Post.fromJson(json: e)).toList();
      return posts;
    }
    return null;
  }
}
