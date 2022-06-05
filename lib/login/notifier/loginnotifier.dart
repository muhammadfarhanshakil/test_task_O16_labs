import 'package:flutter/cupertino.dart';
import 'package:test_task_for_interview/helper/helper.dart';
import 'package:test_task_for_interview/login/models/loginmodel.dart';
import 'package:test_task_for_interview/login/services/loginservice.dart';

class LoginNotifier extends ChangeNotifier{

  bool? isLoggedIn;

  Future<void> fetchLoginStatus()async{
    isLoggedIn= await SharedPrefernceLogin().getAccessToken() !="";
  }

  bool getLoginStatus() => isLoggedIn!;

  Future<dynamic> login(String email, String password) async {
   
  dynamic data = await LoginService().login(email, password);
  notifyListeners();
  await SharedPrefernceLogin().resetAccessToken(data.tokenDetails.accessToken);
  await SharedPrefernceLogin().resetRefreshToken(data.tokenDetails.refreshToken);
  await SharedPrefernceLogin().resetUserID(data.data.userId);
    return data;

    

  
  }

  Future<void> logout() async {
    
    await SharedPrefernceLogin().resetAccessToken("");
    await SharedPrefernceLogin().resetRefreshToken("");
    await SharedPrefernceLogin().resetUserID("");
    

   
  }
}