import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_structure/controllers/post_controller.dart';
import 'package:flutter_app_structure/models/models.dart';
import 'package:flutter_app_structure/models/post.dart';
import 'package:get/get.dart';

class LearnApi extends StatefulWidget {
  @override
  _LearnApiState createState() => _LearnApiState();
}

class _LearnApiState extends State<LearnApi> {
  late Future<List<Post2>> futterpost2;
  final _controller = TextEditingController();
  PostController post_controller = PostController();

  @override
  void getData() {
    // futterpost2 = PostController().getAllPost();
    // print('get from api 2 ${futterpost2}');
  }

  void initState() {
    // getData();r
    futterpost2 = post_controller.getAllPost();
    super.initState();
  }

  void searchTest(val) {
    print(val);
  }

  @override
  Widget build(BuildContext context) {
    PostController controller = Get.put(PostController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Learn Api"),
        ),
        body: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (text) {
                // fetch all the news related to the keyword
                if (text.isNotEmpty) {
                  searchTest(text);
                }
              },
              onChanged: (text) {
                post_controller.search(text);
              },
              decoration: InputDecoration(
                  labelText: "Enter search term",
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.search),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                    },
                  )),
            ),
            Expanded(
              child: FutureBuilder<List<Post2>>(
                future: futterpost2,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            margin: EdgeInsets.all(4.0),
                            color: Colors.green,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                        'Entry ${snapshot.data![index].title}')),
                                TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.delete),
                                    label: Text('Delete'))
                              ],
                            ),
                          );
                        });
                    // return Text(snapshot.data![10].title);
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ));
  }
}
