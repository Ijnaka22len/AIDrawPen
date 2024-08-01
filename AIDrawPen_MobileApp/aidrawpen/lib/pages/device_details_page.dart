// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import '../environment/jsonRW_handler.dart';
import '../environment/env_data.dart';
import '../environment/env_style.dart';
import 'ble_home_page.dart';

class DeviceCommunicationPage extends StatefulWidget {
  final DiscoveredDevice device;
  const DeviceCommunicationPage({super.key, required this.device});

  @override
  State<DeviceCommunicationPage> createState() =>
      _DeviceCommunicationPageState();
}

class _DeviceCommunicationPageState extends State<DeviceCommunicationPage> {
  get screenWidth => MediaQuery.of(context).size.width;
  get screenHeight => MediaQuery.of(context).size.height;
  String historyDataFileName = "historyData.json";
  String historyDataPath = "historyData";
  final flutterReactiveBle = FlutterReactiveBle();
  DiscoveredDevice? device;
  StreamSubscription<ConnectionStateUpdate>? connectionSubscription;

  String selectedShape = 'Rectangle Shape';
  List<int> results = [];
  bool isConnected = false;
  Timer? _timer;
  String fileKey = "";
  ResponseHandler responseHandler = ResponseHandler(
    index: 0,
    boxOneValue: '',
    boxTwoValue: '',
    boxThreeValue: '',
    boxFourValue: '',
    selectedShape: '',
    boxOneIsCorrect: false,
    boxTwoIsCorrect: false,
    boxThreeIsCorrect: false,
    boxFourIsCorrect: false,
  );

  void subscribeToDeviceCharacteristic({
    required FlutterReactiveBle flutterReactiveBle,
    required DiscoveredDevice device,
    required Uuid serviceId,
    required Uuid characteristicId,
  }) {
    final characteristic = QualifiedCharacteristic(
      serviceId: serviceId,
      characteristicId: characteristicId,
      deviceId: device.id,
    );
    flutterReactiveBle.subscribeToCharacteristic(characteristic).listen((data) {
      debugPrint('\n\nsubscribeToCharacteristic-data: $data');
      setState(() {
        results = data;
        responseHandler.index++;
        if (responseHandler.index > 4) {
          _showCongratulationAlert().then((value) {
            if (value != null && value == true) {
              String boxOneValue = responseHandler.boxOneValue;
              String boxTwoValue = responseHandler.boxTwoValue;
              String boxThreeValue = responseHandler.boxThreeValue;
              String boxFourValue = responseHandler.boxFourValue;
              responseHandler = ResponseHandler(
                index: 0,
                boxOneValue: '',
                boxTwoValue: '',
                boxThreeValue: '',
                boxFourValue: '',
                selectedShape: '',
                boxOneIsCorrect: false,
                boxTwoIsCorrect: false,
                boxThreeIsCorrect: false,
                boxFourIsCorrect: false,
              );
              if ((shapeToCode(selectedShape) == 1) |
                  (shapeToCode(selectedShape) == 2) |
                  (shapeToCode(selectedShape) == 3)) {
                _writeHistoryDat(
                    boxOneValue: boxOneValue,
                    boxTwoValue: boxTwoValue,
                    boxThreeValue: boxThreeValue,
                    boxFourValue: boxFourValue,
                    selectedShape: shapeToCode(selectedShape).toString(),
                    fileKey: fileKey);
              }
            } else if (value != null && value == false) {
              debugPrint('Pass!');
              responseHandler = ResponseHandler(
                index: 0,
                boxOneValue: '',
                boxTwoValue: '',
                boxThreeValue: '',
                boxFourValue: '',
                selectedShape: '',
                boxOneIsCorrect: false,
                boxTwoIsCorrect: false,
                boxThreeIsCorrect: false,
                boxFourIsCorrect: false,
              );
            }
          });
        }
        evaluateResponse();
      });
    }, onError: (err) {
      debugPrint('\n\nsubscribeToCharacteristic-err: $err');
    });
  }

