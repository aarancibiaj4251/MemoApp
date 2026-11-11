import 'package:flutter/material.dart';

import 'package:hive_ce/hive_ce.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:nihongo_memo/hive/hive_registrar.g.dart';

import 'package:nihongo_memo/pages/directory.dart';
import 'package:nihongo_memo/pages/home.dart';
import 'package:nihongo_memo/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox(MEMO_ENTITY);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '',
      routes: {
        '': (context) => HomePage(),
        '/directory': (context) => Directory(),
      },
      home: HomePage()
    );
  }
}