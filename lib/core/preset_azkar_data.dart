import 'package:azkar_counter/models/azkar_model.dart';

// A simple class to hold a preset Azkar
class PresetAzkar {
  final String arabic;
  final String transliteration;
  final String meaning;
  final int targetCount;

  PresetAzkar({
    required this.arabic,
    required this.transliteration,
    required this.meaning,
    this.targetCount = 0,
  });
}

// A class for a category of presets
class PresetCategory {
  final String name;
  final String description;
  final List<PresetAzkar> azkarList;

  PresetCategory({
    required this.name,
    required this.description,
    required this.azkarList,
  });
}

// The main data source for all preset Azkar
final List<PresetCategory> presetCategories = [
  PresetCategory(
    name: "99 Names of Allah",
    description: "The most beautiful names belonging to Allah.",
    azkarList: [
      PresetAzkar(arabic: "الله", transliteration: "Allah", meaning: "The God"),
      PresetAzkar(arabic: "الرحمن", transliteration: "Ar-Rahman", meaning: "The Beneficent"),
      PresetAzkar(arabic: "الرحيم", transliteration: "Ar-Rahim", meaning: "The Merciful"),
      PresetAzkar(arabic: "الملك", transliteration: "Al-Malik", meaning: "The King"),
      // Add all rest 95 names here
      PresetAzkar(arabic: "القدوس", transliteration: "Al-Quddus", meaning: "The Most Sacred"),
      PresetAzkar(arabic: "السلام", transliteration: "As-Salam", meaning: "The Source of Peace"),
      PresetAzkar(arabic: "المؤمن", transliteration: "Al-Mu'min", meaning: "The Infuser of Faith"),
      PresetAzkar(arabic: "المهيمن", transliteration: "Al-Muhaymin", meaning: "The Preserver of Safety"),
      PresetAzkar(arabic: "العزيز", transliteration: "Al-Aziz", meaning: "The Almighty"),
      PresetAzkar(arabic: "الجبار", transliteration: "Al-Jabbar", meaning: "The Compeller"),
      PresetAzkar(arabic: "المتكبر", transliteration: "Al-Mutakabbir", meaning: "The Supreme"),
      PresetAzkar(arabic: "الخالق", transliteration: "Al-Khaliq", meaning: "The Creator"),
      PresetAzkar(arabic: "البارئ", transliteration: "Al-Bari'", meaning: "The Evolver"),
      PresetAzkar(arabic: "المصور", transliteration: "Al-Musawwir", meaning: "The Fashioner"),
      PresetAzkar(arabic: "الغفار", transliteration: "Al-Ghaffar", meaning: "The Constant Forgiver"),
      PresetAzkar(arabic: "القهار", transliteration: "Al-Qahhar", meaning: "The All-Prevailing One"),
      PresetAzkar(arabic: "الوهاب", transliteration: "Al-Wahhab", meaning: "The Supreme Bestower"),
      PresetAzkar(arabic: "الرزاق", transliteration: "Ar-Razzaq", meaning: "The Provider"),
      PresetAzkar(arabic: "الفتاح", transliteration: "Al-Fattah", meaning: "The Opener"),
      PresetAzkar(arabic: "العليم", transliteration: "Al-Alim", meaning: "The All-Knowing"),
      PresetAzkar(arabic: "القابض", transliteration: "Al-Qabid", meaning: "The Withholder"),
      PresetAzkar(arabic: "الباسط", transliteration: "Al-Basit", meaning: "The Extender"),
      PresetAzkar(arabic: "الخافض", transliteration: "Al-Khafid", meaning: "The Reducer"),
      PresetAzkar(arabic: "الرافع", transliteration: "Ar-Rafi'", meaning: "The Exalter"),
      PresetAzkar(arabic: "المعز", transliteration: "Al-Mu'izz", meaning: "The Honourer"),
      PresetAzkar(arabic: "المذل", transliteration: "Al-Mudhill", meaning: "The Dishonourer"),
      PresetAzkar(arabic: "السميع", transliteration: "As-Sami'", meaning: "The All-Hearing"),
      PresetAzkar(arabic: "البصير", transliteration: "Al-Basir", meaning: "The All-Seeing"),
      PresetAzkar(arabic: "الحكم", transliteration: "Al-Hakam", meaning: "The Impartial Judge"),
      PresetAzkar(arabic: "العدل", transliteration: "Al-'Adl", meaning: "The Utterly Just"),
      PresetAzkar(arabic: "اللطيف", transliteration: "Al-Latif", meaning: "The Subtle One"),
      PresetAzkar(arabic: "الخبير", transliteration: "Al  -Khabir", meaning: "The All-Aware"),
      PresetAzkar(arabic: "الحليم", transliteration: "Al-Halim", meaning: "The Forbearing"),
      PresetAzkar(arabic: "العظيم", transliteration: "Al-Azim", meaning: "The Magnificent"),
      PresetAzkar(arabic: "الغفور", transliteration: "Al-Ghafur", meaning: "The Great Forgiver"),
      PresetAzkar(arabic: "الشكور", transliteration: "Ash-Shakur", meaning: "The Most Appreciative"),
      PresetAzkar(arabic: "العلي", transliteration: "Al-Ali", meaning: "The Most High"),
      PresetAzkar(arabic: "الكبير", transliteration: "Al-Kabir", meaning: "The Most Great"),
      PresetAzkar(arabic: "الحفيظ", transliteration: "Al-Hafiz", meaning: "The Preserver"),
      PresetAzkar(arabic: "المقيت", transliteration: "Al-Muqit", meaning: "The Sustainer"),
      PresetAzkar(arabic: "الحسيب", transliteration: "Al-Hasib", meaning: "The Reckoner"),
      PresetAzkar(arabic: "الجليل", transliteration: "Al-Jalil", meaning: "The Majestic"),
      PresetAzkar(arabic: "الكريم", transliteration: "Al-Karim", meaning: "The Generous"),
      PresetAzkar(arabic: "الرقيب", transliteration: "Ar-Raqib", meaning: "The Watchful"),
      PresetAzkar(arabic: "المجيب", transliteration: "Al-Mujib", meaning: "The Responsive One"),
      PresetAzkar(arabic: "الواسع", transliteration: "Al-Wasi'", meaning: "The All-Encompassing, the Boundless"),
      PresetAzkar(arabic: "الحكيم", transliteration: "Al-Hakim", meaning: "The All-Wise"),
      PresetAzkar(arabic: "الودود", transliteration: "Al-Wadud", meaning: "The Most Loving"),
      PresetAzkar(arabic: "المجيد", transliteration: "Al-Majid", meaning: "The Glorious"),
      PresetAzkar(arabic: "الباعث", transliteration: "Al-Ba'ith", meaning: "The Resurrector"),
      PresetAzkar(arabic: "الشهيد", transliteration: "Ash-Shahid", meaning: "The All Observing Witnessing"),
      PresetAzkar(arabic: "الحق", transliteration: "Al-Haqq", meaning: "The Absolute Truth"),
      PresetAzkar(arabic: "الوكيل", transliteration: "Al-Wakil", meaning: "The Trustee, the Disposer of Affairs"),
      PresetAzkar(arabic: "القوي", transliteration: "Al-Qawiyy", meaning: "The All-Strong"),
      PresetAzkar(arabic: "المتين", transliteration: "Al-Matin", meaning: "The Firm, the Steadfast"),
      PresetAzkar(arabic: "الولي", transliteration: "Al-Wali", meaning: "The Protecting Associate"),
      PresetAzkar(arabic: "الحميد", transliteration: "Al-Hamid", meaning: "The Praiseworthy"),
      PresetAzkar(arabic: "المحصي", transliteration: "Al-Muhsi", meaning: "The All Enumerating, the Counter"),
      PresetAzkar(arabic: "المبدئ", transliteration: "Al-Mubdi'", meaning: "The Originator, the Initiator"),
      PresetAzkar(arabic: "المعيد", transliteration: "Al-Mu'id", meaning: "The Restorer, the Reinstater"),
      PresetAzkar(arabic: "المحيي", transliteration: "Al-Muhyi", meaning: "The Giver of Life"),
      PresetAzkar(arabic: "المميت", transliteration: "Al-Mumit", meaning: "The Creator of Death"),
      PresetAzkar(arabic: "الحي", transliteration: "Al-Hayy", meaning: "The Ever-Living"),
      PresetAzkar(arabic: "القيوم", transliteration: "Al-Qayyum", meaning: "The Sustainer, the Self-Subsisting"),
      PresetAzkar(arabic: "الواجد", transliteration: "Al-Wajid", meaning: "The Perceiver"),
      PresetAzkar(arabic: "الماجد", transliteration: "Al-Majid", meaning: "The Illustrious, the Magnificent"),
      PresetAzkar(arabic: "الواحِد", transliteration: "Al-Wahid", meaning: "The One"),
      PresetAzkar(arabic: "الاحد", transliteration: "Al-Ahad", meaning: "The Unique, the Only One"),
      PresetAzkar(arabic: "الصمد", transliteration: "As-Samad", meaning: "The Eternal, Satisfier of Needs"),
      PresetAzkar(arabic: "القادر", transliteration: "Al-Qadir", meaning: "The Omnipotent"),
      PresetAzkar(arabic: "المقتدر", transliteration: "Al-Muqtadir", meaning: "The Powerful"),
      PresetAzkar(arabic: "المقدم", transliteration: "Al-Muqaddim", meaning: "The Expediter, the Promoter"),
      PresetAzkar(arabic: "المؤخر", transliteration: "Al-Mu'akhkhir", meaning: "The Delayer"),
      PresetAzkar(arabic: "الأول", transliteration: "Al-Awwal", meaning: "The First"),
      PresetAzkar(arabic: "الأخر", transliteration: "Al-Akhir", meaning: "The Last"),
      PresetAzkar(arabic: "الظاهر", transliteration: "Az-Zahir", meaning: "The Manifest"),
      PresetAzkar(arabic: "الباطن", transliteration: "Al-Batin", meaning: "The Hidden"),
      PresetAzkar(arabic: "الوالي", transliteration: "Al-Wali", meaning: "The Sole Governor"),
      PresetAzkar(arabic: "المتعال", transliteration: "Al-Muta'ali", meaning: "The Self Exalted"),
      PresetAzkar(arabic: "البر", transliteration: "Al-Barr", meaning: "The Source of All Goodness"),
      PresetAzkar(arabic: "التواب", transliteration: "At-T-Tawwab", meaning: "The Ever-Pardoning"),
      PresetAzkar(arabic: "المنتقم", transliteration: "Al-Muntaqim", meaning: "The Avenger"),
      PresetAzkar(arabic: "العفو", transliteration: "Al-'Afuw", meaning: "The Pardoner"),
      PresetAzkar(arabic: "الرؤوف", transliteration: "Ar-Ra'uf", meaning: "The Most Kind"),
      PresetAzkar(arabic: "مالك الملك", transliteration: "Malik-ul-Mulk", meaning: "Master of the Kingdom, Owner of the Dominion"),
      PresetAzkar(arabic: "الذوالجلال والاكرام", transliteration: "Dhul-Jalali wal-Ikram", meaning: "Lord of Glory and Honour, Lord of Majesty and Generosity"),
      PresetAzkar(arabic: "المقسط", transliteration: "Al-Muqsit", meaning: "The Just One"),
      PresetAzkar(arabic: "الجامع", transliteration: "Al-Jami'", meaning: "The Gatherer, the Uniter"),
      PresetAzkar(arabic: "الغني", transliteration: "Al-Ghani", meaning: "The Self-Sufficient, The Wealthy"),
      PresetAzkar(arabic: "المغني", transliteration: "Al-Mughni", meaning: "The Enricher"),
      PresetAzkar(arabic: "المانع", transliteration: "Al-Mani'", meaning: "The Withholder"),
      PresetAzkar(arabic: "الضار", transliteration: "Ad-Dhar", meaning: "The Distresser"),
      PresetAzkar(arabic: "النافع", transliteration: "An-Nafi'", meaning: "The Propitious"),
      PresetAzkar(arabic: "النور", transliteration: "An-Nur", meaning: "The Light"),
      PresetAzkar(arabic: "الهادي", transliteration: "Al-Hadi", meaning: "The Guide"),
      PresetAzkar(arabic: "البديع", transliteration: "Al-Badi'", meaning: "The Incomparable, the Originator"),
      PresetAzkar(arabic: "الباقي", transliteration: "Al-Baqi", meaning: "The Ever-Surviving, the Everlasting"),
      PresetAzkar(arabic: "الوارث", transliteration: "Al-Warith", meaning: "The Inheritor, the Heir"),
      PresetAzkar(arabic: "الرشيد", transliteration: "Ar-Rashid", meaning: "The Guide to the Right Path"),
      PresetAzkar(arabic: "الصبور", transliteration: "As-Sabur", meaning: "The Patient"),
    ],
  ),
  PresetCategory(
    name: "Istighfar (Forgiveness)",
    description: "Seeking forgiveness from Allah.",
    azkarList: [
      PresetAzkar(arabic: "أَسْتَغْفِرُ اللّٰهَ", transliteration: "Astaghfirullah", meaning: "I seek forgiveness from Allah."),
      PresetAzkar(arabic: "أَسْتَغْفِرُ اللّٰهَ وَأَتُوْبُ إِلَيْهِ", transliteration: "Astaghfirullaha wa atubu ilayh", meaning: "I seek forgiveness from Allah and I repent to Him."),
      PresetAzkar(arabic: "رَبِّ اغْفِرْ لِي وَتُبْ عَلَيَّ، إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ", transliteration: "Rabbighfir li wa tub `alayya, innaka Antat-Tawwabur-Rahim", meaning: "My Lord, forgive me and accept my repentance, You are the Ever-Relenting, the Most Merciful."),
      PresetAzkar(arabic: "اللَّهُمَّ اغْفِرْ لِي ذَنْبِي وَأَسْرِفْ عَلَيَّ فِي أَمْرِي", transliteration: "Allahumma ighfir li dhambi wa asrif 'alayya fi amri", meaning: "O Allah, forgive my sin and spare me from my affairs."),
      PresetAzkar(arabic: "اللَّهُمَّ اغْفِرْ لِي ذُنُوبِي كُلَّهَا، دِقَّهَا وَجِلَّهَا، أَوَّلَهَا وَآخِرَهَا، عَلَانِيَّتَهَا وَسِرَّهَا", transliteration: "Allahumma ighfir li dhunubi kullaha, diqquha wa jillaha, awwaluha wa akhira, 'alaniyyataha wa sirraha", meaning: "O Allah, forgive all my sins, the small and the great, the first and the last, the open and the hidden."),
      PresetAzkar(arabic: "اللَّهُمَّ اغْفِرْ لِي ذَنْبِي وَأَسْرِفْ عَلَيَّ فِي أَمْرِي، وَاغْفِرْ لِي مَا قَدَّمْتُ وَمَا أَخَّرْتُ", transliteration: "Allahumma ighfir li dhambi wa asrif 'alayya fi amri, waghfir li ma qaddamtu wa ma akkhartu", meaning: "O Allah, forgive my sin and spare me from my affairs, and forgive me for what I have done in the past and what I will do in the future."),
      PresetAzkar(arabic: "اللَّهُمَّ اغْفِرْ لِي ذَنْبِي وَأَسْرِفْ عَلَيَّ فِي أَمْرِي، وَاغْفِرْ لِي مَا قَدَّمْتُ وَمَا أَخَّرْتُ، وَمَا أَسْرَرْتُ وَمَا أَعْلَنْتُ", transliteration: "Allahumma ighfir li dhambi wa asrif 'alayya fi amri, waghfir li ma qaddamtu wa ma akkhartu, wa ma asrartu wa ma a'alantu", meaning: "O Allah, forgive my sin and spare me from my affairs, and forgive me for what I have done in the past and what I will do in the future, and what I have concealed and what I have made known."),
      PresetAzkar(
        arabic: "اللَّهُمَّ أَنْتَ رَبِّي، لَا إِلَهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ لَكَ بِذَنْبِي، فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ",
        transliteration: "Allahumma anta Rabbi, la ilaha illa Anta, khalaqtani wa ana 'abduka, wa ana 'ala 'ahdika wa wa'dika ma istata'tu, a'udhu bika min sharri ma san'atu, abuu'u laka bini'matika 'alayya, wa abuu'u laka bidhanbi, faghfir li fa innahu la yaghfiru adh-dhunuba illa Anta",
        meaning: "O Allah! You are my Lord; there is no deity except You. You created me and I am Your servant. I am committed to Your covenant and promise as much as I can. I seek refuge in You from the evil of what I have done. I acknowledge Your blessings upon me and I confess my sins. So forgive me, for none forgives sins except You."),  
    ],
  ),
  PresetCategory(
    name: "Darood (Salutations on the Prophet)",
    description: "Sending blessings upon the Prophet Muhammad (ﷺ).",
    azkarList: [
      PresetAzkar(arabic: "صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ", transliteration: "Sallallahu 'alaihi wa sallam", meaning: "May the peace and blessings of Allah be upon him."),
      PresetAzkar(arabic: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ", transliteration: "Allahumma salli 'ala Muhammadin wa 'ala ali Muhammad", meaning: "O Allah, send your grace, honour and mercy on Muhammad and on the family of Muhammad.", 
        targetCount: 10 ),
      PresetAzkar(
        arabic: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ. اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ.",
        transliteration: "Allahumma salli 'ala Muhammadin wa 'ala ali Muhammad kama sallayta 'ala Ibrahim wa 'ala ali Ibrahim, innaka Hamidun Majid. Allahumma barik 'ala Muhammadin wa 'ala ali Muhammad kama barakta 'ala Ibrahim wa 'ala ali Ibrahim, innaka Hamidun Majid.",
        meaning: "O Allah, send your grace, honour and mercy on Muhammad and on the family of Muhammad as You sent Your grace, honour and mercy on Ibrahim and on the family of Ibrahim. You are indeed Praiseworthy, Most Glorious. O Allah, bless Muhammad and the family of Muhammad as You blessed Ibrahim and the family of Ibrahim. You are indeed Praiseworthy, Most Glorious."),
    ],
  ), 
  // add after prayer(namaz) azkar complete list 
  PresetCategory(
    name: "After Prayer Azkar",
    description: "Azkar to be recited after the obligatory prayers.",
    azkarList: [
      PresetAzkar(arabic: "اللَّهُ أَكْبَرُ", transliteration: "Allahu Akbar", meaning: "Allah is the Greatest.", targetCount: 1),
      PresetAzkar(arabic: "أَسْتَغْفِرُ اللّٰهَ", transliteration: "Astaghfirullah", meaning: "I seek forgiveness from Allah.", targetCount: 3),
      PresetAzkar(arabic: "اللَّهُمَّ أَنْتَ السَّلاَمُ وَمِنْكَ السَّلاَمُ تَبَارَكْتَ يَا ذَا الْجَلاَلِ وَالإكْرَامِ", transliteration: "Allahumma Antas-Salam wa minkas-Salam tabarakta ya dhal-jalali wal-ikram", meaning: "O Allah, You are Peace, and from You comes peace. Blessed are You, O Lord of Glory and Honour.", targetCount: 1),
      PresetAzkar(arabic: "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ", transliteration: "Allahumma a'inni 'ala dhikrika wa shukrika wa husni 'ibadatika", meaning: "O Allah, help me remember You, to be grateful to You, and to worship You in the best manner.", targetCount: 1),
      PresetAzkar(arabic: "لَا إِلَهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ", transliteration: "La ilaha illa Allahu wahdahu la sharika lahu, lahu al-mulku wa lahu al-hamdu, wa huwa 'ala kulli shay'in qadir", meaning: "There is no deity but Allah, alone without partner. To Him belongs the dominion and to Him belongs all praise, and He is over all things competent.", targetCount: 10),
      PresetAzkar(arabic: "اللَّهُمَّ لَا مَانِعَ لِمَا أَعْطَيْتَ، وَلَا مُعْطِيَ لِمَا مَنَعْتَ، وَلَا يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ", transliteration: "Allahumma la mani'a lima a'tayta, wa la mu'tiya lima mana'ta, wa la yanfa'u dhal-jaddi minka al-jaddu", meaning: "O Allah, there is no withholder of what You have given, and no giver of what You have withheld, and the wealth of the wealthy does not benefit You.", targetCount: 1),
      // لَا إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيْكَ لَهُ، لَهُ الْمُلْكُ، وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيْرٌ، لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللّٰهِ، لَا إِلٰهَ إِلَّا اللّٰهُ، وَلَا نَعْبُدُ إِلَّا إِيَّاهُ، لَهُ النِّعْمَةُ وَلَهُ الْفَضْلُ وَلَهُ الثَّنَاءُ الْحَسَنُ، لَا إِلٰهَ إِلَّا اللّٰهُ مُخْلِصِيْنَ لَهُ الدِّيْنَ وَلَوْ كَرِهَ الْكَافِرُوْنَ
      
    ],
  ),  
];
