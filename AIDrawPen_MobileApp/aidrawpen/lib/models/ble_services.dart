import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

writeToDevice({
  required FlutterReactiveBle flutterReactiveBle,
  required DiscoveredDevice device,
  required Uuid serviceId,
  required Uuid characteristicId,
  required List<int> value,
}) async {
  QualifiedCharacteristic characteristic = QualifiedCharacteristic(
    serviceId: serviceId,
    characteristicId: characteristicId,
    deviceId: device.id,
  );
  await flutterReactiveBle
      .writeCharacteristicWithResponse(characteristic, value: value)
      .then((_) {
    debugPrint('Write successful');
  }).catchError((error) {
    debugPrint('Write failed: $error');
  });
}

Future<List<int>> readFromDevice({
  required FlutterReactiveBle flutterReactiveBle,
  required DiscoveredDevice device,
  required Uuid serviceId,
  required Uuid characteristicId,
  required int bitLength,
}) async {
  List<int> results = [];
  final characteristic = QualifiedCharacteristic(
    serviceId: serviceId,
    characteristicId: characteristicId,
    deviceId: device.id,
  );
  await flutterReactiveBle.readCharacteristic(characteristic).then((response) {
    results = response;
  }).catchError((error) {
    debugPrint('Read error: $error');
    results = [];
  });
  return results;
}

disconnectFromDevice(
    {required StreamSubscription<ConnectionStateUpdate>
        connectionSubscription}) async {
  await connectionSubscription.cancel();
}
