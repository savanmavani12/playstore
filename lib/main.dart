import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:play_store/App_Store/AppStore_homepage.dart';
import 'package:play_store/Global.dart';
import 'package:play_store/Play_Store/PlayStore_homepage.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return (Globals.platForm)
        ? MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    )
        : const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: CupertinoHomePage(),
      ),
    );
  }
}
