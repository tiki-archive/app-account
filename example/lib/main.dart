import 'package:flutter/material.dart';
import 'package:user_account/user_account.dart';

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
                  onPressed: () => UserAccount(
                          referalCode: "\$0000T",
                          logout: () => print('logout'),
                          combinedKeys: 'teste')
                      .open(context),
                  child: const Text('Open modal'))),
        ),
      ),
    );
  }
}
