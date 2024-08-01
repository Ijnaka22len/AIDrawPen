import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

sumList({required List num}) {
  int sum = 0;
  for (int i = 0; i < num.length; i++) {
    sum++;
  }

  return sum;
}

class ConfigurationSettingCounter {
  String key;
  int count;

  ConfigurationSettingCounter({required this.key, required this.count});

  ConfigurationSettingCounter.fromJson(Map<String, dynamic> json)
      : key = json["key"],
        count = json["count"];

  Map<String, dynamic> toJson() => {
        "key": key,
        "count": count,
      };
}

Future<String> get getLocalPath async {
  final directory = await getApplicationSupportDirectory();
  return directory.path;
}

//read here
readFromJsonFile({required String pathName, required String fileName}) async {
  final localPath = await getLocalPath;
  final jsonFile = File("$localPath/$pathName/$fileName");
  Map<String, dynamic>? jsonFileContent;
  if (jsonFile.existsSync()) {
    debugPrint("File exists");
    jsonFileContent = await json.decode(jsonFile.readAsStringSync());

    debugPrint("initState >> jsonFileContent:  ${jsonFileContent.toString()}");
  } else {
    debugPrint("No File exists");
    jsonFileContent = null;
  }
  return jsonFileContent;
}

//
createFile(
    {required Map<String, dynamic> content,
    required Directory dir,
    required String fileName}) {
  debugPrint("Creating file!");
  File file = File("${dir.path}/$fileName");
  file.createSync();
  file.writeAsStringSync(json.encode(content));
}

// write here
writeToJsonFile(
    {required String key,
    required dynamic content,
    required dynamic pathName,
    required dynamic fileName}) async {
  final localPath = await getLocalPath;
  Map<String, dynamic> content0 = {key: content};

  final customPath = Directory("$localPath/$pathName");

  if ((await customPath.exists())) {
    final jsonFile = File("$localPath/$pathName/$fileName");
    if (jsonFile.existsSync()) {
      debugPrint(" jsonFile exist:  $jsonFile");
      Map<String, dynamic> jsonFileContent =
          json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content0);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    } else {
      debugPrint("No File: $jsonFile");
      createFile(content: content0, dir: customPath, fileName: fileName);
    }
  } else {
    debugPrint("No dir: $customPath");
    await customPath.create();
    createFile(content: content0, dir: customPath, fileName: fileName);
  }
}
