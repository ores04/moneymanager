import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

import 'add_something_button.dart';

class AddSomething extends StatelessWidget {
  const AddSomething({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * 0.75 * 0.025,
        ),
        AddSomethingButton(
          icon: Icons.account_balance_wallet,
          title: "ADD MONEYBUCKET",
          buttonRoute: "",
        ),
        SizedBox(
          height: height * 0.85 * 0.025,
        ),
        AddSomethingButton(
          icon: Icons.qr_code_scanner_sharp,
          title: "SCAN BARCODE",
          buttonRoute: "",
        ),
        SizedBox(
          height: height * 0.85 * 0.025,
        ),
        AddSomethingButton(
          icon: Icons.article,
          title: "ADD MANUELL",
          buttonRoute: "",
        ),
      ],
    );
  }
}
