import 'package:flutter/material.dart';
import 'environment/env_data.dart';
import 'environment/env_style.dart';
import 'home.dart';
import 'pages/about_page.dart';
import 'pages/progress_page.dart';

void main() => runApp(const MyApp());

List<HistoryData> listHistoryData = <HistoryData>[];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get screenWidth => MediaQuery.of(context).size.width;
  get screenHeight => MediaQuery.of(context).size.height;
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: screenHeight / 4,
          bottom: screenHeight / 16,
          right: screenHeight / 32,
          left: screenHeight / 32,
        ),
        child: ListView(
          children: [
            Center(
              child: Image.asset('assets/kid_drawing.png'),
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
                  'Lets Joyfully Draw with the AIDrawPen',
                  style: EnvStyle.normalStyleBlack,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 0,
                bottom: screenHeight / 64,
                right: screenHeight / 64,
                left: screenHeight / 64,
              ),
              child: Center(
                child: Text(
                  'Welcome To AIDrawPen For Kids ',
                  style: EnvStyle.normalStyleBlackBig,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Home(),
    ProgressPage(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: EnvStyle.themeColorLight,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: EnvStyle.themeColorLight2),
        iconSize: 30,
        selectedFontSize: 18,
        selectedLabelStyle: TextStyle(
            color: EnvStyle.greenColor, fontSize: 16, fontFamily: "Poppins"),
        unselectedLabelStyle: TextStyle(
            color: EnvStyle.greenColor, fontSize: 16, fontFamily: "Poppins"),
        selectedItemColor: EnvStyle.whiteColor,
        unselectedItemColor: EnvStyle.blackColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch_later_outlined),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
