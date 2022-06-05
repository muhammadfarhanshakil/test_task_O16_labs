import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:test_task_for_interview/helper/helper.dart';
import 'package:test_task_for_interview/login/loginscreen.dart';
import 'package:test_task_for_interview/login/notifier/loginnotifier.dart';
import 'package:test_task_for_interview/widgets/elevatedbuttonstyled.dart';
import 'package:provider/provider.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static String route = "/Home";
  @override
  Widget build(BuildContext context) {
    double width  =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
          ,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
          "Home Screen",style: Helper.regularBlack,
        
        ),
        ElevatedButtonStyled(background_color: Colors.teal.shade300, image: null, text: "Log out", onPressed: ()async{
              await context.read<LoginNotifier>().logout();
              Navigator.popAndPushNamed(context, LoginScreen.route);
          
        }, width: width*0.3, text_color: Colors.white, ),
          ],
        ),
      ),
    );
  }
}