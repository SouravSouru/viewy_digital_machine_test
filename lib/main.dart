import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:viewy_digital_machine_test/features/home/Controllers/homePageContoller.dart';
import 'package:viewy_digital_machine_test/uitilites/sharedpref.dart';

import 'features/home/view/homePage.dart';
import 'features/login/controller/loginContoller.dart';
import 'features/login/view/loginPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomePageController(),),
      ChangeNotifierProvider(create: (context) => SharedPref(),),
      ChangeNotifierProvider(create: (context) => LoginContoller(),)
    ],
       child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        builder: FToastBuilder(),
        home: LoginPage());
  }
}


