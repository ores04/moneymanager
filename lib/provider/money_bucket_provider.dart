import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoneyBucketProvider with ChangeNotifier {
  final String name;
  final double totalAmount;
  double usedAmount;
  bool _overspend = false;

  MoneyBucketProvider({
    required this.name,
    required this.totalAmount,
    required this.usedAmount,
  });
  double get getTotalAmount {
    return totalAmount;
  }

  bool get getOverspend {
    return _overspend;
  }

  void setOverspent(bool pOverspend) {
    _overspend = pOverspend;
  }

  String get getName {
    return name;
  }

  double get getUsedAmount {
    return usedAmount;
  }

  void decreaseUsedAmount(double amountBy) {
    usedAmount -= amountBy;
    notifyListeners();
  }
}
