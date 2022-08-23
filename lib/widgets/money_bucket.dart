import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    final bool _overspend = provider.getOverspend;
    return Container(
      padding: EdgeInsets.all(5),
      width: width * 0.85,
      height: height * 0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(category), flex: 5),
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 34,
            child: _overspend
                ? Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Center(
                      child: Text(
                          "you overspend by ${(totalAmount - currentAmount).abs().round()}"),
                    ),
                  )
                : (totalAmount.toInt() - currentAmount.toInt()) == 0
                    ? Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: double.maxFinite,
                        width: double.maxFinite,
                      )
                    : currentAmount.toInt() == 0
                        ? Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            height: double.maxFinite,
                            width: double.maxFinite,
                          )
                        : Row(
                            children: [
                              Flexible(
                                flex: (currentAmount.toInt()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
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
                                flex: (totalAmount.toInt() -
                                    currentAmount.toInt()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
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
