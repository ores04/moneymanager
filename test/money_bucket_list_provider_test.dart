import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manager/provider/money_bucket_list_provider.dart';

void main() {
  late MoneyBucketListProvider sut;

  setUp(() {
    sut = MoneyBucketListProvider();
  });

  test("inital values", () {
    expect(sut.getMoneyBuckets, []);
  });

  test("add to list", (() {
    int length = sut.getMoneyBuckets.length;
    sut.addMoneyBucket("Test", 2, 2);
    expect(sut.getMoneyBuckets.length, length + 1);
  }));
}
