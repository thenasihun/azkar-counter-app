import 'package:hive/hive.dart';

part 'azkar_model.g.dart';

@HiveType(typeId: 0)
class AzkarModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String arabic;

  @HiveField(2)
  String meaning;

  @HiveField(3)
  int dailyCount;

  @HiveField(4)
  int totalCount;

  @HiveField(5)
  bool isCustom;

  @HiveField(6)
  DateTime lastUpdated;

  @HiveField(7)
  int targetCount;

  @HiveField(8)
  String category;

  @HiveField(9)
  bool isFavorite;

  AzkarModel({
    required this.title,
    required this.arabic,
    required this.meaning,
    this.dailyCount = 0,
    this.totalCount = 0,
    this.isCustom = false,
    required this.lastUpdated,
    this.targetCount = 0, // Default to 0 (no target)
    this.category = "My Azkar",
    this.isFavorite = false,
  });
}
