import 'package:flutter/material.dart';
import 'package:tiki_user_account/tiki_user_account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: LayoutBuilder(
              builder: (context, _) => ElevatedButton(
                  onPressed: () => TikiUserAccount(
                          logout: () => Navigator.of(context).pop(),
                          combinedKeys: 'teste',
                          accessToken: 'abc')
                      .open(context),
                  child: const Text('Open modal'))),
        ),
      ),
    );
  }
}
