import 'package:hive/hive.dart';

part 'task.g.dart'; // Für Hive-Adapter

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  @HiveField(2)
  double? latitude;

  @HiveField(3)
  double? longitude;

  @HiveField(4)
  double? radiusMeters;

  Task({
    required this.title,
    this.isDone = false,
    this.latitude,
    this.longitude,
    this.radiusMeters,
  });
}
