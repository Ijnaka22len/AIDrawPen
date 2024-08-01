// ignore_for_file: deprecated_member_use

import 'package:aidrawpen/pages/progress_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../environment/env_data.dart';
import '../environment/env_style.dart';

class HistoryDetailsPage extends StatefulWidget {
  final String shape;
  final String boxOneValue;
  final String boxTwoValue;
  final String boxThreeValue;
  final String boxFourValue;
  final String selectedShape;
  final int progressPercent;
  final Map<String, int> shapeCount;
  final Map<String, double> percentageCount;

  const HistoryDetailsPage({
    super.key,
    required this.shape,
    required this.boxOneValue,
    required this.boxTwoValue,
    required this.boxThreeValue,
    required this.boxFourValue,
    required this.selectedShape,
    required this.progressPercent,
    required this.percentageCount,
    required this.shapeCount,
  });

  @override
  State<HistoryDetailsPage> createState() => _HistoryDetailsPageState();
}

class _HistoryDetailsPageState extends State<HistoryDetailsPage> {
  get screenHeight => MediaQuery.of(context).size.height;
  get screenWidth => MediaQuery.of(context).size.width;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProgressPage()));
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
                            builder: (context) => const ProgressPage()));
                  },
                )
              : null,
          backgroundColor: EnvStyle.themeColorLight,
          title: Text(
            widget.shape,
            style: EnvStyle.normalHeadingStyle,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight / 64,
                    left: screenWidth / 8,
                    right: screenWidth / 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shape",
                      style: EnvStyle.normalStyleGreen,
                    ),
                    Text(
                      'Progress',
                      style: EnvStyle.normalStyleGreen,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth / 12, right: screenWidth / 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/${mapShapes(selectedShape: widget.selectedShape)}.gif',
                      height: screenHeight / 8,
                    ),
                    Container(
                      color: Colors.amber,
                      width: screenWidth / 2,
                      height: screenHeight / 20,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          RotatedBox(
                            quarterTurns: 4,
                            child: LinearProgressIndicator(
                              minHeight: screenHeight / 20,
                              value: (widget.progressPercent / 4),
                              backgroundColor: EnvStyle.redColor,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  EnvStyle.greenColor),
                            ),
                          ),
                          Text(
                            '${((widget.progressPercent / 4) * 100).toInt()}%',
                            style: EnvStyle.normalStyleWhite,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    bottom: 0,
                    top: screenHeight / 128,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenWidth / 200,
                    crossAxisSpacing: screenHeight / 8,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    Color boxColor;
                    String boxValue;
                    switch (index) {
                      case 0:
                        boxColor = (widget.boxOneValue == widget.selectedShape)
                            ? EnvStyle.greenColor
                            : EnvStyle.redColor;
                        boxValue = widget.boxOneValue;
                        break;
                      case 1:
                        boxColor = (widget.boxTwoValue == widget.selectedShape)
                            ? EnvStyle.greenColor
                            : EnvStyle.redColor;
                        boxValue = widget.boxTwoValue;
                        break;
                      case 2:
                        boxColor =
                            (widget.boxThreeValue == widget.selectedShape)
                                ? EnvStyle.greenColor
                                : EnvStyle.redColor;
                        boxValue = widget.boxThreeValue;
                        break;
                      case 3:
                        boxColor = (widget.boxFourValue == widget.selectedShape)
                            ? EnvStyle.greenColor
                            : EnvStyle.redColor;
                        boxValue = widget.boxFourValue;
                        break;
                      default:
                        boxColor = EnvStyle.whiteColor;
                        boxValue = '';
                    }
                    return Card(
                      color: boxColor,
                      child: Center(
                        child: Text(
                          mapShapes(selectedShape: boxValue),
                          style: EnvStyle.xLargeStyleWhite,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight / 100),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "General Progress",
                    style: EnvStyle.normalStyleGreen,
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight / 16,
              ),
              _buildPieChart(),
              SizedBox(
                height: screenHeight / 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String calculatePercent({required int count, required double percentage}) {
    double percent = (percentage / count) / 4;
    percent = percent * 100;
    return percent.toStringAsFixed(1);
  }

  Widget _buildPieChart() {
    List<PieChartSectionData> sections =
        widget.percentageCount.entries.map((entry) {
      final color = _getShapeColor(entry.key);
      int count = widget.shapeCount[entry.key] ?? 0;
      double percentage = entry.value.toDouble();
      return PieChartSectionData(
          value: entry.value.toDouble(),
          title:
              '${mapShapes(selectedShape: entry.key)}\n${calculatePercent(count: count, percentage: percentage)}%',
          color: color,
          radius: (screenHeight + screenWidth) / 16,
          titleStyle: EnvStyle.normalStyleWhite);
    }).toList();

    return Container(
      height: (screenHeight) / 8,
      padding: const EdgeInsets.all(0),
      child: PieChart(
        PieChartData(
          sections: sections,
          centerSpaceRadius: 30,
          sectionsSpace: 2,
        ),
      ),
    );
  }

  Color _getShapeColor(String shape) {
    switch (shape) {
      case '1':
        return EnvStyle.pinkColor;
      case '2':
        return EnvStyle.blueColor;
      case '3':
        return EnvStyle.themeColorLight;
      default:
        return EnvStyle.bgColor;
    }
  }
}
