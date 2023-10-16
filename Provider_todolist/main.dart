import 'package:flutter/material.dart';
import 'package:project/Todo.dart';
import 'todonotifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) {
          return TodoNotifier();
        },
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Lab Friday"),
      ),
      body: ListView.builder(
          itemCount: context.watch<TodoNotifier>().getTodos.length,
          itemBuilder: (context, index) {
            Todo todo = context.watch<TodoNotifier>().getTodos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (value) {
                  context.read<TodoNotifier>().toggleIsDone(index);
                },
              ),
              title: Text(todo.title),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<TodoNotifier>().removeTodo(index);
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            AlertDialog(
              title: const Text('AlertDialog Title'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('This is a demo alert dialog.'),
                    Text('Would you like to approve of this message?'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Approve'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
            context
                .read<TodoNotifier>()
                .addTodo(Todo(isDone: false, title: "Task# 1"));
          }),
    );
  }
}
