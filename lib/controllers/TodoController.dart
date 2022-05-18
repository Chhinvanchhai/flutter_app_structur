import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_structure/models/Todo2.dart';
import 'package:flutter_app_structure/models/post.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_app_structure/models/Todo.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
  var posts = <Todo2>[].obs;
  var loading = true;
  var page = 1;
  bool isLoadMore = false;
  final scrollController = ScrollController();

  @override
  void onInit() {
    List storedTodos = GetStorage().read('todos') ?? [];
    todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    getAllPost(page).then((value) => loading = false);
    ever(todos, (_) {
      GetStorage().write('todos', todos.toList());
    });
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        isLoadMore = true;
        page += 1;
        print("Reach Bottom Of screen!!!!!!!!!!====> $page");
        getAllPost(page);
      }
    });
    super.onInit();
  }

  Future<void> getAllPost(p) async {
    var endpointUrl = 'http://192.168.0.20:3000/guide?page=' + p.toString();
    final response = await http.get(Uri.parse(endpointUrl));
    isLoadMore = true;
    // update();
    if (response.statusCode == 200) {
      var jsonString = response.body;
      final jsonMap = jsonDecode(jsonString);
      if ((jsonMap['data'] as List).isEmpty) {
        isLoadMore = false;
        page = page - 1;
        // update();
      }
      print('data have respone ==== $jsonMap');
      if (p > 1) {
        posts.addAll(
            (jsonMap['data'] as List).map((i) => Todo2.fromJson(i)).toList());
      } else {
        posts = (jsonMap['data'] as List)
            .map((i) => Todo2.fromJson(i))
            .toList()
            .obs;
      }

      update();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<bool> delete(index, mydata) async {
    try {
      final response = await http.delete(
        Uri.parse('http://192.168.0.20:3000/guide'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': mydata.id.toString(),
        }),
      );
      print('response code ${response.statusCode}');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res['data']);
        if (res['data']['affectedRows'] == 0) {
          return false;
        } else {
          this.posts.removeAt(index);
          update();
          return true;
        }
      } else {
        return false;
      }
    } catch (Exception) {
      throw Exception;
    }
  }

  Future<int> addPost(mydata) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.20:3000/guide'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': mydata.name,
          'email': mydata.email,
          'phone': mydata.phone,
          'address': mydata.address,
          'age': mydata.age
        }),
      );
      print('response code ${response.statusCode}');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res['data']);
        getAllPost(page);
        return res['data']['insertId'];
      } else {
        return 0;
      }
    } catch (Exception) {
      throw Exception;
    }
  }

  Future<int> updatePost(mydata) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.0.20:3000/guide'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': mydata.id,
          'name': mydata.name,
          'email': mydata.email,
          'phone': mydata.phone,
          'address': mydata.address,
          'age': mydata.age
        }),
      );
      print('response code ${response.statusCode}');
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        print(res['data']);
        getAllPost(page);
        return res['data']['affectedRows'];
      } else {
        return 0;
      }
    } catch (Exception) {
      throw Exception;
    }
  }

  Future<void> search(String keyword) async {
    print('Keyworld == ${keyword}');
    late var response;
    if (keyword != '') {
      var endpointUrl = 'http://192.168.0.20:3000/search?key=' + keyword;
      response = await http.get(Uri.parse(endpointUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final jsonMap = jsonDecode(jsonString);
        posts = (jsonMap['data'] as List)
            .map((i) => Todo2.fromJson(i))
            .toList()
            .obs;
        isLoadMore = false;
        update();
      } else {
        throw Exception;
      }
    } else {
      var endpointUrl = 'http://192.168.0.20:3000/search?key=' + keyword;
      response = await http.get(Uri.parse(endpointUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        final jsonMap = jsonDecode(jsonString);
        posts = (jsonMap['data'] as List)
            .map((i) => Todo2.fromJson(i))
            .toList()
            .obs;
        update();
      } else {
        throw Exception;
      }
    }
  }

  Future<void> handleRefresh() async {
    print("List have refresh!!!!");
    page = 1;
    getAllPost(page);
  }

  Future<void> loadMore() async {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        page += 1;
        print("Reach Bottom Of screen!!!!!!!!!!====> $page");

        getAllPost(page);
      }
    });
  }
}
