import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/device.dart';

class DataService {
  Future<List<Device>> loadDevices() async {
    final String response = await rootBundle.loadString('assets/devices.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Device.fromJson(json)).toList();
  }
}
