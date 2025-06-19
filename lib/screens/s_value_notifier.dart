
import 'package:flutter/material.dart';
import 'package:simple_flutter/utils/logger_dart.dart';

/// valueNotifier 구현

String _tag = "TestLog_Todo";

class Todo {
  String title;
  bool completed;

  Todo({required this.title, this.completed = false});
}

class TodoListModel extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => List.unmodifiable(_todos); // 불변 리스트

  void addTodo(String title) {
    if (title.isNotEmpty) {
      _todos.add(Todo(title: title));
      notifyListeners();
    }
  }

  void toggleTodo(int index) {
    if (index >= 0 && index < _todos.length) {
      _todos[index].completed = !_todos[index].completed;
      notifyListeners();
    }
  }

  void removeTodo(int index) {
    if (index >= 0 && index < _todos.length) {
      _todos.removeAt(index);
      notifyListeners();
    }
  }
}

class TodoListWithValueNotifier extends StatefulWidget {
  const TodoListWithValueNotifier({super.key});

  @override
  State<TodoListWithValueNotifier> createState() => _TodoListWithValueNotifierState();
}

class _TodoListWithValueNotifierState extends State<TodoListWithValueNotifier> {
  final TodoListModel _model = TodoListModel();
  final TextEditingController _controller = TextEditingController();

  void _addTodo() {
    _model.addTodo(_controller.text);
    _controller.clear();

    LoggerDart.customLog(_tag, "addTodo() call");
  }

  @override
  void dispose() {
    _controller.dispose();
    _model.dispose();
    super.dispose();

    LoggerDart.customLog(_tag, "dispose() call");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // 현재 기기 사이즈 만큼 설정
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: '할 일 추가',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  ElevatedButton(
                    onPressed: _addTodo,
                    child: const Text('추가'),
                  )
                ],
              ),
            ),

            Expanded(
              child: AnimatedBuilder(
                animation: _model,
                builder: (context, child) {
                  return ListView.builder(
                    itemCount: _model.todos.length,
                    itemBuilder: (context, index) {
                      final todo = _model.todos[index];
                      return ListTile(
                        leading: Checkbox(
                          value: todo.completed,
                          onChanged: (_) => _model.toggleTodo(index),
                        ),

                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),

                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _model.removeTodo(index),
                        ),

                      );
                    },
                  );
                }
              ),
            )

          ],
        ),
      ),
    );
  }
}
