import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:manager/provider/which_add_screen_to_show.dart';
import 'package:manager/widgets/add_widgets/add_moneybucket.dart';
import 'package:manager/widgets/add_widgets/add_something_widget.dart';
import 'package:provider/provider.dart';

class AddSomethinScreen extends StatefulWidget {
  static const String route = "AddSomethingScreenRoute";
  AddSomethinScreen({Key? key}) : super(key: key);

  @override
  State<AddSomethinScreen> createState() => _AddSomethinScreenState();
}

class _AddSomethinScreenState extends State<AddSomethinScreen> {
  bool _showAddMoneyBucket = false;

  bool _showBarcodeScan = false;

  bool _showAddManuel = false;

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
            child: ChangeNotifierProvider(
              create: (BuildContext context) {
                return WhichAddScreen();
              },
              child: Container(
                height: height * 0.67,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Overlay(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          size: 36,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  const Overlay({Key? key}) : super(key: key);

  Widget whichAddToShow(ScreenToShow screen) {
    switch (screen) {
      case ScreenToShow.showAddManuel:
        return AddSomething();
      case ScreenToShow.showAddMoneyBucket:
        return AddMoneyBucket();
      default:
        return AddSomething();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.67,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child:
          whichAddToShow(Provider.of<WhichAddScreen>(context).getScreenToShow),
    );
  }
}
