import 'package:flutter/material.dart';
import 'package:test_task_for_interview/helper/helper.dart';
import 'package:test_task_for_interview/homescreen/home.dart';
import 'package:test_task_for_interview/login/models/loginmodel.dart';
import 'package:test_task_for_interview/login/notifier/loginnotifier.dart';
import 'package:test_task_for_interview/signup/signupscreen.dart';
import 'package:test_task_for_interview/widgets/elevatedbuttonstyled.dart';
import 'package:test_task_for_interview/widgets/textfield.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String route = "/LoginScreen";
  @override
  Widget build(BuildContext context) {
    double width  =MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
      
              children: [
                Image.asset("assets/images/TopOverLayOut.png",width: width, height: height*0.25,),
                Positioned(
                  left: width/2 - 54.5,
                  top: height*0.1,
      
                  child: Image.asset("assets/images/logo.png"))
              ],
            ),
            Padding(padding: EdgeInsets.only(left: width*0.05, right: width*0.05), 
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: width*0.05, bottom: width*0.05), child: Text("Log in with:", style: Helper.regularBlack,)),
      
            Padding(
              padding: EdgeInsets.only(top: width*0.05, bottom: width*0.08),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButtonStyled(background_color: Colors.white, image: "assets/images/facebook.png", text: "Facebook", onPressed: (){}, width: width*0.42, text_color: Colors.black, ),
                  
                  
                  ElevatedButtonStyled(background_color: Colors.white, image: "assets/images/Google.png", text: "Google", onPressed: (){}, width: width*0.42, text_color: Colors.black),
                ],
              ),
            ),
            
      
            Row(
              
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(child:  Divider(thickness: 1, color: Colors.black54,), width: width*0.35),
                Text("Or", style: Helper.lightBlack,),
                SizedBox(child: Divider(thickness: 1, color: Colors.black54,), width: width*0.35),
              ],
            ),
      
            TextFieldStyled(labelText: "Enter your email or phone number", controller: email, keyboardType: TextInputType.emailAddress, validator: null, padding: EdgeInsets.only(top: width*0.05), topText: "Email or phone"),
            TextFieldStyled(labelText: "Enter your password", controller: password, keyboardType: TextInputType.emailAddress, validator: null, padding: EdgeInsets.only(top: width*0.08, bottom: width*0.03), topText: "Password", obsecurity: true,),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){}, // onForgotPassword notifier to be called here
                  child: Text("Forgot Password",style: Helper.lightBlack,),),
              ],
            ),
          
          SizedBox(height: width*0.11,),
          ElevatedButtonStyled(background_color: Colors.teal.shade300, image: null, text: "Log in", onPressed: ()async {

            if(email.text.trim() == "" || password.text.trim() == ""){
              Helper.snackBar(context, "Email or Password cannot be empty");
            }
            else{
              final dynamic res;
              try{
                res =  await context.read<LoginNotifier>().login(email.text, password.text);
              
                // ignore: use_build_context_synchronously
                Navigator.popAndPushNamed(context, Home.route);
              
              }
              
              catch (e){
                Helper.snackBar(context, "Invalid  Email or Password");
              }

              
            }
            
          }, width: width*0.9, text_color: Colors.white, ),
          SizedBox(height: width*0.05,),
          ElevatedButtonStyled(background_color: Colors.white70, image: null, text: "Sign up", onPressed: (){
            Navigator.pushNamed(context, SignUpScreen.route);   
          }, width: width*0.9, text_color: Colors.black, ),
             SizedBox(height: width*0.05,),
             
              ],
            ),)
            ],
        ),
      ),
    );
  } 
}