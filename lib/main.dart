import 'package:flutter/material.dart';
import 'package:manager/screens/overview_screen.dart';
import 'package:provider/provider.dart';

import 'provider/money_bucket_list_provider.dart';
import 'provider/money_bucket_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          OverviewScreen.route: (context) => const OverviewScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(74, 78, 105, 40),
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color.fromRGBO(74, 78, 105, 100),
              onPrimary: Colors.white,
              secondary: Color.fromRGBO(201, 173, 167, 100),
              background: Color.fromRGBO(242, 233, 228, 100),
              tertiary: Color.fromRGBO(154, 140, 152, 100),
              error: Colors.red,
              onBackground: Colors.white,
              onError: Colors.black,
              onSecondary: Colors.black,
              surface: Color.fromRGBO(154, 140, 152, 100),
              onSurface: Colors.black,
            ),
            fontFamily: "Roboto",
            textTheme: const TextTheme().copyWith(
                bodyLarge: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ))),
        home: ChangeNotifierProvider(
          create: (context) => MoneyBucketListProvider(),
          child: OverviewScreen(),
        ));
  }
}
