import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  final String todos;
  void Function()? onTap;
  void Function(bool?)? onCheckBoxClick;
  bool? isCompleted;
  Todos(
      {super.key,
      required this.todos,
      this.onTap,
      this.onCheckBoxClick,
      this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Row(
            children: [
              Checkbox(
                  activeColor: const Color.fromARGB(255, 4, 89, 235),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                        width: 2.0, color: Color.fromARGB(255, 4, 89, 235)),
                  ),
                  value: isCompleted ?? false,
                  onChanged: onCheckBoxClick),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: AnimatedDefaultTextStyle(
                  style: TextStyle(
                      decoration: isCompleted == true
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.black),
                  duration: const Duration(milliseconds: 700),
                  child: Text(todos),
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.red),
                  child: const Center(
                    child: Icon(Icons.delete, color: Colors.white, size: 20),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}
