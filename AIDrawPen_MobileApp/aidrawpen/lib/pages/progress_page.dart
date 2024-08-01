// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:aidrawpen/environment/env_data.dart';
import 'package:aidrawpen/main.dart';
import 'package:aidrawpen/pages/history_details_page.dart';
import 'package:flutter/material.dart';

import '../environment/jsonRW_handler.dart';
import '../environment/env_style.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  get screenHeight => MediaQuery.of(context).size.height;
  get screenWidth => MediaQuery.of(context).size.width;
  String historyDataFileName = "historyData.json";
  String historyDataPath = "historyData";
  Map<String, double> percentageCount = {};
  Map<String, int> shapeCount = {};

  _getHistoryData() async {
    listHistoryData = <HistoryData>[];
    Map<String, dynamic>? jsonFileContent = await readFromJsonFile(
        pathName: historyDataPath, fileName: historyDataFileName);
    if (jsonFileContent != null) {
      jsonFileContent.forEach((key, value) async {
        final jsonData = jsonDecode(value);

        ProgressData progressData = ProgressData(
          boxOneValue: jsonData['progressData']['boxOneValue'],
          boxTwoValue: jsonData['progressData']['boxTwoValue'],
          boxThreeValue: jsonData['progressData']['boxThreeValue'],
          boxFourValue: jsonData['progressData']['boxFourValue'],
          selectedShape: jsonData['progressData']['selectedShape'],
          progressPercent: jsonData['progressData']['progressPercent'],
        );
        final parsedJsonData = HistoryData(
          key: key,
          progressData: progressData,
        );

        setState(() {
          listHistoryData.add(parsedJsonData);
          String selectedShape = progressData.selectedShape;
          percentageCount[selectedShape] =
              ((percentageCount[selectedShape] ?? 0) +
                  progressData.progressPercent);
          shapeCount[selectedShape] = (shapeCount[selectedShape] ?? 0) + 1;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getHistoryData();
  }

  @override
  Widget build(BuildContext context) {
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
          title: Center(
            child: Text(
              'Drawing Progress',
              style: EnvStyle.normalHeadingStyle,
            ),
          ),
        ),
        body: listHistoryData.isNotEmpty
            ? ListView.builder(
                itemCount: listHistoryData.length,
                itemBuilder: (context, index) {
                  final key = listHistoryData[index].key;
                  final progressData = listHistoryData[index].progressData;
                  return Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth / 64,
                        right: screenWidth / 64,
                        top: screenWidth / 250,
                        bottom: 0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(screenWidth / 32),
                      ),
                      color: EnvStyle.themeColorLight2,
                      child: ListTile(
                        leading: Text(
                          key,
                          style: EnvStyle.normalStyleWhite,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              (progressData.boxOneValue ==
                                      progressData.selectedShape)
                                  ? Icons.check_box_outlined
                                  : Icons.cancel_presentation,
                              size: screenWidth / 12,
                              color: (progressData.boxOneValue ==
                                      progressData.selectedShape)
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor,
                            ),
                            Icon(
                              (progressData.boxTwoValue ==
                                      progressData.selectedShape)
                                  ? Icons.check_box_outlined
                                  : Icons.cancel_presentation,
                              size: screenWidth / 12,
                              color: (progressData.boxTwoValue ==
                                      progressData.selectedShape)
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor,
                            ),
                            Icon(
                              (progressData.boxThreeValue ==
                                      progressData.selectedShape)
                                  ? Icons.check_box_outlined
                                  : Icons.cancel_presentation,
                              size: screenWidth / 12,
                              color: (progressData.boxThreeValue ==
                                      progressData.selectedShape)
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor,
                            ),
                            Icon(
                              (progressData.boxFourValue ==
                                      progressData.selectedShape)
                                  ? Icons.check_box_outlined
                                  : Icons.cancel_presentation,
                              size: screenWidth / 12,
                              color: (progressData.boxFourValue ==
                                      progressData.selectedShape)
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor,
                            ),
                          ],
                        ),
                        title: Text(
                          mapShapes(selectedShape: progressData.selectedShape),
                          style: EnvStyle.normalStyleGreen,
                        ),
                        onTap: () {
                          debugPrint('shapeCounts: $shapeCount\n\n');
                          debugPrint('percentageCount: $percentageCount\n\n');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryDetailsPage(
                                shape: key,
                                boxOneValue: progressData.boxOneValue,
                                boxTwoValue: progressData.boxTwoValue,
                                boxThreeValue: progressData.boxThreeValue,
                                boxFourValue: progressData.boxFourValue,
                                selectedShape: progressData.selectedShape,
                                progressPercent: progressData.progressPercent,
                                percentageCount: percentageCount,
                                shapeCount: shapeCount,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Recorded Data', style: EnvStyle.normalStyleBlack),
                    Icon(
                      Icons.sentiment_dissatisfied,
                      size: screenWidth / 8,
                      color: EnvStyle.themeColorLight2,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
