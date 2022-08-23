import 'package:flutter/material.dart';

import 'incomevexpense.dart';

class Buget extends StatefulWidget {
  double buget;
  Buget({Key? key, required this.buget}) : super(key: key);

  @override
  State<Buget> createState() => _BugetState();
}

class _BugetState extends State<Buget> {
  @override
  Widget build(BuildContext context) {
    return IncomeShower(
      title: "BUGET",
      amount: "${widget.buget}",
    );
  }
}
