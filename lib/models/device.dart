import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  final int id;
  final String name;
  String status;
  final int consumption;

  Device({
    required this.id,
    required this.name,
    required this.status,
    required this.consumption,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}
