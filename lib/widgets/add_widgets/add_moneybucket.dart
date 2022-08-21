import 'package:flutter/material.dart';
import 'package:manager/provider/money_bucket_list_provider.dart';
import 'package:manager/screens/overview_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/which_add_screen_to_show.dart';

class AddMoneyBucket extends StatelessWidget {
  const AddMoneyBucket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _name = "";
    double _amount = 0;
    double _spendAmount = 0;
    final _formKey = GlobalKey<FormState>();
    return Container(
        child: Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onSaved: (newValue) {
              _name = newValue.toString();
            },
            // TODO Form validation
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'([0-9]*)').hasMatch(value)) {
                return "Enter a valid name";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              helperText: "name",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            keyboardType: TextInputType.number,
            onSaved: ((newValue) {
              _amount = double.parse(newValue.toString());
            }),
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              helperText: "total amount",
            ),
            validator: (value) {
              if (value!.isEmpty || !RegExp(r'([A-z]*)').hasMatch(value)) {
                return "Enter a valid number";
              } else {
                return null;
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
              keyboardType: TextInputType.number,
              onSaved: (newValue) {
                _spendAmount = double.parse(newValue.toString());
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                helperText: "amount already spent",
              ),
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'([A-z]*)').hasMatch(value)) {
                  return "Enter a valid name";
                } else {
                  return null;
                }
              }),
        ),
        // Buttons _________________
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Provider.of<WhichAddScreen>(context, listen: false)
                      .showAddSomething();
                }),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<MoneyBucketListProvider>(context, listen: false)
                        .addMoneyBucket(_name, _amount, _spendAmount);
                    Navigator.of(context)
                        .pushReplacementNamed(OverviewScreen.route);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('New Moneybucket added sucsessful')),
                    );
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ]),
    ));
  }
}
