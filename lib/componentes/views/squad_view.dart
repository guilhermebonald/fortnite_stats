import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../main.dart';

class SquadView extends StatefulWidget {
  @override
  _SquadViewState createState() => _SquadViewState();
}

class _SquadViewState extends State<SquadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ListView(
            children: [
              Container(
                height: constraints.maxHeight * 0.45,
                width: constraints.maxWidth,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Card(
                  color: myColors.purpleBg.withAlpha(200),
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Observer(
                    builder: (_) {
                      if (controller.data == null) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return FittedBox(
                        child: Column(
                          children: [
                            AutoSizeText(
                              'Squad',
                              style: TextStyle(
                                  color: myColors.orangeAccent,
                                  fontFamily: 'Light',
                                  fontSize: 17),
                            ),
                            Row(
                              children: [
                                //Column 1.
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        '${controller.data.stats.p9['kd'].value}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.blueLight,
                                            fontSize: 23,
                                            fontFamily: 'Medium'),
                                      ),
                                      AutoSizeText(
                                        'KD',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.orangeAccent
                                                .withOpacity(0.8),
                                            fontSize: 10,
                                            fontFamily: 'Medium'),
                                      ),
                                      Divider(
                                        height: constraints.maxHeight * 0.015,
                                      ),
                                      AutoSizeText(
                                        '${controller.data.stats.p9['kills'].displayValue}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.blueLight,
                                            fontSize: 23,
                                            fontFamily: 'Medium'),
                                      ),
                                      AutoSizeText(
                                        'Kills',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.orangeAccent
                                                .withOpacity(0.8),
                                            fontSize: 10,
                                            fontFamily: 'Medium'),
                                      ),
                                      Divider(
                                        height: constraints.maxHeight * 0.01,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.15,
                                ),

                                //Column 2.
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        '${controller.data.stats.p9['winRatio'].value}%',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.blueLight,
                                            fontSize: 23,
                                            fontFamily: 'Medium'),
                                      ),
                                      AutoSizeText(
                                        'Win',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.orangeAccent
                                                .withOpacity(0.8),
                                            fontSize: 10,
                                            fontFamily: 'Medium'),
                                      ),
                                      Divider(
                                        height: constraints.maxHeight * 0.015,
                                      ),
                                      AutoSizeText(
                                        '${controller.data.stats.p9['top1'].value}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.blueLight,
                                            fontSize: 23,
                                            fontFamily: 'Medium'),
                                      ),
                                      AutoSizeText(
                                        'Top 1',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: myColors.orangeAccent
                                                .withOpacity(0.8),
                                            fontSize: 10,
                                            fontFamily: 'Medium'),
                                      ),
                                      Divider(
                                        height: constraints.maxHeight * 0.01,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              //Row More itens
              Observer(
                builder: (_) {
                  if (controller.data == null) {
                    return Container();
                  }
                  return Row(
                    children: [
                      //List Card 01
                      Container(
                        height: constraints.maxHeight * 0.20,
                        width: constraints.maxWidth * 0.5,
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Card(
                          color: myColors.blueLight.withAlpha(140),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.5,
                                  child: AutoSizeText(
                                    '${controller.data.stats.p9['top5'].value}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.purpleBg,
                                        fontSize: 38,
                                        fontFamily: 'Bold'),
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * 0.5,
                                  child: AutoSizeText(
                                    'Top 5',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.orangeAccent,
                                        fontSize: 20,
                                        fontFamily: 'Medium'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //List Card 02
                      Container(
                        height: constraints.maxHeight * 0.20,
                        width: constraints.maxWidth * 0.5,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        margin: EdgeInsets.only(top: 10),
                        child: Card(
                          color: myColors.blueLight.withAlpha(140),
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.5,
                                  child: AutoSizeText(
                                    '${controller.data.stats.p9['top12'].value}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.purpleBg,
                                        fontSize: 38,
                                        fontFamily: 'Bold'),
                                  ),
                                ),
                                Container(
                                  width: constraints.maxWidth * 0.5,
                                  child: AutoSizeText(
                                    'Top 12',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: myColors.orangeAccent,
                                        fontSize: 20,
                                        fontFamily: 'Medium'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              Observer(
                builder: (_) {
                  if (controller.data == null) {
                    return Container(
                      height: constraints.maxHeight * 0.2,
                      width: constraints.maxWidth,
                      child: Container(),
                    );
                  }
                  return Container(
                    height: constraints.maxHeight * 0.20,
                    width: constraints.maxWidth * 0.5,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 10),
                    child: Card(
                      color: myColors.blueLight.withAlpha(140),
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: constraints.maxWidth * 0.5,
                              child: AutoSizeText(
                                '${controller.data.stats.p2['minutesPlayed'].displayValue}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: myColors.purpleBg,
                                    fontSize: 23,
                                    fontFamily: 'Bold'),
                              ),
                            ),
                            Container(
                              width: constraints.maxWidth * 0.5,
                              child: AutoSizeText(
                                'Played',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: myColors.orangeAccent,
                                    fontSize: 25,
                                    fontFamily: 'Medium'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
              //Grid Cards
            ],
          );
        },
      ),
    );
  }
}
