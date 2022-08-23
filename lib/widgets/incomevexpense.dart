import 'package:flutter/material.dart';
import 'package:manager/widgets/buget.dart';
import 'package:provider/provider.dart';

import '../provider/buget_provider.dart';

class IncomeVsExpense extends StatelessWidget {
  final double available;
  final double buget;

  const IncomeVsExpense(
      {Key? key, required this.available, required this.buget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Container(
            height: height * 0.1,
            width: width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IncomeShower(
                  title: "AVAILABLE",
                  amount: "${available.round()}",
                ),
                const VerticalDivider(
                  thickness: 1.5,
                  indent: 10,
                  endIndent: 10,
                ),
                Buget(buget: buget)
              ],
            ),
          ),
        ),
        // Card(
        //   color: Colors.white54,
        //   child: SizedBox(
        //     width: width * 0.7,
        //     height: height * 0.1 * 0.1,
        //   ),
        // )
      ],
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 1,
      color: Theme.of(context).primaryColor.withOpacity(20),
    );
  }
}

class IncomeShower extends StatelessWidget {
  final String title;
  final String amount;
  const IncomeShower({
    required this.amount,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(amount,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 24)),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
