import 'package:flutter/material.dart';
import 'package:test_task_for_interview/helper/helper.dart';


class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String route = "/SignUpScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
          "SignUp Screen",style: Helper.regularBlack,
        
        ),
        
          ],
        ),
      ),
    );
  }
}