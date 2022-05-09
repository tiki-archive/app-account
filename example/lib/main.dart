import 'package:flutter/material.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:tiki_user_account/tiki_user_account.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String databasePath = await getDatabasesPath() + '/tiki_user_account_ex.db';
  Database _db = await openDatabase(databasePath);
  String query = '''
  CREATE TABLE IF NOT EXISTS app_data(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    key TEXT NOT NULL,
    value TEXT NOT NULL
);
''';
  _db.rawQuery(query);
  runApp(MyApp(db: _db));
}

class MyApp extends StatefulWidget {
 final Database db;
  const MyApp({Key? key, required this.db}) : super(key: key);

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
                      refresh: (_) async => {},
                      logout: () async => Navigator.of(context).pop(),
                      database: widget.db,
                      combinedKeys: 'test',
                      accessToken: () => 'abc').open(context),
                  child: const Text('Open modal'))),
        ),
      ),
    );
  }
}
