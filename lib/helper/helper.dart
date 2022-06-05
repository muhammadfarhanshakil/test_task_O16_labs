import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper{
  static snackBar(BuildContext context,String text) {

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      
      duration: const Duration(seconds: 2),
      padding: const EdgeInsets.only(left: 10,right: 8),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
      text,
      style: const TextStyle(
              fontFamily: 'RedHatDisplay',
              fontWeight: FontWeight.w500,
              color: Colors.white),
    ),
    IconButton(onPressed: (){
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }, icon: const Icon(Icons.clear_outlined,color: Colors.white,),),
          ],
        )));
  }

  static const baseUrl = "http://tidy4medevelop-env.eba-izti9tws.us-west-1.elasticbeanstalk.com";
  static TextStyle regularBlack = const TextStyle(
    fontSize: 18,
      fontFamily: 'RedHatDisplay', fontWeight: FontWeight.w900, color: Colors.black87);

  static TextStyle regularWhite = const TextStyle(
      fontFamily: 'RedHatDisplay', fontWeight: FontWeight.w500, color: Colors.white);
  static TextStyle lightBlack = const TextStyle(
      fontFamily: 'RedHatDisplay', fontWeight: FontWeight.w300, color: Colors.black);
}


class SharedPrefernceLogin {
  

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("ACCESS_TOKEN");

    if (accessToken == null) {
      return "";
    } else {
      return accessToken;
    }
  }

  Future<void> resetAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("ACCESS_TOKEN", token);
  }

  Future<String> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString("REFRESH_TOKEN");

    if (accessToken == null) {
      return "";
    } else {
      return accessToken;
    }
  }

  Future<void> resetRefreshToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("REFRESH_TOKEN", token);
  }

  Future<String> getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("UserID");
    if (id == null) {
      return "";
    } else {
      return id;
    }
  }

  Future<void> resetUserID(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("UserID", id);
  }

  
}
