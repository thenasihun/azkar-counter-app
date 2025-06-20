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
    
    // Check if the database is empty.
    if (box.isEmpty) {
      final preloadedAzkar = _storageService.getPreloadedAzkar();
      // If it's empty, add the default Azkar list.
      await box.addAll(preloadedAzkar);
    }

    // Always read from the box after the check.
    // This ensures that if the box was empty and is now populated,
    // the UI will get the new data.
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

  Future<void> resetAllCounts(AzkarModel azkar) async {
    azkar.dailyCount = 0;
    azkar.totalCount = 0;
    await azkar.save();
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

  void _resetDailyCountsIfNeeded() {
    final now = DateTime.now();
    for (var azkar in _azkarList) {
      if (now.difference(azkar.lastUpdated).inDays >= 1) {
        azkar.dailyCount = 0;
        azkar.save();
      }
    }
  }
}
