import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viewy_digital_machine_test/uitilites/sharedpref.dart';

class ProfilePage extends StatelessWidget {
  String? name;
  String? username;
  ProfilePage({super.key, this.username, this.name}) {
    if (name!.isNotEmpty && username!.isNotEmpty) {
      userNameController.text = username!;
      nameContollers.text = name!;
    }
  }

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameContollers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const Hero(
                  tag: "profile",
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profilePhoto.jpg"),
                    minRadius: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomProfileTextFields(
                  controller: nameContollers,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomProfileTextFields(
                  controller: userNameController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 4, 89, 235)),
                  child: const Center(
                      child: Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomProfileTextFields extends StatelessWidget {
  TextEditingController controller;
  CustomProfileTextFields({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Center(
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 10)),
        ),
      ),
    );
  }
}
