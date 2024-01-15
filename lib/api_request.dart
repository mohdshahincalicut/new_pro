import 'dart:convert' as convert;
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_pro/api_responce.dart';


class ApiRequest {
  Future<ApiResponce> apiRequestGet(url) async {
    
    return await http.get(Uri.parse(url), headers:null).then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(data: jsonResponse, errorMessage: '');
      } else if (response.statusCode == 208) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        return ApiResponce(
            error: true,
            errorMessage: "Somthing went wrong",
            statusCode: response.statusCode,
            data: null);
      } else {
       
        // ignore: unused_local_variable
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(
            error: true,
            errorMessage: "Somthing went wrong",
            statusCode: response.statusCode,
            data: null);
      }
    }).catchError((err) {
      return ApiResponce(
          error: true, statusCode: 500, data: null, errorMessage: '');
    });
  }

  Future<ApiResponce> apiRequestPost(url, params) async {
    var body = json.encode(params);

    var header = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer ' + "token"
    };

    return await http
        .post(Uri.parse(url), body: body, headers: header)
        .then((response) {
      print(response);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(data: jsonResponse, errorMessage: '');
      } else if (response.statusCode == 208) {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(
            error: true,
            errorMessage: jsonResponse['message'],
            statusCode: response.statusCode,
            data: null);
      } else {
        var jsonResponse = convert.jsonDecode(response.body);
        return ApiResponce(
            error: true,
            errorMessage: jsonResponse['message'],
            statusCode: response.statusCode,
            data: null);
      }
    }).catchError((err) {
      print(err);
      return ApiResponce(
          error: true, statusCode: 500, data: null, errorMessage: '');
    });
  }
}
