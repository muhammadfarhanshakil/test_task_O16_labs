import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_task_for_interview/homescreen/home.dart';
import 'package:test_task_for_interview/login/loginscreen.dart';
import 'package:test_task_for_interview/login/notifier/loginnotifier.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<LoginNotifier>().fetchLoginStatus(),
        builder: (context, snapshot)  {
          if(snapshot.connectionState == ConnectionState.waiting) return Container();
          else {
            return context.read<LoginNotifier>().getLoginStatus() ? const Home() : const LoginScreen();
          }
        }
    ));
  }
}