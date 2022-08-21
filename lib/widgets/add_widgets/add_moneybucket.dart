import 'package:flutter/material.dart';
import 'package:manager/provider/money_bucket_list_provider.dart';
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
            decoration: InputDecoration(labelText: "*enter bucket name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            onSaved: ((newValue) {
              _amount = double.parse(newValue.toString());
            }),
            decoration: InputDecoration(labelText: "*enter total amount"),
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
              onSaved: (newValue) {
                _spendAmount = double.parse(newValue.toString());
              },
              decoration: InputDecoration(labelText: "*enter taken amount"),
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
                      .showAddSomethong();
                }),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Provider.of<MoneyBucketListProvider>(context, listen: false)
                        .addMoneyBucket(_name, _amount, _spendAmount);
                  }
                },
                child: Text("Submit"))
          ],
        ),
      ]),
    ));
  }
}
