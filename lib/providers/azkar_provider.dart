import 'package:flutter/material.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/services/local_storage_service.dart';

class AzkarProvider with ChangeNotifier {
  List<AzkarModel> _azkarList = [];
  final LocalStorageService _storageService = LocalStorageService();

  List<AzkarModel> get azkarList => _azkarList;

  AzkarProvider() {
    _loadAzkar();
  }

  Future<void> _loadAzkar() async {
    var box = await _storageService.openBox();

    if (box.isEmpty) {
      final preloadedAzkar = _storageService.getPreloadedAzkar();
      await box.addAll(preloadedAzkar);
    }

    _azkarList = box.values.toList();

    _resetDailyCountsIfNeeded();
    notifyListeners();
  }

  Future<void> addAzkar(AzkarModel azkar) async {
    var box = await _storageService.openBox();
    await box.add(azkar);
    _azkarList = box.values.toList();
    notifyListeners();
  }

  Future<void> updateAzkar(AzkarModel azkar, String newArabic, String newTitle,
      String newMeaning) async {
    azkar.arabic = newArabic;
    azkar.title = newTitle;
    azkar.meaning = newMeaning;
    await azkar.save();
    notifyListeners();
  }

  Future<void> incrementCount(AzkarModel azkar) async {
    azkar.dailyCount++;
    azkar.totalCount++;
    azkar.lastUpdated = DateTime.now();
    await azkar.save();
    notifyListeners();
  }

  Future<void> resetDailyCount(AzkarModel azkar) async {
    azkar.dailyCount = 0;
    await azkar.save();
    notifyListeners();
  }

  Future<void> resetAllTotalCounts() async {
    for (var azkar in _azkarList) {
      azkar.totalCount = 0;
      await azkar.save();
    }
    notifyListeners();
  }

  Future<void> updateTargetCount(AzkarModel azkar, int newTarget) async {
    azkar.targetCount = newTarget;
    await azkar.save();
    notifyListeners();
  }

  Future<void> deleteAzkar(AzkarModel azkar) async {
    await azkar.delete();
    _azkarList.remove(azkar);
    notifyListeners();
  }

  /// Replaces the entire database with data from a backup file.
  Future<void> restoreAzkar(List<AzkarModel> restoredAzkar) async {
    final box = await _storageService.openBox();
    await box.clear(); // Clear all existing data
    await box.addAll(restoredAzkar); // Add the restored data
    _azkarList = box.values.toList(); // Reload the list from the box
    notifyListeners();
  }

  void _resetDailyCountsIfNeeded() {
    final now = DateTime.now();
    for (var azkar in _azkarList) {
      if (now.difference(azkar.lastUpdated).inDays >= 1) {
        azkar.dailyCount = 0;
        azkar.save();
      }
    }
  }

  Future<void> addMultipleAzkar(List<AzkarModel> azkarList) async {
    final box = await _storageService.openBox();
    await box.addAll(azkarList);
    _azkarList = box.values.toList();
    notifyListeners();
  }
}
