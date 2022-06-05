import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task_for_interview/helper/helper.dart';
import 'package:test_task_for_interview/homescreen/home.dart';
import 'package:test_task_for_interview/login/loginscreen.dart';
import 'package:test_task_for_interview/login/notifier/loginnotifier.dart';
import 'package:test_task_for_interview/onboardingscreen.dart';
import 'package:test_task_for_interview/routes/routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
   @override
  void initState() {
    _navigateHome();
    super.initState();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
    
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      ChangeNotifierProvider(
          create: (ctx) => LoginNotifier(),
        ),
    ], child: MaterialApp(
      title: 'O16 Labs Test Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        
      ),
      home: const OnBoardingScreen(),
      
      

      routes: getRoutes(),
    ),);
  }
}

