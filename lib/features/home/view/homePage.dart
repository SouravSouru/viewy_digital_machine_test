import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewy_digital_machine_test/features/home/Controllers/homePageContoller.dart';
import 'package:viewy_digital_machine_test/features/home/animation/FadeInAnimation.dart';
import 'package:viewy_digital_machine_test/features/home/view/widgets/todos.dart';
import 'package:viewy_digital_machine_test/features/profile/view/profilePage.dart';

import '../../../uitilites/sharedpref.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 5,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey, spreadRadius: 2, blurRadius: 6)
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Center(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Add a new todo item",
                      contentPadding: EdgeInsets.only(left: 30),
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                Map<String, dynamic> map = {
                  "task": controller.text,
                  "isComplete": false
                };
                Provider.of<HomePageController>(context, listen: false)
                    .addTodo(_listKey, map);
                    controller.clear();
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 4, 89, 235)),
                child: const Center(
                    child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: const Icon(Icons.menu),
         scrolledUnderElevation: 0.0,
        backgroundColor: Colors.grey.shade200,
        actions: [
          InkWell(
            onTap: () async {
              ///---------------- getting data to sharedPref
              var details =
                  await Provider.of<SharedPref>(context, listen: false)
                      .getSavedData();

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilePage(
                    name: details["name"], username: details["mobile"]),
              ));
            },
            child: const Hero(
              tag: "profile",
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profilePhoto.jpg"),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: const TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "All ToDos",
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<HomePageController>(builder: (context, value, _) {
              return Expanded(
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: value.myActivities.length,
                  itemBuilder: (context, index, animation) {
                    return FadeInAnimation(
                      animation.value,
                      Todos(
                        todos: value.myActivities[index].todo ?? "no data",
                        isCompleted: value.myActivities[index].completed,
                        onCheckBoxClick: (value) {
                          Provider.of<HomePageController>(context,
                                  listen: false)
                              .changeTodoStatus(value ?? false, index);
                        },
                        onTap: () {
                          Provider.of<HomePageController>(context,
                                  listen: false)
                              .removeTodo(_listKey, index);
                        },
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(
          height: 80,
        )
          ],
        ),
      ),
    );
  }
}
