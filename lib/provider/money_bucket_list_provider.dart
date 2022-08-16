import 'package:flutter/material.dart';
import 'package:manager/provider/money_bucket_provider.dart';

class MoneyBucketListProvider with ChangeNotifier {
  List<MoneyBucketProvider> _moneyBuckets = [
    MoneyBucketProvider(name: "Food", usedAmount: 3, totalAmount: 30),
    MoneyBucketProvider(name: "House", usedAmount: 50, totalAmount: 100),
    MoneyBucketProvider(name: "Fun", usedAmount: 10, totalAmount: 10),
    MoneyBucketProvider(name: "Save", usedAmount: 10, totalAmount: 12),
    MoneyBucketProvider(name: "Emer", usedAmount: 0, totalAmount: 12),
  ];
  List<MoneyBucketProvider> get getMoneyBuckets {
    return _moneyBuckets;
  }
}
