


import 'package:flutter/cupertino.dart';
import 'package:test_task_for_interview/homescreen/home.dart';
import 'package:test_task_for_interview/login/loginscreen.dart';
import 'package:test_task_for_interview/signup/signupscreen.dart';

Map<String, WidgetBuilder> getRoutes(){
  return {
    LoginScreen.route :(context) => const LoginScreen(),
    Home.route : ((context) => const Home()),
    SignUpScreen.route :(context) => const SignUpScreen(),
  };
}

