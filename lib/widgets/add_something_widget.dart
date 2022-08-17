import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class AddSomething extends StatelessWidget {
  const AddSomething({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.75 * 0.025,
          ),
          AddSomethingButton(
              icon: Icons.account_balance_wallet, title: "ADD MONEYBUCKET"),
          SizedBox(
            height: height * 0.85 * 0.025,
          ),
          AddSomethingButton(
              icon: Icons.qr_code_scanner_sharp, title: "SCAN BARCODE"),
          SizedBox(
            height: height * 0.85 * 0.025,
          ),
          AddSomethingButton(icon: Icons.article, title: "ADD MANUELL"),
        ],
      ),
      height: height * 0.67,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }
}

class AddSomethingButton extends StatelessWidget {
  final title;
  final icon;
  AddSomethingButton({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: SizedBox(
        height: height * 0.75 * 0.25,
        width: width * 0.9 * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 46,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
