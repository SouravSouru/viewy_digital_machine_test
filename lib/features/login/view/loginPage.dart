import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:viewy_digital_machine_test/features/home/view/homePage.dart';
import 'package:viewy_digital_machine_test/features/login/controller/loginContoller.dart';
import 'package:viewy_digital_machine_test/uitilites/sharedpref.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController mobileNumberContollers = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: mediaQuery.height * .4,
                width: mediaQuery.width,
                child: Lottie.asset("assets/animation_ll92fa1j.json"),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomLoginTextFields(
                hinitText: "User Name",
                controller: userNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomLoginTextFields(
                hinitText: "Mobile Number",
                controller: mobileNumberContollers,
                textInputType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomLoginTextFields(
                hinitText: "password",
                visibilityIcons: true,
                obscureText:
                    Provider.of<LoginContoller>(context).isVisiblePassword,
                suffixIcon: Provider.of<LoginContoller>(context)
                            .isVisiblePassword ==
                        true
                    ? InkWell(
                        onTap: () {
                          Provider.of<LoginContoller>(context, listen: false)
                              .changeVisibility(true);
                        },
                        child: Icon(Icons.visibility))
                    : InkWell(
                        onTap: () {
                          Provider.of<LoginContoller>(context, listen: false)
                              .changeVisibility(false);
                        },
                        child: Icon(Icons.visibility_off)),
                contentPadingFromTop: 10,
                controller: passwordController,
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  if (mobileNumberContollers.text.isNotEmpty &&
                      userNameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    try {
                      ///---------------- adding data to sharedPref
                      Provider.of<SharedPref>(context, listen: false).setData(
                          userNameController.text,
                          mobileNumberContollers.text,
                          passwordController.text);
                      Navigator.push(
                          context, FadeOutPageRoute(page: HomePage()));
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "Something went wrong please try again");
                    }
                  } else {
                    Fluttertoast.showToast(msg: "Please fill the fields");
                  }
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 4, 89, 235)),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLoginTextFields extends StatelessWidget {
  final String hinitText;
  final bool? visibilityIcons;
  final double? contentPadingFromTop;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final Widget? suffixIcon;
  final bool? obscureText;

  CustomLoginTextFields(
      {super.key,
      required this.hinitText,
      this.visibilityIcons,
      this.controller,
      this.textInputType,
      this.obscureText,
      this.suffixIcon,
      this.contentPadingFromTop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Center(
        child: TextField(
          controller: controller,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hinitText,
              contentPadding:
                  EdgeInsets.only(left: 10, top: contentPadingFromTop ?? 0),
              suffixIcon: suffixIcon),
        ),
      ),
    );
  }
}

class FadeOutPageRoute extends PageRouteBuilder {
  final Widget page;

  FadeOutPageRoute({required this.page})
      : super(
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => page,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position:
            Tween(begin: Offset(1, 0), end: Offset.zero).animate(animation),
        child: child,
      );
}
