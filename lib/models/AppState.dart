import 'package:flutter/cupertino.dart';

class AppState with ChangeNotifier {
  bool isMenu = false;
  void setMenu() {
    isMenu = !isMenu;
    notifyListeners();
  }

  bool getIsMenu() {
    return isMenu;
  }
}
