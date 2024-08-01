import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

class EnvData {
  static String get appstoreIMG {
    return "assets/appstore.png";
  }

  static String get playstoreIMG {
    return "assets/playstore.png";
  }

  // static Uuid get deviceConfigCharacteristicId {
  //   return Uuid.parse('1aa4b3bf-c9d7-4a6e-83d9-a0806fc98455'); //Change this
  // }

  static Uuid get gestureDataCharacteristicId {
    return Uuid.parse(
        '574571e2-e851-4f9b-953b-1fa29dbd90f9'); //'af0fe6aa-1499-4335-903c-b784461d8aea'); 1c253289-f120-43f5-9cea-234c2b47b2e2 //Change this
  }

  static Uuid get accDataByteCharacteristicId {
    return Uuid.parse(
        '9c0095ba-d3ea-4489-9ea7-b02e162f580c'); //'af0fe6aa-1499-4335-903c-b784461d8aea'); 1c253289-f120-43f5-9cea-234c2b47b2e2 //Change this
  }

  static List<String> get bleNames {
    return ['gt_', 'clarksn', 'clarkson', 'tiny', 'adc', 'blinky', 'aidrawpen'];
  }
}

class ResponseHandler {
  int index;
  String boxOneValue;
  String boxTwoValue;
  String boxThreeValue;
  String boxFourValue;
  String selectedShape;
  bool boxOneIsCorrect;
  bool boxTwoIsCorrect;
  bool boxThreeIsCorrect;
  bool boxFourIsCorrect;

  ResponseHandler({
    required this.index,
    required this.boxOneValue,
    required this.boxTwoValue,
    required this.boxThreeValue,
    required this.boxFourValue,
    required this.selectedShape,
    required this.boxOneIsCorrect,
    required this.boxTwoIsCorrect,
    required this.boxThreeIsCorrect,
    required this.boxFourIsCorrect,
  });
}

class ProgressData {
  String boxOneValue;
  String boxTwoValue;
  String boxThreeValue;
  String boxFourValue;
  String selectedShape;
  int progressPercent;

  ProgressData({
    required this.boxOneValue,
    required this.boxTwoValue,
    required this.boxThreeValue,
    required this.boxFourValue,
    required this.selectedShape,
    required this.progressPercent,
  });

  Map<String, dynamic> toJson() {
    return {
      'boxOneValue': boxOneValue,
      'boxTwoValue': boxTwoValue,
      'boxThreeValue': boxThreeValue,
      'boxFourValue': boxFourValue,
      'selectedShape': selectedShape,
      'progressPercent': progressPercent,
    };
  }

  factory ProgressData.fromJson(Map<String, dynamic> json) {
    return ProgressData(
      boxOneValue: json['boxOneValue'],
      boxTwoValue: json['boxTwoValue'],
      boxThreeValue: json['boxThreeValue'],
      boxFourValue: json['boxFourValue'],
      selectedShape: json['selectedShape'],
      progressPercent: json['progressPercent'],
    );
  }
}

class HistoryData {
  String key;
  ProgressData progressData;

  HistoryData({
    required this.key,
    required this.progressData,
  });

  // Method to convert ConfigurationSetting object to JSON
  Map<String, dynamic> toJson() => {
        "key": key,
        "progressData": progressData.toJson(),
      };

  // Factory method to create ConfigurationSetting object from JSON
  factory HistoryData.fromJson(Map<String, dynamic> json) {
    return HistoryData(
      key: json["key"],
      progressData: ProgressData.fromJson(json["progressData"]),
    );
  }
}

String mapShapes({required String selectedShape}) {
  // #define GESTURE_WING   1
  // #define GESTURE_RING   2
  // #define GESTURE_SLOPE  3
  switch (selectedShape) {
    case 'W Shape':
      return 'W';
    case 'L Shape':
      return 'L';
    case 'V Shape':
      return 'dashed_line'; //'V';
    case 'Circle Shape':
      return 'dashed_line';
    case 'Triangle Shape':
      return 'dashed_line'; //'T';
    case 'Rectangle Shape':
      return 'R'; //'R';
    case '1':
      return 'W';
    case '2':
      return 'R';
    case '3':
      return 'L';
    default:
      return '';
  }
}

int shapeToCode(String shape) {
  // #define GESTURE_WING   1
  // #define GESTURE_RING   2
  // #define GESTURE_SLOPE  3
  switch (shape) {
    case 'W Shape':
      return 1;
    case 'Rectangle Shape':
      return 2;
    case 'L Shape':
      return 3;
    default:
      return 0;
  }
}

String getMonthName(DateTime now) {
  if (now.month < 1 || now.month > 12) {
    throw ArgumentError('Month must be between 1 and 12');
  }

  const List<String> monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  return monthNames[now.month - 1];
}
