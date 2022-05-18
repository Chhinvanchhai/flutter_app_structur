import 'dart:convert';
import 'package:flutter_app_structure/models/post.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

enum LoadingStatus { completed, searching, empty }

class PostController extends GetxController {
  var loadingStatus = LoadingStatus.searching;
  late List<Post2> articles = [];

  Future<List<Post2>> getAllPost() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      final jsonMap = jsonDecode(jsonString);
      return this.articles =
          (jsonMap as List).map((i) => Post2.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
  // Search

  Future<void> search(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    print('Key word ${keyword}');
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$keyword'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      final jsonMap = jsonDecode(jsonString);
      print('Search Resone ${jsonMap}');
      List list = [];
      list.add(jsonMap);
      // this.articles = (jsonMap as List).map((i) => Post2.fromJson(i)).toList();
      this.articles = list.map((i) => Post2.fromJson(i)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
