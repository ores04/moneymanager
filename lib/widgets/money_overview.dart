import 'package:flutter/material.dart';
import 'package:manager/provider/buget_provider.dart';
import 'package:manager/widgets/bugetchanger_bottomsheet.dart';
import 'package:manager/widgets/bugetchanger_bottomsheet_content.dart';
import 'package:provider/provider.dart';

class MoneyOverview extends StatefulWidget {
  final double totalExpenses;

  const MoneyOverview({super.key, required this.totalExpenses});

  @override
  State<MoneyOverview> createState() => _MoneyOverviewState();
}

class _MoneyOverviewState extends State<MoneyOverview> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    double _buget = Provider.of<BugetProvider>(context).getBuget;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Popover(child: BugetChanger(buget: _buget));
            });
      },
      child: SizedBox(
        height: height * 0.3,
        width: double.infinity,
        child: Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.3 * 0.3,
                ),
                Text(
                  "TOTAL",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                SizedBox(
                  height: height * 0.3 * 0.1,
                ),
                Text(
                  "${widget.totalExpenses}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  "EXPENSES",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            )),
      ),
    );
  }
}
