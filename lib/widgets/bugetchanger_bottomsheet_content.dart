import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:manager/provider/buget_provider.dart';
import 'package:provider/provider.dart';

class BugetChanger extends StatefulWidget {
  double buget;
  double sensitivity = 100;

  BugetChanger({Key? key, required this.buget}) : super(key: key);

  @override
  State<BugetChanger> createState() => _BugetChangerState();
}

class _BugetChangerState extends State<BugetChanger> {
  @override
  Widget build(BuildContext context) {
    int prec = Provider.of<BugetProvider>(context).prec;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Text(
            "${widget.buget.toStringAsPrecision(prec)}",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(
            height: 20,
          ),
          Text("change your buget"),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onPanUpdate: (details) {
              print(widget.sensitivity);
              setState(() {
                widget.buget += (details.delta.dx / widget.sensitivity);
                if (widget.buget < 0) {
                  widget.buget = 0;
                }
                prec = Provider.of<BugetProvider>(context, listen: false)
                    .getPrec(widget.buget);

                widget.sensitivity += details.delta.dy;
                if (widget.sensitivity < 1) {
                  widget.sensitivity = 1;
                } else if (widget.sensitivity > 200) {
                  widget.sensitivity = 200;
                }
              });
            },
            onPanEnd: (details) {
              Provider.of<BugetProvider>(context, listen: false)
                  .setBuget(widget.buget);
              Navigator.of(context).pop();
            },
            child: Container(
              width: width * 0.9,
              height: height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.black54,
                        Colors.black12,
                        Colors.black54
                      ])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.remove),
                  SizedBox(
                    width: width * 0.7,
                  ),
                  Icon(Icons.add),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.1,
          ),
        ],
      ),
    );
  }
}
