import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:glossary/services/db_service.dart';
import 'package:sqflite/sqlite_api.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    GlossaryDB db = await GlossaryDB.instance;
    await db.init();

    await Future.delayed(
        const Duration(seconds: 1)); // Simulating getting last glossary opened
    await Future.delayed(
        const Duration(seconds: 1)); // Simulating getting tags from glossary
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      //currently hardcoded
      'language': ['Русский', 'Català'],
      'tags': [
        ['школа', 'Escola'],
        ['объекты', 'objectes'],
        ['места', 'llocs']
      ],
      'order': false
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }
}
