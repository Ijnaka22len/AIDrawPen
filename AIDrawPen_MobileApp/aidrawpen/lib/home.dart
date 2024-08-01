import 'package:flutter/material.dart';

import 'environment/env_style.dart';
import 'pages/ble_home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  get screenWidth => MediaQuery.of(context).size.width;
  get screenHeight => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EnvStyle.bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: EnvStyle.themeColorLight,
        title: Center(
          child: Text(
            'AIDrawPen',
            style: EnvStyle.normalHeadingStyle,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 3,
              bottom: screenHeight / 64,
              right: screenHeight / 64,
              left: screenHeight / 64,
            ),
            child: Image.asset(
              'assets/AIDrawPen_Animation2_Nbg.gif',
              height: screenHeight / 3,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight / 4,
              bottom: screenHeight / 64,
              right: screenHeight / 64,
              left: screenHeight / 64,
            ),
            child: Image.asset(
              'assets/AIDrawPen_Animation_Nbg.gif',
              height: screenHeight / 3,
            ),
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight / 32,
                  bottom: screenHeight / 64,
                  right: screenHeight / 32,
                  left: screenHeight / 32,
                ),
                child: Center(
                  child: Text(
                    'Welcome To Smart Drawing For Kids ',
                    style: EnvStyle.normalStyleBlackBig,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: screenHeight / 64,
                  right: screenHeight / 32,
                  left: screenHeight / 32,
                ),
                child: Center(
                  child: Text(
                    'Lets Joyfully Draw with the AIDrawPen...',
                    style: EnvStyle.normalStyleBlack,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight / 8,
                  bottom: screenHeight / 64,
                  right: screenHeight / 32,
                  left: screenHeight / 32,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/kid_drawing.png',
                    height: screenHeight / 4,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: screenHeight / 8,
                  bottom: screenHeight / 64,
                  right: screenHeight / 16,
                  left: screenHeight / 16,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BleHomePage()),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EnvStyle.themeColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth / 64,
                        horizontal: screenHeight / 100),
                  ),
                  child: ListTile(
                    title: Text(
                      "Let's Go",
                      style: EnvStyle.normalHeadingStyle,
                    ),
                    trailing: Icon(
                      Icons.run_circle_outlined,
                      size: screenWidth / 8,
                      color: EnvStyle.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
