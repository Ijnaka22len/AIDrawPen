// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:aidrawpen/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:permission_handler/permission_handler.dart';

import 'device_details_page.dart';
import '../environment/env_data.dart';
import '../environment/env_style.dart';

class BleHomePage extends StatefulWidget {
  const BleHomePage({super.key});

  @override
  _BleHomePageState createState() => _BleHomePageState();
}

class _BleHomePageState extends State<BleHomePage> {
  get screenWidth => MediaQuery.of(context).size.width;
  get screenHeight => MediaQuery.of(context).size.height;
  final flutterReactiveBle = FlutterReactiveBle();
  final devices = <DiscoveredDevice>[];
  final discoveredDeviceIds = <String>{};
  bool scanning = false;

  void scanBleDevices() {
    try {
      flutterReactiveBle.scanForDevices(
        withServices: [],
        scanMode: ScanMode.lowLatency,
        requireLocationServicesEnabled: true,
      ).listen(
        (device) {
          setState(() {
            if (EnvData.bleNames
                .any((name) => device.name.toLowerCase().contains(name))) {
              if (!discoveredDeviceIds.contains(device.id)) {
                setState(() {
                  devices.add(device);
                  discoveredDeviceIds.add(device.id);
                  debugPrint("devices: ${device.name}");
                });
              }
            }
          });
        },
        onError: (err) {
          debugPrint("BLE Scan error: $err");
        },
      );
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Future<void> requestPermissions() async {
    final permissions = [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.bluetoothAdvertise,
      Permission.location
    ];
    await permissions.request();
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      scanBleDevices();
    });
  }

  @override
  void initState() {
    super.initState();
    requestPermissions();
    scanBleDevices();
  }

  @override
  void dispose() {
    super.dispose();
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
          automaticallyImplyLeading: false,
          leading: Navigator.canPop(context)
              ? null
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: EnvStyle.bgColor,
                    size: screenWidth / 12,
                  ),
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainScreen()));
                  },
                ),
          backgroundColor: EnvStyle.themeColorLight,
          title: Center(
            child: Text(
              'Dedicated BLE Devices',
              style: EnvStyle.normalHeadingStyle,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(screenWidth / 256),
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  color: scanning ? EnvStyle.bgColor : EnvStyle.redColor,
                  borderRadius: BorderRadius.circular(screenWidth / 16),
                ),
                child: IconButton(
                  onPressed: () async {
                    setState(() {
                      scanning = true;
                    });

                    scanBleDevices();

                    await Future.delayed(const Duration(seconds: 2));

                    setState(() {
                      scanning = false;
                    });
                  },
                  icon: scanning
                      ? CircularProgressIndicator(
                          color: EnvStyle.themeColorLight2)
                      : Icon(
                          Icons.refresh,
                          color: EnvStyle.bgColor,
                          size: screenWidth / 12,
                        ),
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: devices.isNotEmpty
              ? ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return Padding(
                      padding: EdgeInsets.all(screenWidth / 32),
                      child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.white70, width: 1),
                            borderRadius:
                                BorderRadius.circular(screenWidth / 16),
                          ),
                          color: EnvStyle.themeColorLight2,
                          child: ListTile(
                            trailing: Icon(
                              Icons.bluetooth,
                              size: screenWidth / 16,
                              color: EnvStyle.whiteColor,
                            ),
                            title: Text(
                              device.name,
                              style: EnvStyle.normalStyleWhite,
                            ),
                            subtitle: Text(
                              device.id,
                              style: EnvStyle.normalStyleWhite,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DeviceCommunicationPage(
                                    device: device,
                                  ),
                                ),
                              );
                            },
                          )),
                    );
                  },
                )
              : Center(
                  child: Text('No Available BLE Device',
                      style: EnvStyle.normalStyleBlack),
                ),
        ),
      ),
    );
  }
}
