import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    List<MoneyBucketProvider> _moneyBuckets =
        Provider.of<MoneyBucketListProvider>(context).getMoneyBuckets;
    return Scaffold(
      body: ColumnSuper(
        separator: IncomeVsExpense(),
        children: <Widget>[
          MoneyOverview(),
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.builder(
                    itemCount: _moneyBuckets.length,
                    itemBuilder: ((context, index) =>
                        ChangeNotifierProvider.value(
                          value: _moneyBuckets[index],
                          child:
                              MoneyBucket(category: _moneyBuckets[index].name),
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
