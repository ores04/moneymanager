import 'package:flutter/material.dart';

enum ScreenToShow {
  showAddMoneyBucket,
  showBarcodeScan,
  showAddManuel,
  showAddSomething,
}

class WhichAddScreen with ChangeNotifier {
  ScreenToShow _screenToShow = ScreenToShow.showAddSomething;

  ScreenToShow get getScreenToShow {
    return _screenToShow;
  }

  void setShowAddMoneyBucket() {
    _screenToShow = ScreenToShow.showAddMoneyBucket;
    notifyListeners();
  }

  void setShowBarcodeScan() {
    _screenToShow = ScreenToShow.showBarcodeScan;
    notifyListeners();
  }

  void setShowAddManuel() {
    _screenToShow = ScreenToShow.showAddManuel;
    notifyListeners();
  }

  void showAddSomething() {
    _screenToShow = ScreenToShow.showAddSomething;
    notifyListeners();
  }
}