  Future<bool?> _showCongratulationAlert() {
    DateTime now = DateTime.now();
    fileKey =
        "${getMonthName(now)}${now.day}_${now.hour}${now.minute}${now.second}";

    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Center(
            child: Icon(
              Icons.sentiment_dissatisfied,
              size: screenWidth / 8,
              color: EnvStyle.themeColorLight2,
            ),
          ),
          title: Center(
            child: Text(
              'Congratulations!',
              style: EnvStyle.normalStyleBlackBold,
            ),
          ),
          content: Text(
            'Save your progress to history? \n($fileKey)',
            style: EnvStyle.normalStyleBlack,
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EnvStyle.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth / 24,
                  horizontal: screenHeight / 32,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: EnvStyle.normalStyleWhite,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: EnvStyle.greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: screenWidth / 24,
                  horizontal: screenHeight / 32,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: EnvStyle.normalStyleWhite,
              ),
            ),
          ],
        );
      },
    );
  }

  void evaluateResponse() {
    switch (responseHandler.index) {
      case 1:
        responseHandler.boxOneIsCorrect = checkShapeMatch();
        responseHandler.boxOneValue = results.last.toString();
        break;
      case 2:
        responseHandler.boxTwoIsCorrect = checkShapeMatch();
        responseHandler.boxTwoValue = results.last.toString();
        break;
      case 3:
        responseHandler.boxThreeIsCorrect = checkShapeMatch();
        responseHandler.boxThreeValue = results.last.toString();
        break;
      case 4:
        responseHandler.boxFourIsCorrect = checkShapeMatch();
        responseHandler.boxFourValue = results.last.toString();
        break;
    }
  }

  bool checkShapeMatch() {
    int shapeCode = shapeToCode(selectedShape);
    return results.isNotEmpty && results.last == shapeCode;
  }

  void connectToDevice({required DiscoveredDevice device}) {
    connectionSubscription = flutterReactiveBle
        .connectToDevice(
      id: device.id,
    )
        .listen((connectionState) {
      debugPrint('connection-State: $connectionState');
      debugPrint('connection-State: ${connectionState.connectionState}');
      if (connectionState.connectionState == DeviceConnectionState.connected) {
        debugPrint(
            '\n\n\nDeviceConnectionState.connected >> device: $device\n\n\n');
        subscribeToDeviceCharacteristic(
          flutterReactiveBle: flutterReactiveBle,
          device: device,
          serviceId: device.serviceUuids.last,
          characteristicId: EnvData.gestureDataCharacteristicId,
        );
        setState(() {
          isConnected = true;
        });
      }
    }, onError: (Object error) {
      debugPrint('connection-error: $error');
      setState(() {
        isConnected = false;
      });
    });
  }

  _writeHistoryDat(
      {required String boxOneValue,
      required String boxTwoValue,
      required String boxThreeValue,
      required String boxFourValue,
      required String selectedShape,
      required String fileKey}) async {
    int count = 0;
    if (boxOneValue == selectedShape) count++;
    if (boxTwoValue == selectedShape) count++;
    if (boxThreeValue == selectedShape) count++;
    if (boxFourValue == selectedShape) count++;
    ProgressData progressData = ProgressData(
      boxOneValue: boxOneValue,
      boxTwoValue: boxTwoValue,
      boxThreeValue: boxThreeValue,
      boxFourValue: boxFourValue,
      selectedShape: selectedShape,
      progressPercent: count,
    );
    HistoryData historyData = HistoryData(
      key: fileKey,
      progressData: progressData,
    );

    String jsonString = jsonEncode(historyData);

    await writeToJsonFile(
      key: fileKey,
      content: jsonString,
      pathName: historyDataPath,
      fileName: historyDataFileName,
    );
  }

  @override
  void initState() {
    super.initState();
    device = widget.device;
    connectToDevice(device: device!);
  }

  @override
  void dispose() {
    connectionSubscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const BleHomePage()),
            (route) => false);
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
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BleHomePage()),
                        (route) => false);
                  },
                )
              : null,
          backgroundColor: EnvStyle.themeColorLight,
          title: Text(
            '${widget.device.name} BLE Sensor',
            style: EnvStyle.normalHeadingStyle,
          ),
        ),
        body: isConnected
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(screenHeight / 32),
                          child: Text(
                            'Draw Image as shown below',
                            style: EnvStyle.normalStyleGreen,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/${mapShapes(selectedShape: selectedShape)}.gif',
                              height: screenHeight / 5,
                            ),
                            Column(
                              children: [
                                Text("Choose Shape",
                                    style: EnvStyle.normalStyleBlack),
                                DropdownButton<String>(
                                  value: selectedShape,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedShape = newValue!;
                                      responseHandler = ResponseHandler(
                                        index: 0,
                                        boxOneValue: '',
                                        boxTwoValue: '',
                                        boxThreeValue: '',
                                        boxFourValue: '',
                                        selectedShape: '',
                                        boxOneIsCorrect: false,
                                        boxTwoIsCorrect: false,
                                        boxThreeIsCorrect: false,
                                        boxFourIsCorrect: false,
                                      );
                                    });
                                  },
                                  dropdownColor: Colors.white,
                                  items: [
                                    "Circle Shape",
                                    "W Shape",
                                    "L Shape",
                                    "V Shape",
                                    "Rectangle Shape",
                                    "Triangle Shape",
                                  ].map<DropdownMenuItem<String>>((value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  icon: const Icon(Icons.arrow_drop_down),
                                  iconSize: screenWidth / 10,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: screenHeight / 128,
                          left: screenWidth / 8,
                          right: screenWidth / 8),
                      child: LinearProgressBar(
                        maxSteps: 4,
                        progressType: LinearProgressBar.progressTypeLinear,
                        currentStep: responseHandler.index,
                        progressColor: EnvStyle.greenColor,
                        backgroundColor: EnvStyle.themeColorLight2,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: screenWidth / 100,
                          crossAxisSpacing: screenHeight / 100,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          Color boxColor;
                          String boxValue;
                          switch (index) {
                            case 0:
                              boxColor = responseHandler.boxOneIsCorrect
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor;
                              boxValue = responseHandler.boxOneValue;
                              break;
                            case 1:
                              boxColor = responseHandler.boxTwoIsCorrect
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor;
                              boxValue = responseHandler.boxTwoValue;
                              break;
                            case 2:
                              boxColor = responseHandler.boxThreeIsCorrect
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor;
                              boxValue = responseHandler.boxThreeValue;
                              break;
                            case 3:
                              boxColor = responseHandler.boxFourIsCorrect
                                  ? EnvStyle.greenColor
                                  : EnvStyle.redColor;
                              boxValue = responseHandler.boxFourValue;
                              break;
                            default:
                              boxColor = Colors.white;
                              boxValue = '';
                          }
                          return Card(
                            color: responseHandler.index == 0
                                ? EnvStyle.redColorLight
                                : boxColor,
                            child: Center(
                              child: Text(
                                responseHandler.index == 0
                                    ? '...'
                                    : mapShapes(selectedShape: boxValue),
                                style: EnvStyle.xLargeStyleWhite,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: EnvStyle.themeColorLight2,
                  strokeWidth: screenWidth / 128,
                ),
              ),
      ),
    );
  }
}
