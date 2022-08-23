import 'package:flutter/material.dart';
import 'package:manager/math/round.dart';

class BugetProvider with ChangeNotifier {
  final RoundToDigets roundToDigets = RoundToDigets();
  double buget = 0;
  int _prec = 1;
  void changeBuget(double changeValue) {
    buget += changeValue;
    notifyListeners();
  }

  void setBuget(double value) {
    buget = roundToDigets.roundtotwodigets(value);
    notifyListeners();
  }

  double get getBuget {
    return buget;
  }

  int get prec {
    return _prec;
  }

  int getPrec(double num) {
    if (num < 0) {
      num = 0;
      _prec = 1;
    } else if (num < 10) {
      _prec = 3;
    } else if (num < 100) {
      _prec = 4;
    } else if (num < 1000) {
      _prec = 5;
    } else if (num < 10000) {
      _prec = 6;
    } else if (num < 100000) {
      _prec = 7;
    } else if (num < 1000000) {
      _prec = 8;
    } else {
      _prec = 9;
    }
    notifyListeners();
    return _prec;
  }
}
