import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:manager/provider/money_bucket_provider.dart';
import 'package:manager/widgets/incomevexpense.dart';
import 'package:manager/widgets/money_bucket.dart';
import 'package:manager/widgets/money_overview.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatelessWidget {
  static const String route = "overviewscreenroute";
  const OverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          MoneyBucketProvider(name: "Food", totalAmount: 30, usedAmount: 15),
      child: Scaffold(
        body: ColumnSuper(
          separator: IncomeVsExpense(),
          children: <Widget>[
            MoneyOverview(),
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                MoneyBucket(category: "Food"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
