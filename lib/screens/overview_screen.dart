import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:manager/provider/buget_provider.dart';
import 'package:manager/provider/money_bucket_list_provider.dart';
import 'package:manager/provider/money_bucket_provider.dart';
import 'package:manager/screens/add_something.dart';
import 'package:manager/widgets/incomevexpense.dart';
import 'package:manager/widgets/money_bucket.dart';
import 'package:manager/widgets/money_overview.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatelessWidget {
  static const String route = "overviewscreenroute";
  const OverviewScreen({Key? key}) : super(key: key);

  double getTotalExpenses(List<MoneyBucketProvider> Moneybuckets) {
    double _total = 0;

    for (MoneyBucketProvider buc in Moneybuckets) {
      _total += buc.getUsedAmount;
    }
    return _total;
  }

  double getAvailable(double totalExpenses, double buget) {
    return buget - totalExpenses;
  }

  @override
  Widget build(BuildContext context) {
    double _buget = Provider.of<BugetProvider>(context).getBuget;
    List<MoneyBucketProvider> _moneyBuckets =
        Provider.of<MoneyBucketListProvider>(context).getMoneyBuckets;

    final bool showBuckets = _moneyBuckets.isEmpty;

    final double _totalExpenses = getTotalExpenses(_moneyBuckets);
    final double _available = getAvailable(_totalExpenses, _buget);
    return Scaffold(
      body: ColumnSuper(
        separator: IncomeVsExpense(
          buget: _buget,
          available: _available,
        ),
        children: <Widget>[
          MoneyOverview(totalExpenses: _totalExpenses),
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              showBuckets
                  ? Center(
                      child: Text(
                          "No moneybuckets yet, start tracking your expenses"),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: ListView.builder(
                          itemCount: _moneyBuckets.length,
                          itemBuilder: ((context, index) =>
                              ChangeNotifierProvider.value(
                                value: _moneyBuckets[index],
                                child: MoneyBucket(
                                    category: _moneyBuckets[index].name),
                              ))),
                    )
            ],
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddSomethinScreen.route);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
