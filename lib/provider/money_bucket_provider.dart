import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MoneyBucketProvider with ChangeNotifier {
  final String name;
  final double totalAmount;
  double usedAmount;

  MoneyBucketProvider({
    required this.name,
    required this.totalAmount,
    required this.usedAmount,
  });
  double get getTotalAmount {
    return totalAmount;
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
