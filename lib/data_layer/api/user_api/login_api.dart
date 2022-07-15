

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/presentation_layer/shared/constants/string_constance.dart';

class LoginApi {
  Dio? dio ;

   LoginApi(){
     dio = Dio(
       BaseOptions(
         baseUrl: baseUrl,
         connectTimeout: 20 * 1000,
         receiveTimeout: 20 * 1000,
         receiveDataWhenStatusError: true,

         headers: {
           "Content-Type":"application/json"
         }
       ),
     );



   }

  Future<List<dynamic>> getUserData(String  url) async {
    try {
      Response? response = await dio?.get(url);

      //   print(response!.data.toString());

      return response!.data;

    } catch (e) {
      print("get data error : $e ");

      return [] ;
    }
  }

  Future<List<dynamic>> postUserData(String  url, Map<String,dynamic> data) async {


    try {
      Response? response = await dio?.post(url,data:data);

      //   print(response!.data.toString());

      return response!.data;

    } catch (e) {
      print("get data error : $e ");

      return [] ;
    }
  }
}