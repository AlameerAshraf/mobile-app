import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weds360/core/helpers/Constants.dart';
import 'package:weds360/core/helpers/token_not_valid_exception.dart';
import 'package:weds360/pages/single_vendor/models/single_vendor_model.dart';
import 'package:http/http.dart' as http;

class SingleVindorService {
  static Future<SingleVendrorModel> singleVindor({
  @required  String token,
  @required  String vindorID,
  }) async {
    var responce = await http.post(
      PRE_PRODUCTION_BASE_URL +
          '/api/v1/vendors/get-vendor-by-id/' +
          CLINTID +
          'amotie@outlook.com' +
          '?vendorId=$vindorID',
      headers: {"x-access-token": token},
    );
    var data = json.decode(responce.body);
    if (responce.statusCode == 404) {
      throw Exception(data['errors']['message']);
    } else {
      if (data['error']) {
        if (data['code'] == 403) {
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.clear();
          throw TokenNotValidExcpetion(data['message']);
        }
        throw Exception(data['message']);
      } else {
        return SingleVendrorModel.fromMap(data['data']);
      }
    }
  }
}
