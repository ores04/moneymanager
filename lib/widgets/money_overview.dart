import 'package:flutter/material.dart';

class MoneyOverview extends StatelessWidget {
  const MoneyOverview({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
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
                "69,420€",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                "EXPENSES",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          )),
    );
  }
}
