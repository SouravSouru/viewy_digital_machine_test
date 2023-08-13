import 'package:flutter/material.dart';
import 'package:viewy_digital_machine_test/features/home/models/todosModel.dart';

import '../animation/FadeOutAnimation.dart';
import '../view/widgets/todos.dart';

class HomePageController extends ChangeNotifier {
  HomePageController() {
    getTodos();
  }

  List<ToDosModel> myActivities = [];

  final List<Map<String, dynamic>> todoList = [
    {
      'task': 'Buy groceries',
      'isComplete': false,
    },
    {
      'task': 'Clean the house',
      'isComplete': true,
    },
    {
      'task': 'Read a chapter from a book',
      'isComplete': false,
    },
    {
      'task': 'Go for a run',
      'isComplete': false,
    },
    {
      'task': 'Call a friend',
      'isComplete': true,
    },
    {
      'task': 'Write a blog post',
      'isComplete': false,
    },
    {
      'task': 'Pay bills',
      'isComplete': true,
    },
    {
      'task': 'Practice playing guitar',
      'isComplete': false,
    },
    {
      'task': 'Watch a documentary',
      'isComplete': false,
    },
    {
      'task': 'Plan a weekend trip',
      'isComplete': true,
    },
    {
      'task': 'Try a new recipe',
      'isComplete': false,
    },
    {
      'task': 'Learn a new coding concept',
      'isComplete': false,
    },
    {
      'task': 'Visit a museum',
      'isComplete': false,
    },
    {
      'task': 'Organize files and folders',
      'isComplete': true,
    },
    {
      'task': 'Create a workout routine',
      'isComplete': false,
    },
  ];

  getTodos() {
    myActivities.clear();
    todoList.forEach((map) {
      myActivities.add(ToDosModel.fromJson(map));
    });

    notifyListeners();
  }

  removeTodo(GlobalKey<AnimatedListState> _listKey, int index) {
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => FadeOutAnimation(
        animation.value,
        Todos(
          todos: myActivities[index].todo.toString(),
        ),
      ),
      duration: Duration(milliseconds: 600),
    );
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      myActivities.removeAt(index);
    });

    notifyListeners();
  }

  addTodo(GlobalKey<AnimatedListState> _listKey, Map<String, dynamic> map) {
    int newIndex = myActivities.length;
    myActivities.add(ToDosModel.fromJson(map));
    _listKey.currentState?.insertItem(newIndex);
    notifyListeners();
  }

  changeTodoStatus(bool value, int index) {
    myActivities[index].completed = value;
    notifyListeners();
  }
}
