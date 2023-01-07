import 'package:flutter/material.dart';
import 'package:glossary/pages/home_page.dart';
import 'package:glossary/pages/loading.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomePage(),
      //'/add': (context) => AddWord(),
    }));
