import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String? token;
  String? firstName;
  int? demeritPoints;
  String? matricNo;
  void getToken(String provToken, String provFirstName, String provMatric,
      int provDemerit) {
    token = provToken;
    firstName = provFirstName;
    demeritPoints = provDemerit;
    matricNo = provMatric;
 

    notifyListeners();
  }
}
