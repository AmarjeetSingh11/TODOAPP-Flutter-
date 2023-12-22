import 'package:flutter/material.dart';
import 'package:my_todo_list/models/todo_model.dart';
import 'package:my_todo_list/widgets/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TODO APP"),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(
            height: 350,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      todos[index].check = !todos[index].check;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Todo(
                              title: todos[index].title,
                              desc: todos[index].desc,
                              done: todos[index].check),
                        ),
                        IconButton(
                            onPressed: () {
                              todos.removeAt(index);
                              setState(() {});
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: title,
                      decoration: const InputDecoration(labelText: "Title"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: desc,
                      decoration:
                          const InputDecoration(labelText: "Description"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (title.text.isNotEmpty && desc.text.isNotEmpty) {
                        todos.add(TodoModel(title.text, desc.text, false));
                      }
                      setState(() {});
                    },
                    child: const Text("Add TODO"))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
