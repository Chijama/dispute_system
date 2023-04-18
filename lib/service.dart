import 'package:dispute_system/demerit/demerit_model.dart';
import 'package:dispute_system/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Service{
  Future<DemeritDataModel> getDemeritData(BuildContext context) async{
     try {
      var client = http.Client();

      var url = Uri.parse("https://api305.purscliq.com/api/me");
      var loginState = Provider.of<LoginProvider>(context, listen: false);
      var token = loginState.token;
      log("Login state $token");
      var response = await client.get(
        url,
        headers: {
          "Authorization": "Bearer $token",
          'Content-type': 'application/json',
          "Accept": "application/json",
        },
      );
      // log("response ${response.body}");
      if (response.statusCode == 200) {
        final services = DemeritDataModel.fromJson(json.decode(response.body));
        //log("returned ${services.toJson()}");
        return services;
      } else {
        log("failed to fetch users =>${response.statusCode} => ${response.body}");
        return DemeritDataModel();
      }
    } catch (e) {
      log("catch error from get user => $e");
      return DemeritDataModel();
    }
  }
}