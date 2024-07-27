import 'package:barberking/services/responce.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'netWorkConfig.dart';
import 'netWorkUtils.dart';

class ApiService{

  static const String baseUrl = NetWorkConfig.ipServer;
  static const String xAccessToken = 'x-access-token';

  Future<Response> loginUser(String email, bool userState) async {
    final url = new Uri.https(baseUrl, '/users/authenticate');
    final credentials = '$email:$userState';
    final basic = 'Basic ${base64Encode(utf8.encode(credentials))}';
    final json = await NetworkUtils.post(url, headers: {
      HttpHeaders.authorizationHeader : basic,
    }, body: {});
    return Response.fromJson(json);
  }
}