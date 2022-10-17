import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NativeCodeScreen extends StatefulWidget {
  @override
  State<NativeCodeScreen> createState() => variable();
}

// ignore: camel_case_types
class variable extends State<NativeCodeScreen> {
  // to create the channel between the client and the host
  static const platform = MethodChannel('samples.flutter.dev/battery');

//   // added '_' to make it private variable
//   String _batteryLevel = 'Unknown battery level.';
//   Future<void> _getBatteryLevel() async {
//   String batteryLevel;
//   try {
//     final int result = await platform.invokeMethod('getBatteryLevel');
//     batteryLevel = 'Battery level at $result % .';
//   } on PlatformException catch (e) {
//     batteryLevel = "Failed to get battery level: '${e.message}'.";
//   }

//   setState(() {
//     _batteryLevel = batteryLevel;
//   });
// }

  // the same like before but by another way
  String batteryLevel = 'Unknown battery level.';
  void getBatteryLevel() {
    platform.invokeMethod('getBatteryLevel').then((value) {
      setState(() {
        batteryLevel = 'Battery level at $value % .';
      });
    }).catchError((error) {
      setState(() {
        batteryLevel = "Failed to get battery level: '${error.message}'.";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: getBatteryLevel,
            child: const Text('Get Battery Level'),
          ),
          Text(batteryLevel),
        ],
      ),
    ));
  }
}
