import 'dart:convert';

class ApiConstant {
  static const username = '11178361';
  static const password = '60-dayfreetrial';
  static final basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
}
