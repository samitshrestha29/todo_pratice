import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Todo {
  String title;

  Todo({
    required this.title,
  });
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [];
  final TextEditingController _controller = TextEditingController();
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        todos.add(Todo(
          title: _controller.text,
        ));
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                label: Text('Enter Task'),
              ),
            ),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Add Task'),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      trailing: IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
