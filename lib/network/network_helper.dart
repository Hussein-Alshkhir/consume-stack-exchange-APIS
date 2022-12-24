import 'dart:convert';

import 'package:assessment_task/network/network_enums.dart';
import 'package:assessment_task/network/network_typedef.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{
  const NetworkHelper._();

  static concatUrlQP(String url, Map<String, String> queryParameters){
    if(url.isEmpty) return url;
    if(queryParameters == null || queryParameters.isEmpty){
      return url;
    }
    final StringBuffer stringBuffer = StringBuffer("$url?");
    queryParameters.forEach((key, value) {
      if(value.trim() == '') return;
      if(value.contains(' ')) throw Exception('Invalid Input Exception');
      stringBuffer.write('$key=$value&');
    });
    final result = stringBuffer.toString();
    return result.substring(0, result.length -1);
  }

  static bool _isValidResponse(json){
    return json != null;
  }

  static R filterResponse<R>({
    required NetworkCallBack callBack,
    required http.Response? response,
    required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
    CallBackParameterName parameterName = CallBackParameterName.all
  }){
    try{

      if(response == null || response.body.isEmpty){
        return onFailureCallBackWithMessage(NetworkResponseErrorType.responseEmpty, 'Empty Response!');
      }

      var json = jsonDecode(response.body);

      // Map<String, dynamic> map = json.decode(response.body);
      // List<dynamic> data = map["dataKey"];
      // print(data[0]["name"]);

      print(json);

      if(response.statusCode == 200){
        if(_isValidResponse(json)){
          return callBack(parameterName.getJson(json));
        }
      }else if(response.statusCode == 1708){

        return onFailureCallBackWithMessage(NetworkResponseErrorType.socket, 'Socket Error!');
      }
      return onFailureCallBackWithMessage(NetworkResponseErrorType.didNotSucceed, 'Did not succeed!');

    }catch(e){
      return onFailureCallBackWithMessage(NetworkResponseErrorType.exception, 'Exception $e');
    }
  }

}