import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stats_fortnite/main.dart';

class NickName extends StatefulWidget {
  @override
  _NickNameState createState() => _NickNameState();
}

class _NickNameState extends State<NickName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Tracker',
          style: TextStyle(fontFamily: 'Medium'),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/search.jpg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          color: myColors.purpleBg.withOpacity(0.9),
          child: ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Center(
                  child: AutoSizeText(
                    'Stats Fortnite',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontFamily: 'SemiBold'),
                  ),
                ),
              ),

              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.08),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: TextField(
                      style: TextStyle(fontSize: 18),
                      cursorColor: Color(0xff202150),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xff202150),
                          ),
                          hintText: 'Digite o nome de usuário',
                          hintStyle: TextStyle(fontSize: 17),
                          border: InputBorder.none),
                      onChanged: (String value) {
                        controller.bridgeNickName(value);
                      },
                    ),
                  ),
                ),
              ),

              //Buttons
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              myColors.purpleSoft),
                        ),
                        onPressed: () {
                          controller.setPlatform('kbm');
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: AutoSizeText(
                          'Windows',
                          style: TextStyle(fontFamily: 'Light', fontSize: 15),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            myColors.purpleSoft),
                      ),
                      onPressed: () {
                        controller.setPlatform('gamepad');
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: AutoSizeText(
                        'Console',
                        style: TextStyle(fontFamily: 'Light', fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              myColors.purpleSoft),
                        ),
                        onPressed: () {
                          controller.setPlatform('touch');
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: AutoSizeText(
                          'Mobile',
                          style: TextStyle(fontFamily: 'Light', fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
