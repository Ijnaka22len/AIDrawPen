// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../environment/env_style.dart';
import '../main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  get screenWidth => MediaQuery.of(context).size.width;
  get screenHeight => MediaQuery.of(context).size.height;

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  Future<void> _launchUrl({required Uri url}) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> _launchInBrowser({required String url}) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainScreen()));
        return false;
      },
      child: Scaffold(
        backgroundColor: EnvStyle.bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: EnvStyle.bgColor,
                    size: screenWidth / 12,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                )
              : null,
          backgroundColor: EnvStyle.themeColorLight,
          title:
              Center(child: Text('About', style: EnvStyle.normalHeadingStyle)),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(screenWidth / 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'AIDrawPen',
                      style: EnvStyle.xLargeStyleGreen,
                    ),
                    Image.asset(
                      'assets/playstore.png',
                      height: screenHeight / 16,
                      color: EnvStyle.themeColorLight2,
                    )
                  ],
                ),
              ),
              SizedBox(height: screenWidth / 16),
              Text(
                'About the Project',
                style: EnvStyle.largeStyleGreen,
              ),
              SizedBox(height: screenWidth / 32),
              Text(
                'AIDrawPen is an innovative application designed to assist in the rehabilitation of children through a '
                'wireless gesture-based drawing pen. This project aims to make rehabilitation exercises more engaging '
                'and fun for kids, encouraging them to participate actively in their therapy sessions. The pen allows '
                'kids to draw and interact with digital interfaces using gestures, making the rehabilitation process '
                'more interactive and enjoyable.',
                style: EnvStyle.normalStyleBlack,
              ),
              SizedBox(height: screenWidth / 16),
              Text(
                'Features',
                style: EnvStyle.largeStyleGreen,
              ),
              SizedBox(height: screenWidth / 32),
              ListTile(
                leading: const Text('1. '),
                title: Text(
                  'Wireless gesture-based drawing pen designed for kids.',
                  style: EnvStyle.normalStyleBlack,
                ),
              ),
              ListTile(
                leading: const Text('2. '),
                title: Text(
                  'Engaging and interactive exercises to aid rehabilitation.',
                  style: EnvStyle.normalStyleBlack,
                ),
              ),
              ListTile(
                leading: const Text('3. '),
                title: Text(
                  'Tracks progress and visualizes improvements over time.',
                  style: EnvStyle.normalStyleBlack,
                ),
              ),
              ListTile(
                leading: const Text('4. '),
                title: Text(
                  'User-friendly interface tailored for children.',
                  style: EnvStyle.normalStyleBlack,
                ),
              ),
              ListTile(
                leading: const Text('5. '),
                title: Text(
                  'Detailed history of drawing activities for monitoring progress.',
                  style: EnvStyle.normalStyleBlack,
                ),
              ),
              SizedBox(height: screenWidth / 16),
              Text(
                'Author',
                style: EnvStyle.largeStyleGreen,
              ),
              SizedBox(height: screenWidth / 32),
              Text(
                'This application was developed by Leonel Akanji, a passionate Embedded Software Engineer with a keen interest in '
                'creating tools that enhance productivity and creativity. With a background in mobile app development and '
                'a commitment to improving children’s health and rehabilitation, AIDrawPen brings together the best of '
                'both worlds to deliver a unique and useful application.',
                style: EnvStyle.normalStyleBlack,
              ),
              SizedBox(height: screenWidth / 16),
              Text(
                'Contact',
                style: EnvStyle.largeStyleGreen,
              ),
              SizedBox(height: screenWidth / 32),
              Text(
                'For any questions, feedback, or support, please feel free to reach out.',
                style: EnvStyle.normalStyleBlack,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: 'ijnaka.abroad@gmail.com',
                        query: encodeQueryParameters(<String, String>{
                          'subject': 'Feedback on {x} in AIDrawPen Application',
                          'body':
                              'Hi AIDrawPen,\n\n I am reaching out to th.....',
                        }),
                      );
                      _launchUrl(url: emailLaunchUri);
                    },
                    icon: Icon(
                      Icons.email,
                      size: screenWidth / 12,
                      color: EnvStyle.themeColorLight2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchInBrowser(
                          url:
                              'https://www.linkedin.com/in/akanjileonelakanji');
                    },
                    icon: Icon(
                      SimpleIcons.linkedin,
                      size: screenWidth / 16,
                      color: EnvStyle.themeColorLight2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _launchInBrowser(url: 'https://github.com/Ijnaka22len');
                    },
                    icon: Icon(
                      SimpleIcons.github,
                      size: screenWidth / 12,
                      color: EnvStyle.themeColorLight2,
                    ),
                  )
                ],
              ),
              Divider(
                height: screenHeight / 32,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Copyright',
                    style: EnvStyle.smallStyleBlack,
                  ),
                  Icon(
                    Icons.copyright,
                    size: screenWidth / 24,
                  ),
                  Expanded(
                    child: Text(
                      '  Summer 2024 @Clarkson.edu',
                      style: EnvStyle.smallStyleBlack,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
