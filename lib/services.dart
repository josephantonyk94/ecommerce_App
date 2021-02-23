import 'dart:io';

import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'model/product_response.dart';

class Services {
  Dio dio= Dio();
  Future<String> login() async{
 Response response= await dio.post('https://evmair.com/app/login?email=nruecker@renner.com&password=cansa123');
 Map<String,dynamic> resultMap={};
 resultMap=response.data;
 print(resultMap['data']['access_token']);
 return resultMap['data']['access_token'];
  }
  getBrands(String token) async{
Response response = await dio.get('https://evmair.com/app/get-brand-types', options: RequestOptions(headers: {"Authorization":'Bearer $token'}));
print(response.data);
  }
 Future<ProductResponse> getProducts(String token) async{
Response response=await dio.get('https://evmair.com/app/get-products?page=5&sort_by=1',options: RequestOptions(headers: {"Authorization":'Bearer $token'}));
print(response.data);
return response.data;
  }
  getProductDetails(){

  }
}