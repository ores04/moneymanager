import 'package:flutter/material.dart';

class AddSomethingButton extends StatefulWidget {
  final String buttonRoute;
  final String title;
  final icon;
  const AddSomethingButton(
      {Key? key,
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
        onTap: () {},
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
