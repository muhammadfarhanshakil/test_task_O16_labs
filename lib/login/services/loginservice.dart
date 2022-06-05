import 'package:test_task_for_interview/helper/helper.dart';
import 'package:test_task_for_interview/login/models/loginmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginService{
  Future<dynamic> login(String email, String password) async {
    // try{
        var headers = {
  'Accept': 'application/json',
  'Content-Type': 'application/json'
};
        var request = http.Request('POST', Uri.parse('${Helper.baseUrl}/users/login'));
        request.body = json.encode({
          "email": email,
          "password": password
        });
request.headers.addAll(headers);

http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      //  if (response.statusCode >= 400) {
      //   throw ('Error');
      // } else {
      //   if (jsonDecode(response.body)["status"] != "error") {
          
      //     // print("object");
          try{
          return loginModelFromJson(response.body);}
          catch (e){
            return response.body;
          }
        // } else {
        //   // print("2");
        //   throw loginModelFromJson(response.body);
        // }
      }
    }
    // catch (e){
    //   print(e.toString());
    //   rethrow;
      
    // }
  // }
