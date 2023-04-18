import 'package:flutter/cupertino.dart';
import 'demerit_model.dart';

class DemeritProvider extends ChangeNotifier {
  List<DemeritDataModel> _demerits = [];

  List<DemeritDataModel>? getDemerit(List<DemeritDataModel> _provDemerits) {
    _demerits = _provDemerits;

    notifyListeners();
  }
}
