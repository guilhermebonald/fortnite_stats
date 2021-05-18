import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:stats_fortnite/componentes/views/duo_view.dart';
import 'package:stats_fortnite/componentes/views/solo_view.dart';
import 'package:stats_fortnite/componentes/views/squad_view.dart';
import 'package:stats_fortnite/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    controller.setFetch();
  }

  PageController pageController = PageController();
  int pageDots = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Live Stats',
          style: TextStyle(fontFamily: 'Medium', fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.account_tree_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed('/matches');
              })
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/home.jpg'),
                  fit: BoxFit.cover),
            ),
            child: Container(
              color: myColors.purpleBg.withOpacity(0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //Avatar and NickName
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      height: constraints.maxHeight * 0.25,
                      width: constraints.maxWidth,
                      child: FittedBox(
                        child: Observer(
                          builder: (_) {
                            if (controller.data == null) {
                              return Container(
                                height: constraints.maxHeight * 0.2,
                                width: constraints.maxWidth,
                                child: Container(),
                              );
                            }
                            return Row(
                              children: [
                                Container(
                                  height: constraints.maxHeight * 0.1,
                                  child: Image.network(
                                    controller.data.avatar,
                                    scale: 2.5,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: constraints.maxHeight * 0.020,
                                      //Só usei fittedbox aqui por que nao diminui o tamanho menos que 10.
                                      child: FittedBox(
                                        child: AutoSizeText(
                                          '${controller.data.epicUserHandle}',
                                          style: TextStyle(
                                            fontFamily: 'ExtraLight',
                                            color: Colors.white,
                                            fontSize: 10,
                                            shadows: [
                                              BoxShadow(
                                                  color: myColors.brown,
                                                  blurRadius: 5)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: constraints.maxHeight * 0.0006,
                                      width: constraints.maxWidth * 0.09,
                                      color: Colors.white,
                                      margin: EdgeInsets.symmetric(vertical: 3),
                                    ),
                                    Container(
                                      height: constraints.maxHeight * 0.012,
                                      //Só usei fittedbox aqui por que nao diminui o tamanho menos que 10.
                                      child: FittedBox(
                                        child: AutoSizeText(
                                          'Life Win',
                                          style: TextStyle(
                                            fontFamily: 'ExtraLight',
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: constraints.maxHeight * 0.02,
                                      //Só usei fittedbox aqui por que nao diminui o tamanho menos que 10.
                                      child: FittedBox(
                                        child: AutoSizeText(
                                          '${controller.data.lifeTimeStats[9].value}',
                                          style: TextStyle(
                                            fontFamily: 'Medium',
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: new DotsIndicator(
                      dotsCount: 3,
                      position: pageDots.toDouble(),
                      decorator: DotsDecorator(
                        size: const Size.square(6.0),
                        activeSize: Size.square(8),
                        activeColor: myColors.blueLight,
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),

                  //Info card
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: PageView(
                      pageSnapping: true,
                      physics: BouncingScrollPhysics(),
                      controller: pageController,
                      onPageChanged: (value) {
                        setState(
                          () {
                            pageDots = value;
                          },
                        );
                      },
                      children: [
                        //01 PageView
                        SoloView(),
                        DuoView(),
                        SquadView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
