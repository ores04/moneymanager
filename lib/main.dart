import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromRGBO(74, 78, 105, 100),
            onPrimary: Colors.white,
            secondary: Color.fromRGBO(201, 173, 167, 100),
            background: Color.fromRGBO(242, 233, 228, 100),
            error: Colors.red,
            onBackground: Colors.white,
            onError: Colors.black,
            onSecondary: Colors.black,
            surface: Color.fromRGBO(154, 140, 152, 100),
            onSurface: Colors.black,
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("overview"),
          ),
          body: const Center(child: Text("test")),
        ));
  }
}
