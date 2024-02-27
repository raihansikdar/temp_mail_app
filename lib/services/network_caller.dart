import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:temp_mail_app/services/network_response.dart';
import 'package:temp_mail_app/utility/auth_utility.dart';

class NetworkCaller{
  ///----------------------------------->> get request method <<----------------------------------
  static Future<NetworkResponse> getRequest(String url) async{
    try{
      Response response = await get(Uri.parse(url),headers: {'Content-Type': 'application/json','token': AuthUtility.accessToken.toString()});

      log("getRequest statusCode ==> ${response.statusCode}");
      log("getRequest body ==> ${response.body}");

      if(response.statusCode == 200 ){
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, body: jsonDecode(response.body));
      }else{
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, body: null);
      }

    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }

  ///----------------------------------->> post request method <<----------------------------------

  static Future<NetworkResponse> postRequest(String url,Map<String,dynamic>body) async{
    try{
      Response response = await post(Uri.parse(url),headers: {'Content-Type': 'application/json'}, body: jsonEncode(body));

      log("postRequest statusCode ==> ${response.statusCode}");
      log("postRequest body ==> ${response.body}");

      if(response.statusCode == 201 || response.statusCode == 200 ){
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, body: jsonDecode(response.body));
      }else{
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, body: null);
      }
    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(isSuccess: false, statusCode: -1, body: null);
  }
}