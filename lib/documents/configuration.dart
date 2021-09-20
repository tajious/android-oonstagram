import 'package:hive/hive.dart';

part 'configuration.g.dart';

@HiveType(typeId: 0)
class Configuration extends HiveObject {

  @HiveField(0)
  String cdnUrl;

  Configuration({this.cdnUrl});

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(cdnUrl: json['cdnUrl']);
  }

}