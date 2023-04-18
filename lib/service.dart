import 'package:dispute_system/demerit/demerit_model.dart';
import 'package:dispute_system/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:dispute_system/dispute/dispute_model.dart';

import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<DemeritDataModel>> getDemeritData(BuildContext context) async {
    try {
      var client = http.Client();

      var url = Uri.parse(
          "https://sddms-backend-production.up.railway.app/api/v1/student/demerits/all");
      var loginState = Provider.of<LoginProvider>(context, listen: false);
      var token = loginState.token;
      // log("Login state $token");
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
        final services = json.decode(response.body);
        //log("returned ${services.toJson()}");

        List<DemeritDataModel> dataList = services
            .map<DemeritDataModel>(
                (element) => DemeritDataModel.fromJson(element))
            .toList();
        print(dataList);
        return dataList;
      } else {
        // log("failed to fetch users =>${response.statusCode} => ${response.body}");
        return [];
      }
    } catch (e) {
      log("catch error from get user => $e");

      return [];
    }
  }

  Future<List<DisputeDataModel>> getDisputeData(BuildContext context) async {
    try {
      var client = http.Client();

      var url = Uri.parse(
          "https://sddms-backend-production.up.railway.app/api/v1/student/disputes/all");
      var loginState = Provider.of<LoginProvider>(context, listen: false);
      var token = loginState.token;
      // log("Login state $token");
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
        final services = json.decode(response.body);
        //log("returned ${services.toJson()}");

        List<DisputeDataModel> dataList = services
            .map<DisputeDataModel>(
                (element) => DisputeDataModel.fromJson(element))
            .toList();
        print(dataList);
        return dataList;
      } else {
        // log("failed to fetch users =>${response.statusCode} => ${response.body}");
        return [];
      }
    } catch (e) {
      log("catch error from get user => $e");

      return [];
    }
  }
}
