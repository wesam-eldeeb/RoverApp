import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _username = '11178361';
  final String _password = '60-dayfreetrial';

  Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
    Map<String, String> headers = {};
    if (token == null) {
      headers.addAll({
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      });
      http.Response response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'there is a problem with statuscode${response.statusCode}');
      }
    }
  }

  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
    Map<String, String> headers = {};
    if (token == null) {
      headers.addAll({
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with statuscode${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$_username:$_password'));
    Map<String, String> headers = {};
    headers.addAll({
      'Authorization': basicAuth,
      'Content-Type': 'application/json',
    });
    if (token == null) {
      headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with statuscode${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
