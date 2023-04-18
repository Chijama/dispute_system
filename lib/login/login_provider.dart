import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  String? token;
  String? firstName;
  String? demeritPoints;
  String? matricNo;
  void getToken(String provToken, String provFirstName, String provMatric,
      String provDemerit) {
    token = provToken;
    firstName = provFirstName;
    demeritPoints = provDemerit;
    matricNo = provMatric;
    print('$firstName, $matricNo');

    notifyListeners();
  }
}
