import 'package:flutter/material.dart';
import 'package:stats_fortnite/componentes/colors.dart';
import 'package:stats_fortnite/componentes/home.dart';
import 'package:stats_fortnite/componentes/matches.dart';
import 'package:stats_fortnite/componentes/set_nick_name.dart';

import 'package:stats_fortnite/controller/fortnite_controller.dart';

void main() {
  runApp(MyApp());
}

final controller = FortniteController();
final myColors = MyColors();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fortnite Stats',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: myColors.purpleBg, elevation: 0),
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: myColors.purpleBg,
      ),
      home: NickName(),
      routes: {
        '/home': (context) => HomePage(),
        '/matches': (context) => MatchesPage(),
      },
    );
  }
}
