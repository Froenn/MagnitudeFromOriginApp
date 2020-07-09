import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'screens/home.dart';
import 'states/field_util.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<FieldUtil>(create: (_) => FieldUtil()),
        ],
        child: Home(),
      ), 
      // routes: {},
    );
  }
}