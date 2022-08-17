import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:manager/widgets/add_something_widget.dart';

class AddSomethinScreen extends StatelessWidget {
  static const String route = "AddSomethingScreenRoute";
  const AddSomethinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          ColumnSuper(
            innerDistance: -20,
            children: [
              Container(
                height: height * 0.3,
                color: colorScheme.primary,
              ),
              Container(
                height: height * 0.75,
                decoration: BoxDecoration(
                    color: colorScheme.secondary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
              )
            ],
          ),
          Positioned(
            top: height * 0.15,
            left: width * 0.05,
            child: AddSomething(),
          )
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          size: 36,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
