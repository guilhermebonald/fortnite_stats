import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class MatcherView extends StatefulWidget {
  @override
  _MatcherViewState createState() => _MatcherViewState();
}

class _MatcherViewState extends State<MatcherView> {
  @override
  Widget build(BuildContext context) {
    int match = 0;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 5),
          width: constraints.maxWidth,
          child: Card(
            elevation: 10,
            color: myColors.purpleBg.withAlpha(200),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Container(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: AutoSizeText(
                        '${controller.itsWin(controller.data.recentMatches[match]['top1'])}',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Medium'),
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            'Date: ',
                            style: TextStyle(
                                color: myColors.orangeAccent,
                                fontFamily: 'Medium'),
                          ),
                          AutoSizeText(
                            '${controller.data.recentMatches[match]['dateCollected']}',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            'Type: ',
                            style: TextStyle(
                                color: myColors.orangeAccent,
                                fontFamily: 'Medium'),
                          ),
                          AutoSizeText(
                            '${controller.matchType(controller.data.recentMatches[match]['playlist'])}',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            'Time: ',
                            style: TextStyle(
                                color: myColors.orangeAccent,
                                fontFamily: 'Medium'),
                          ),
                          AutoSizeText(
                            '${controller.data.recentMatches[match]['minutesPlayed']} min',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            'Score: ',
                            style: TextStyle(
                                color: myColors.yellow, fontFamily: 'Medium'),
                          ),
                          AutoSizeText(
                            '${controller.data.recentMatches[match]['score']}',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          AutoSizeText(
                            'Kills: ',
                            style: TextStyle(
                                color: myColors.yellow, fontFamily: 'Medium'),
                          ),
                          AutoSizeText(
                            '${controller.data.recentMatches[match]['kills']}',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
