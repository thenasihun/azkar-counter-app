import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:azkar_counter/models/azkar_model.dart';

class LocalStorageService {
  static const String azkarBoxName = 'azkar_box';

  static Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(AzkarModelAdapter());
  }

  Future<Box<AzkarModel>> openBox() async {
    return await Hive.openBox<AzkarModel>(azkarBoxName);
  }

  List<AzkarModel> getPreloadedAzkar() {
    return [
      AzkarModel(title: 'Allahu Akbar', arabic: 'الله أكبر', meaning: 'Allah is the Greatest', lastUpdated: DateTime.now()),
      AzkarModel(title: 'SubhanAllah', arabic: 'سبحان الله', meaning: 'Glory be to Allah', lastUpdated: DateTime.now()),
      AzkarModel(title: 'Alhamdulillah', arabic: 'الحمد لله', meaning: 'Praise be to Allah', lastUpdated: DateTime.now()),
      AzkarModel(title: 'La ilaha illallah', arabic: 'لا إله إلا الله', meaning: 'There is no god but Allah', lastUpdated: DateTime.now()),
      AzkarModel(title: 'Astaghfirullah', arabic: 'أستغفر الله', meaning: 'I seek forgiveness from Allah', lastUpdated: DateTime.now()),
    ];
  }
}
