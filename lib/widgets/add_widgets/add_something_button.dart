import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:manager/provider/which_add_screen_to_show.dart';
import 'package:provider/provider.dart';

class AddSomethingButton extends StatefulWidget {
  final String buttonRoute;
  final String title;
  final icon;
  Function changeTitleBool;

  AddSomethingButton(
      {Key? key,
      required this.changeTitleBool,
      required this.buttonRoute,
      required this.icon,
      required this.title})
      : super(key: key);

  @override
  State<AddSomethingButton> createState() => _AddSomethingButtonState();
}

class _AddSomethingButtonState extends State<AddSomethingButton> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.tertiary,
        highlightColor: Theme.of(context).colorScheme.secondary,
        onTap: () {
          widget.changeTitleBool();
        },
        child: SizedBox(
          height: height * 0.75 * 0.25,
          width: width * 0.9 * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 46,
              ),
              Text(widget.title),
            ],
          ),
        ),
      ),
    );
  }
}
