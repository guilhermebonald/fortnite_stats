import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stats_fortnite/componentes/views/matches/matches_four.dart';
import 'package:stats_fortnite/componentes/views/matches/matches_one.dart';
import 'package:stats_fortnite/componentes/views/matches/matches_three.dart';
import 'package:stats_fortnite/componentes/views/matches/matches_two.dart';
import 'package:stats_fortnite/componentes/views/matches/matches_zero.dart';
import 'package:stats_fortnite/main.dart';

class MatchesPage extends StatefulWidget {
  @override
  _MatchesPageState createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  @override
  Widget build(BuildContext context) {
    controller.setFetch();

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Graph',
          style: TextStyle(fontFamily: 'Medium', fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://i.pinimg.com/originals/ad/44/12/ad44122b89114c9ad79247eccd7d2df4.jpg'),
          ),
        ),
        child: Container(
          color: myColors.purpleBg.withOpacity(0.9),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: AutoSizeText(
                      'Recents',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'Medium'),
                    ),
                  ),
                  AutoSizeText(
                    'Matches',
                    style: TextStyle(
                        fontSize: 13, color: Colors.white, fontFamily: 'Light'),
                  ),
                ],
              ),
              Observer(
                builder: (_) {
                  if (controller.data.recentMatches.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                      height: 300,
                      width: double.infinity,
                      child: Center(
                          child: AutoSizeText(
                        'Not Found',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Bold',
                            fontSize: 20),
                      )),
                    );
                  }
                  return Column(
                    children: [
                      MatcherView(),
                      MatcherOne(),
                      MatcherTwo(),
                      MatcherThree(),
                      MatcherFour(),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
