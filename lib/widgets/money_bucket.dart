import 'package:flutter/material.dart';
import 'package:manager/provider/money_bucket_provider.dart';
import 'package:provider/provider.dart';

class MoneyBucket extends StatelessWidget {
  final String category;
  const MoneyBucket({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<MoneyBucketProvider>(context);
    final name = provider.getName;
    final totalAmount = provider.getTotalAmount;
    final currentAmount = provider.getUsedAmount;
    return Container(
      width: width * 0.95,
      height: height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(category), flex: 1),
          Flexible(
            flex: 7,
            child: Row(
              children: [
                Flexible(
                  flex: (currentAmount.toInt()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                ),
                Flexible(
                  flex: (totalAmount.toInt() - currentAmount.toInt()),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    height: double.maxFinite,
                    width: double.maxFinite,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
