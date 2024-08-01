
























// // ignore_for_file: deprecated_member_use

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

// import '../models/ble_services.dart';
// import '../environment/env_style.dart';
// import 'ble_home_page.dart';

// class ReadAnyBleCharacteristic extends StatefulWidget {
//   final DiscoveredDevice device;
//   const ReadAnyBleCharacteristic({super.key, required this.device});

//   @override
//   State<ReadAnyBleCharacteristic> createState() =>
//       _ReadAnyBleCharacteristicState();
// }

// class _ReadAnyBleCharacteristicState extends State<ReadAnyBleCharacteristic> {
//   get screenWidth => MediaQuery.of(context).size.width;
//   get screenHeight => MediaQuery.of(context).size.height;
//   final flutterReactiveBle = FlutterReactiveBle();
//   DiscoveredDevice? device;
//   StreamSubscription<ConnectionStateUpdate>? connectionSubscription;

//   String selectedShape = 'Circle Shape';
//   bool light = true;
//   List<int> results = [0];
//   List<int> response = [];
//   bool isConnected = false;
//   Timer? _timer;
//   int rawData = 0;

//   int currentStep = 0;

//   TextEditingController textEditingController = TextEditingController();

//   String readValueCharacteristicId = '';

//   subscribeToDeviceCharacteristic({
//     required FlutterReactiveBle flutterReactiveBle,
//     required DiscoveredDevice device,
//     required Uuid serviceId,
//     required Uuid characteristicId,
//   }) {
//     final characteristic = QualifiedCharacteristic(
//       serviceId: serviceId,
//       characteristicId: characteristicId,
//       deviceId: device.id,
//     );
//     flutterReactiveBle.subscribeToCharacteristic(characteristic).listen((data) {
//       debugPrint('\n\nsubscribeToCharacteristic-data: $data');
//       setState(() {
//         results = data;
//       });
//     }, onError: (err) {
//       debugPrint('\n\nsubscribeToCharacteristic-err: $err');
//     });
//   }

//   connectToDevice({required DiscoveredDevice device}) {
//     connectionSubscription = flutterReactiveBle
//         .connectToDevice(
//       id: device.id,
//     )
//         .listen((connectionState) {
//       debugPrint('connection-State: $connectionState');
//       debugPrint('connection-State: ${connectionState.connectionState}');
//       if (connectionState.connectionState == DeviceConnectionState.connected) {
//         debugPrint(
//             '\n\n\nDeviceConnectionState.connected >> device: $device\n\n\n');
//         setState(() {
//           isConnected = connectionState.connectionState ==
//               DeviceConnectionState.connected;
//         });
//       }
//     }, onError: (Object error) {
//       debugPrint('connection-error: $error');
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     device = widget.device;
//     connectToDevice(device: device!);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     disconnectFromDevice(connectionSubscription: connectionSubscription!);
//     connectionSubscription!.cancel();
//     _timer!.cancel();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         await Navigator.pushAndRemoveUntil(
//             context,
//             MaterialPageRoute(builder: (context) => const BleHomePage()),
//             (route) => false);
//         return false as Future<bool>;
//       },
//       child: Scaffold(
//         backgroundColor: EnvStyle.bgColor,
//         appBar: AppBar(
//           automaticallyImplyLeading: true,
//           leading: Navigator.canPop(context)
//               ? IconButton(
//                   icon: Icon(
//                     Icons.arrow_back_ios_new,
//                     color: EnvStyle.bgColor,
//                     size: screenWidth / 12,
//                   ),
//                   onPressed: () {
//                     Navigator.pushAndRemoveUntil(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const BleHomePage()),
//                         (route) => false);
//                   },
//                 )
//               : null,
//           backgroundColor: EnvStyle.themeColorLight,
//           title: Text(
//             '${widget.device.name} BLE Sensor',
//             style: EnvStyle.normalHeadingStyle,
//           ),
//         ),
//         body: isConnected
//             ? Center(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(screenHeight / 32),
//                         child: Theme(
//                           data: Theme.of(context).copyWith(
//                             textSelectionTheme: TextSelectionThemeData(
//                               cursorColor: EnvStyle.themeColorLight,
//                               selectionColor: EnvStyle.greenColorLight,
//                               selectionHandleColor: EnvStyle.themeColorLight,
//                             ),
//                           ),
//                           child: TextField(
//                             controller: textEditingController,
//                             onEditingComplete: () {
//                               setState(() {
//                                 readValueCharacteristicId =
//                                     textEditingController.text;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               iconColor: EnvStyle.greenColor,
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: BorderSide(
//                                   color: EnvStyle.themeColorLight2,
//                                 ),
//                               ),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: textEditingController.text.isEmpty
//                             ? null
//                             : () {
//                                 debugPrint(
//                                     'textEditingController.text: ${textEditingController.text}\n');
//                                 subscribeToDeviceCharacteristic(
//                                   flutterReactiveBle: flutterReactiveBle,
//                                   device: device!,
//                                   serviceId: device!.serviceUuids.last,
//                                   characteristicId:
//                                       Uuid.parse(textEditingController.text),
//                                 );
//                               },
//                         style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           padding: EdgeInsets.symmetric(
//                               vertical: screenWidth / 24,
//                               horizontal: screenHeight / 32),
//                         ),
//                         child: Text(
//                           'Subscribe',
//                           style: EnvStyle.normalStyleGreen,
//                         ),
//                       ),
//                       const Divider(),
//                       Padding(
//                         padding: EdgeInsets.all(screenHeight / 32),
//                         child: Text(
//                           'Read Value: ${results.last}',
//                         ),
//                       )
//                     ]),
//               )
//             : Center(
//                 child: CircularProgressIndicator(
//                   color: EnvStyle.themeColorLight2,
//                   strokeWidth: screenWidth / 128,
//                 ),
//               ),
//       ),
//     );
//   }
// }
