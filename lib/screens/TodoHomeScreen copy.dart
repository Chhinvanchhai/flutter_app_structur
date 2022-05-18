import "package:flutter/material.dart";
import 'package:flutter_app_structure/models/Todo.dart';
import 'package:flutter_app_structure/models/Todo2.dart';
import 'package:flutter_app_structure/widgets/NoteDelete.dart';
import 'package:get/get.dart';
import 'package:flutter_app_structure/controllers/TodoController.dart';
import 'package:flutter_app_structure/screens/TodoScreen.dart';

class TodoHomeScreen extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(TodoScreen());
          },
        ),
        body: Column(children: [
          TextField(
            controller: _controller,
            onSubmitted: (text) {
              // fetch all the news related to the keyword
              print("The text");
              // if (text.isNotEmpty) {
              todoController.search(text);
              // }
            },
            onChanged: (text) {
              todoController.search(text);
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
          // Expanded(
          //   child: Container(
          //     child:
          //     Obx(() => ListView.separated(
          //         itemBuilder: (context, index) => Dismissible(
          //               key: UniqueKey(),
          //               onDismissed: (_) {
          //                 var removed = todoController.todos[index];
          //                 todoController.todos.removeAt(index);
          //                 Get.snackbar('Task removed',
          //                     'The task "${removed.text}" was successfully removed ==== index===${index}.',
          //                     mainButton: TextButton(
          //                       child: Text('Undo'),
          //                       onPressed: () {
          //                         // if (removed) {
          //                         //   return;
          //                         // }
          //                         todoController.todos.insert(index, removed);
          //                         // removed = "" as Todo;
          //                         if (Get.isSnackbarOpen!) {
          //                           Get.back();
          //                         }
          //                       },
          //                     ));
          //               },
          //               child: ListTile(
          //                 title: Text(todoController.todos[index].text!,
          //                     style: (todoController.todos[index].done!)
          //                         ? TextStyle(
          //                             color: Colors.red,
          //                             decoration: TextDecoration.lineThrough)
          //                         : TextStyle(
          //                             color: Theme.of(context)
          //                                 .textTheme
          //                                 .bodyText1!
          //                                 .color)),
          //                 onTap: () {
          //                   Get.to(TodoScreen(index: index));
          //                 },
          //                 leading: Checkbox(
          //                   value: todoController.todos[index].done,
          //                   onChanged: (v) {
          //                     var changed = todoController.todos[index];
          //                     changed.done = v;
          //                     todoController.todos[index] = changed;
          //                   },
          //                 ),
          //                 trailing: Icon(Icons.chevron_right),
          //               ),
          //             ),
          //         separatorBuilder: (_, __) => Divider(),
          //         itemCount: todoController.todos.length)),
          //   ),
          // ),
          Expanded(
              child: Container(
                  child: GetBuilder<TodoController>(
            builder: (_) => ListView.separated(
              separatorBuilder: (_, __) =>
                  Divider(height: 1, color: Colors.green),
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => NoteDelete());
                    print('Print result ${result}');
                    if (result) {
                      var data_ = todoController.posts[index];
                      // var isDeleted = await todoController.delete(
                      //     index,
                      //     Todo2(
                      //         id: 30,
                      //         age: 30,
                      //         address: 'address',
                      //         email: 'email',
                      //         name: 'name',
                      //         phone: 'phone'));
                      var isDeleted = await todoController.delete(index, data_);
                      if (isDeleted) {
                        Get.snackbar(
                            'Succesfull', "You data have been deleted");
                      } else {
                        Get.snackbar('Failed', "Someting went wrong");
                        return false;
                      }
                    }

                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      todoController.posts[index].name,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text('Last edited on '),
                    onTap: () {
                      print(todoController.posts[index].name);
                      print(todoController.posts[index].id);
                    },
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: todoController.posts.length,
            ),
          ))
              //     child: Obx(
              //   () =>

              // )),
              )
        ]));
  }
}
