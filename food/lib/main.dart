import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/home_icon_buttoms.dart';

import 'Page2.dart';
import 'route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF363567),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        color: Color(0xFF373856),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'images/Icon7.png',
                height: 60,
                width: 60,
              ),
              Image.asset(
                'images/Icon8.png',
                height: 60,
                width: 60,
              ),
              Image.asset(
                'images/Icon9.png',
                height: 60,
                width: 60,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Transform.rotate(
                origin: Offset(30, -60),
                angle: 2.4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Color(0xffFD8BAB), Color(0xFFFD44C4)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'NIX-FC HomePage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Venez vivre une aventure extraordinaire avec nous !',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryW(
                                image: 'images/football-pitch.png',
                                text: '',
                                color: Color(0xFF47B4FF),
                                onPressed: () {
                                  style:
                                  ElevatedButton.styleFrom(
                                      primary: Color(0x9F3D416E));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Page2()));
                                },
                              ),
                              CategoryW(
                                image: 'images/route.png',
                                text: '',
                                color: Color(0xFFA885FF),
                                onPressed: () {
                                  style:
                                  ElevatedButton.styleFrom(
                                      primary: Color(0x9F3D416E));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NavigationScreen(
                                                  31.659427114450036,
                                                  -8.055183938185575)));
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CategoryW(
                                image: 'images/team.png',
                                text: ' ',
                                color: Color(0xFFFD47DF),
                                onPressed: () {
                                  style:
                                  ElevatedButton.styleFrom(
                                      primary: Color(0x9F3D416E));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Page2()));
                                },
                              ),
                              CategoryW(
                                image: 'images/info.png',
                                text: ' ',
                                color: Color(0xFFFD8C44),
                                onPressed: () {
                                  style:
                                  ElevatedButton.styleFrom(
                                      primary: Color(0x9F3D416E));

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Page2()));
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
