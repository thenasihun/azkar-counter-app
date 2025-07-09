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
      PresetAzkar(
          arabic: "الرحمن",
          transliteration: "Ar-Rahman",
          meaning: "The Beneficent"),
      PresetAzkar(
          arabic: "الرحيم",
          transliteration: "Ar-Rahim",
          meaning: "The Merciful"),
      PresetAzkar(
          arabic: "الملك", transliteration: "Al-Malik", meaning: "The King"),
      // Add all rest 95 names here
      PresetAzkar(
          arabic: "القدوس",
          transliteration: "Al-Quddus",
          meaning: "The Most Sacred"),
      PresetAzkar(
          arabic: "السلام",
          transliteration: "As-Salam",
          meaning: "The Source of Peace"),
      PresetAzkar(
          arabic: "المؤمن",
          transliteration: "Al-Mu'min",
          meaning: "The Infuser of Faith"),
      PresetAzkar(
          arabic: "المهيمن",
          transliteration: "Al-Muhaymin",
          meaning: "The Preserver of Safety"),
      PresetAzkar(
          arabic: "العزيز",
          transliteration: "Al-Aziz",
          meaning: "The Almighty"),
      PresetAzkar(
          arabic: "الجبار",
          transliteration: "Al-Jabbar",
          meaning: "The Compeller"),
      PresetAzkar(
          arabic: "المتكبر",
          transliteration: "Al-Mutakabbir",
          meaning: "The Supreme"),
      PresetAzkar(
          arabic: "الخالق",
          transliteration: "Al-Khaliq",
          meaning: "The Creator"),
      PresetAzkar(
          arabic: "البارئ",
          transliteration: "Al-Bari'",
          meaning: "The Evolver"),
      PresetAzkar(
          arabic: "المصور",
          transliteration: "Al-Musawwir",
          meaning: "The Fashioner"),
      PresetAzkar(
          arabic: "الغفار",
          transliteration: "Al-Ghaffar",
          meaning: "The Constant Forgiver"),
      PresetAzkar(
          arabic: "القهار",
          transliteration: "Al-Qahhar",
          meaning: "The All-Prevailing One"),
      PresetAzkar(
          arabic: "الوهاب",
          transliteration: "Al-Wahhab",
          meaning: "The Supreme Bestower"),
      PresetAzkar(
          arabic: "الرزاق",
          transliteration: "Ar-Razzaq",
          meaning: "The Provider"),
      PresetAzkar(
          arabic: "الفتاح",
          transliteration: "Al-Fattah",
          meaning: "The Opener"),
      PresetAzkar(
          arabic: "العليم",
          transliteration: "Al-Alim",
          meaning: "The All-Knowing"),
      PresetAzkar(
          arabic: "القابض",
          transliteration: "Al-Qabid",
          meaning: "The Withholder"),
      PresetAzkar(
          arabic: "الباسط",
          transliteration: "Al-Basit",
          meaning: "The Extender"),
      PresetAzkar(
          arabic: "الخافض",
          transliteration: "Al-Khafid",
          meaning: "The Reducer"),
      PresetAzkar(
          arabic: "الرافع",
          transliteration: "Ar-Rafi'",
          meaning: "The Exalter"),
      PresetAzkar(
          arabic: "المعز",
          transliteration: "Al-Mu'izz",
          meaning: "The Honourer"),
      PresetAzkar(
          arabic: "المذل",
          transliteration: "Al-Mudhill",
          meaning: "The Dishonourer"),
      PresetAzkar(
          arabic: "السميع",
          transliteration: "As-Sami'",
          meaning: "The All-Hearing"),
      PresetAzkar(
          arabic: "البصير",
          transliteration: "Al-Basir",
          meaning: "The All-Seeing"),
      PresetAzkar(
          arabic: "الحكم",
          transliteration: "Al-Hakam",
          meaning: "The Impartial Judge"),
      PresetAzkar(
          arabic: "العدل",
          transliteration: "Al-'Adl",
          meaning: "The Utterly Just"),
      PresetAzkar(
          arabic: "اللطيف",
          transliteration: "Al-Latif",
          meaning: "The Subtle One"),
      PresetAzkar(
          arabic: "الخبير",
          transliteration: "Al  -Khabir",
          meaning: "The All-Aware"),
      PresetAzkar(
          arabic: "الحليم",
          transliteration: "Al-Halim",
          meaning: "The Forbearing"),
      PresetAzkar(
          arabic: "العظيم",
          transliteration: "Al-Azim",
          meaning: "The Magnificent"),
      PresetAzkar(
          arabic: "الغفور",
          transliteration: "Al-Ghafur",
          meaning: "The Great Forgiver"),
      PresetAzkar(
          arabic: "الشكور",
          transliteration: "Ash-Shakur",
          meaning: "The Most Appreciative"),
      PresetAzkar(
          arabic: "العلي", transliteration: "Al-Ali", meaning: "The Most High"),
      PresetAzkar(
          arabic: "الكبير",
          transliteration: "Al-Kabir",
          meaning: "The Most Great"),
      PresetAzkar(
          arabic: "الحفيظ",
          transliteration: "Al-Hafiz",
          meaning: "The Preserver"),
      PresetAzkar(
          arabic: "المقيت",
          transliteration: "Al-Muqit",
          meaning: "The Sustainer"),
      PresetAzkar(
          arabic: "الحسيب",
          transliteration: "Al-Hasib",
          meaning: "The Reckoner"),
      PresetAzkar(
          arabic: "الجليل",
          transliteration: "Al-Jalil",
          meaning: "The Majestic"),
      PresetAzkar(
          arabic: "الكريم",
          transliteration: "Al-Karim",
          meaning: "The Generous"),
      PresetAzkar(
          arabic: "الرقيب",
          transliteration: "Ar-Raqib",
          meaning: "The Watchful"),
      PresetAzkar(
          arabic: "المجيب",
          transliteration: "Al-Mujib",
          meaning: "The Responsive One"),
      PresetAzkar(
          arabic: "الواسع",
          transliteration: "Al-Wasi'",
          meaning: "The All-Encompassing, the Boundless"),
      PresetAzkar(
          arabic: "الحكيم",
          transliteration: "Al-Hakim",
          meaning: "The All-Wise"),
      PresetAzkar(
          arabic: "الودود",
          transliteration: "Al-Wadud",
          meaning: "The Most Loving"),
      PresetAzkar(
          arabic: "المجيد",
          transliteration: "Al-Majid",
          meaning: "The Glorious"),
      PresetAzkar(
          arabic: "الباعث",
          transliteration: "Al-Ba'ith",
          meaning: "The Resurrector"),
      PresetAzkar(
          arabic: "الشهيد",
          transliteration: "Ash-Shahid",
          meaning: "The All Observing Witnessing"),
      PresetAzkar(
          arabic: "الحق",
          transliteration: "Al-Haqq",
          meaning: "The Absolute Truth"),
      PresetAzkar(
          arabic: "الوكيل",
          transliteration: "Al-Wakil",
          meaning: "The Trustee, the Disposer of Affairs"),
      PresetAzkar(
          arabic: "القوي",
          transliteration: "Al-Qawiyy",
          meaning: "The All-Strong"),
      PresetAzkar(
          arabic: "المتين",
          transliteration: "Al-Matin",
          meaning: "The Firm, the Steadfast"),
      PresetAzkar(
          arabic: "الولي",
          transliteration: "Al-Wali",
          meaning: "The Protecting Associate"),
      PresetAzkar(
          arabic: "الحميد",
          transliteration: "Al-Hamid",
          meaning: "The Praiseworthy"),
      PresetAzkar(
          arabic: "المحصي",
          transliteration: "Al-Muhsi",
          meaning: "The All Enumerating, the Counter"),
      PresetAzkar(
          arabic: "المبدئ",
          transliteration: "Al-Mubdi'",
          meaning: "The Originator, the Initiator"),
      PresetAzkar(
          arabic: "المعيد",
          transliteration: "Al-Mu'id",
          meaning: "The Restorer, the Reinstater"),
      PresetAzkar(
          arabic: "المحيي",
          transliteration: "Al-Muhyi",
          meaning: "The Giver of Life"),
      PresetAzkar(
          arabic: "المميت",
          transliteration: "Al-Mumit",
          meaning: "The Creator of Death"),
      PresetAzkar(
          arabic: "الحي",
          transliteration: "Al-Hayy",
          meaning: "The Ever-Living"),
      PresetAzkar(
          arabic: "القيوم",
          transliteration: "Al-Qayyum",
          meaning: "The Sustainer, the Self-Subsisting"),
      PresetAzkar(
          arabic: "الواجد",
          transliteration: "Al-Wajid",
          meaning: "The Perceiver"),
      PresetAzkar(
          arabic: "الماجد",
          transliteration: "Al-Majid",
          meaning: "The Illustrious, the Magnificent"),
      PresetAzkar(
          arabic: "الواحِد", transliteration: "Al-Wahid", meaning: "The One"),
      PresetAzkar(
          arabic: "الاحد",
          transliteration: "Al-Ahad",
          meaning: "The Unique, the Only One"),
      PresetAzkar(
          arabic: "الصمد",
          transliteration: "As-Samad",
          meaning: "The Eternal, Satisfier of Needs"),
      PresetAzkar(
          arabic: "القادر",
          transliteration: "Al-Qadir",
          meaning: "The Omnipotent"),
      PresetAzkar(
          arabic: "المقتدر",
          transliteration: "Al-Muqtadir",
          meaning: "The Powerful"),
      PresetAzkar(
          arabic: "المقدم",
          transliteration: "Al-Muqaddim",
          meaning: "The Expediter, the Promoter"),
      PresetAzkar(
          arabic: "المؤخر",
          transliteration: "Al-Mu'akhkhir",
          meaning: "The Delayer"),
      PresetAzkar(
          arabic: "الأول", transliteration: "Al-Awwal", meaning: "The First"),
      PresetAzkar(
          arabic: "الأخر", transliteration: "Al-Akhir", meaning: "The Last"),
      PresetAzkar(
          arabic: "الظاهر",
          transliteration: "Az-Zahir",
          meaning: "The Manifest"),
      PresetAzkar(
          arabic: "الباطن", transliteration: "Al-Batin", meaning: "The Hidden"),
      PresetAzkar(
          arabic: "الوالي",
          transliteration: "Al-Wali",
          meaning: "The Sole Governor"),
      PresetAzkar(
          arabic: "المتعال",
          transliteration: "Al-Muta'ali",
          meaning: "The Self Exalted"),
      PresetAzkar(
          arabic: "البر",
          transliteration: "Al-Barr",
          meaning: "The Source of All Goodness"),
      PresetAzkar(
          arabic: "التواب",
          transliteration: "At-T-Tawwab",
          meaning: "The Ever-Pardoning"),
      PresetAzkar(
          arabic: "المنتقم",
          transliteration: "Al-Muntaqim",
          meaning: "The Avenger"),
      PresetAzkar(
          arabic: "العفو",
          transliteration: "Al-'Afuw",
          meaning: "The Pardoner"),
      PresetAzkar(
          arabic: "الرؤوف",
          transliteration: "Ar-Ra'uf",
          meaning: "The Most Kind"),
      PresetAzkar(
          arabic: "مالك الملك",
          transliteration: "Malik-ul-Mulk",
          meaning: "Master of the Kingdom, Owner of the Dominion"),
      PresetAzkar(
          arabic: "الذوالجلال والاكرام",
          transliteration: "Dhul-Jalali wal-Ikram",
          meaning: "Lord of Glory and Honour, Lord of Majesty and Generosity"),
      PresetAzkar(
          arabic: "المقسط",
          transliteration: "Al-Muqsit",
          meaning: "The Just One"),
      PresetAzkar(
          arabic: "الجامع",
          transliteration: "Al-Jami'",
          meaning: "The Gatherer, the Uniter"),
      PresetAzkar(
          arabic: "الغني",
          transliteration: "Al-Ghani",
          meaning: "The Self-Sufficient, The Wealthy"),
      PresetAzkar(
          arabic: "المغني",
          transliteration: "Al-Mughni",
          meaning: "The Enricher"),
      PresetAzkar(
          arabic: "المانع",
          transliteration: "Al-Mani'",
          meaning: "The Withholder"),
      PresetAzkar(
          arabic: "الضار",
          transliteration: "Ad-Dhar",
          meaning: "The Distresser"),
      PresetAzkar(
          arabic: "النافع",
          transliteration: "An-Nafi'",
          meaning: "The Propitious"),
      PresetAzkar(
          arabic: "النور", transliteration: "An-Nur", meaning: "The Light"),
      PresetAzkar(
          arabic: "الهادي", transliteration: "Al-Hadi", meaning: "The Guide"),
      PresetAzkar(
          arabic: "البديع",
          transliteration: "Al-Badi'",
          meaning: "The Incomparable, the Originator"),
      PresetAzkar(
          arabic: "الباقي",
          transliteration: "Al-Baqi",
          meaning: "The Ever-Surviving, the Everlasting"),
      PresetAzkar(
          arabic: "الوارث",
          transliteration: "Al-Warith",
          meaning: "The Inheritor, the Heir"),
      PresetAzkar(
          arabic: "الرشيد",
          transliteration: "Ar-Rashid",
          meaning: "The Guide to the Right Path"),
      PresetAzkar(
          arabic: "الصبور",
          transliteration: "As-Sabur",
          meaning: "The Patient"),
    ],
  ),
  PresetCategory(
    name: "Istighfar (Forgiveness)",
    description: "Seeking forgiveness from Allah.",
    azkarList: [
      PresetAzkar(
          arabic: "أَسْتَغْفِرُ ٱللَّٰه",
          transliteration: "Astaghfirullah",
          meaning: "I seek forgiveness from Allah.",
          targetCount: 100),
      PresetAzkar(
          arabic: "أسْتَغْفِرُ اللَّهَ وَ أتُوبُ إلَيْهِ",
          transliteration: "Astaghfirullaha wa atubu ilayh",
          meaning: "I seek forgiveness from Allah and I repent to Him.",
          targetCount: 100),
      PresetAzkar(
          arabic: "أَسْتَغْفِرُ ٱللَّٰهَ رَبِّي وَأَتُوبُ إِلَيْهِ",
          transliteration: "Astaghfirullaha Rabbi wa atubu ilayh",
          meaning:
              "I seek forgiveness from Allah, my Lord, and I repent to Him.",
          targetCount: 100),
      PresetAzkar(
          arabic:
              "رَبَّنَا ظَلَمْنَا أَنفُسَنَا وَإنْ لَمْ تَغْفِرْلَنَا وَتَرْحَمْنَا لَنَكُونَنَّ مِنَ الخَاسِرِينَ",
          transliteration:
              "Rabbana zalamna anfusana wa il lam taghfir lana wa tarhamna la nakunanna minal-khasirin.",
          meaning:
              "Our Lord, we have wronged ourselves, and if You do not forgive us and have mercy upon us, we will surely be among the losers.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "رَبَّنَآ إِنَّنَآ ءَامَنَّافَٱغْفِرْ لَنَا ذُنُوبَنَا وَقِنَا عَذَابَ ٱلنَّارِ",
          transliteration:
              "Rabbana innana amanna faghfir lana dhunubana waqina 'adhaban-nar.",
          meaning:
              "Our Lord, indeed we have believed, so forgive us our sins and protect us from the punishment of the Fire.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ",
          transliteration:
              "Rabbanaghfirli waliwalidayya wa lil-mu'minina yawma yaqumul-hisab.",
          meaning:
              "Our Lord, forgive me and my parents and the believers the Day the account is established.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ اغْفِرْ لِي مَا قَدَّمْتُ وَمَا أَخَّرْتُ، وَمَا أَسْرَرْتُ وَمَا أَعْلَنْتُ وَمَا أَنْتَ أَعْلَمُ بِهِ مِنِّي، أَنْتَ المُقَدِّمُ وَأَنْتَ المُؤَخِّرُ وَأَنْتَ عَلَى كُلِّ شَيْءٍ قَدِير",
          transliteration:
              "Allahummaghfirli ma qaddamtu wa ma akhkhartu, wa ma asrartu wa ma a'lantu, wa ma Anta a'lamu bihi minni. Antal-Muqaddimu wa Antal-Mu'akhkhiru, wa Anta 'ala kulli shay'in Qadir.",
          meaning:
              "O Allah, forgive me for what I have sent forth and what I have left behind, what I have concealed and what I have declared, and what You are more knowledgeable of than I. You are the One Who brings forward, and You are the One Who brings back, and You are over all things competent.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "رَبَّنَا فَاغْفِرْ لَنَا ذُنُوبَنَا وَكَفِّرْ عَنَّا سَيِّئَاتِنَا وَتَوَفَّنَا مَعَ الأَبْرَارِ",
          transliteration:
              "Rabbana faghfir lana dhunubana wa kaffir 'anna sayyi'atina wa tawaffana ma'al-abrar.",
          meaning:
              "Our Lord, so forgive us our sins and remove from us our misdeeds and cause us to die with the righteous.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "لَّآ إِلَـٰهَ إِلَّآ أَنتَ سُبْحَـٰنَكَ إِنِّى كُنتُ مِنَ ٱلظَّـٰلِمِينَ",
          transliteration:
              "La ilaha illa Anta, Subhanaka, inni kuntu minadh-dhalimin.",
          meaning:
              "There is no deity except You; exalted are You. Indeed, I have been of the wrongdoers.",
          targetCount: 100),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ أَنْتَ رَبِّي، لاَ إِلَهَ إِلاَّ أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَىَّ وَأَبُوءُ لَكَ بِذَنْبِي، فَاغْفِرْ لِي، فَإِنَّهُ لاَ يَغْفِرُ الذُّنُوبَ إِلاَّ أَنْتَ",
          transliteration:
              "Allahumma Anta Rabbi la ilaha illa Anta, khalaqtani wa ana 'abduka, wa ana 'ala 'ahdika wa wa'dika mas-tata'tu. A'udhu bika min sharri ma sana'tu, abu'u laka bini'matika 'alayya, wa abu'u laka bidhanbi faghfirli, fa innahu la yaghfirudh-dhunuba illa Anta.",
          meaning:
              "O Allah, You are my Lord, none has the right to be worshipped except You. You created me and I am Your servant, and I abide by Your covenant and promise as best I can. I seek refuge in You from the evil of what I have done. I acknowledge Your favor upon me and I acknowledge my sin, so forgive me, for verily none can forgive sins except You.",
          targetCount: 1),
      PresetAzkar(
          arabic: "اللَّهُمَّ إِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي",
          transliteration:
              "Allahumma innaka 'afuwwun tuhibbul-'afwa fa'fu 'anni.",
          meaning:
              "O Allah, You are Pardoning, You love to pardon, so pardon me.",
          targetCount: 100),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ اغْفِرْ لِي ذَنْبِي كُلَّهُ، دِقَّهُ وَجِلَّهُ، وَأَوَّلَهُ وَآخِرَهُ وَعَلَانِيَتَهُ وَسِرَّهُ",
          transliteration:
              "Allahummaghfirli dhanbi kullah, diqqahu wa jillah, wa awwalahu wa akhirah, wa 'alaniyatahu wa sirrah.",
          meaning:
              "O Allah, forgive me all my sins, great and small, the first and the last, the open and the secret.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ إنِّي أسْألُكَ يَا اللَّهُ بِأنَّكَ الْوَاحِدُّ الأحَدُ الصَّمَدُ الَّذِي لَمْيَلِدْ وَ لَمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفُواً أحَدٌ، أنْ تَغْفِرَ لِي ذُنُوبِي إنَّكَ أنْتَ الْغَفُورُ الَّرحِيمُ",
          transliteration:
              "Allahumma inni as'aluka ya Allahu bi-annakal-Wahidul-Ahadus-Samadul-ladhi lam yalid wa lam yulad, wa lam yakun lahu kufuwan ahad, an taghfira li dhunubi, innaka Antal-Ghafurur-Rahim.",
          meaning:
              "O Allah, I ask You, O Allah, You are the One, the Only, the Self-Sufficient Master, Who was not born and begets not, and none is equal to Him. Forgive me my sins, You are the Forgiving, the Merciful.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ اِنّى اسْتَغْفِرُكَ لِذَنْبِى وَ اسْئَلُكَ رَحْمَتَكَ",
          transliteration:
              "Allahumma inni astaghfiruka li-dhanbi wa as'aluka rahmatak.",
          meaning:
              "O Allah, I ask forgiveness for my sins and I ask for Your mercy.",
          targetCount: 7),
      PresetAzkar(
          arabic: "اللَّهُمَّ اغْفِرْلِى خَطَايَاىَ وَ ذُنُوْبِى كُلِّهَا",
          transliteration: "Allahummaghfirli khatayaya wa dhunubi kullaha.",
          meaning: "O Allah, forgive me all my mistakes and sins.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "أسْتَغْفِرُ اللّهَ الْعَظِيمَ الَّذِي لا إلَهَ إلَّا هُوَ الْحَيُّ الْقَيُّومُ، غَفَّارُ الذُّنُّوبِ ذُو الْجَلاَلِ وَالإِكْرَامِ، وَ أتُوبُ إَيْهِ مِنْ جَمِيعِ الْمَعَاصِي وَ الذُّنوبِ وَ الآثامِ، وَ مِنْ كُلِّ ذَنْبٍ أذْنَبْتُهُ عَمْدًا وَ خَطَأً، ظَاهِرًا وَبَاطِنًا، قَوْلًا وَفِعْلًا، فِى جَمِيع حَرَكَاتِي وَسَكَاتِي وَخَطَرَاتِي وأنْفَاسِي كُلِّهَا دَائِمًا أبَدًا سَرْمَدًا، مِنَ الذَّنْبِ الَّذِي أعْلَمُ، وَ مِنَ الذَّنْبِ الَّذِي لا أعْلَمُ، عَدَدَ مَا أحَاطَ بِهِ الْعِلْمُ وَ أحْصَاهُ الْكِتَابُ وَ خَطَّهُ الْقَلَمُ، وَ عَدَدَ مَا أوْ جَدَتْهُ الْقُدْرَةُ وَ خَصَّصَتْهُ الإرَادَةُ، وَمِدَادَ كَلِمَاتِ اللّهِ، وَ كَمَا يَنْبَغِي لِجَلالِ وَجْهِ رَبِّنَا وَ جَمَالِهِ وَ كَمَالِهِ، وَ كَمَا يُحِبُّ رَبِّنَا وَ يَرْضَى",
          transliteration:
              "Astaghfirullaha al-azeem allazi la ilaha illa huwa al-hayyul-qayyoom, ghaffaru adh-dhunoob, dhul-jalali wal-ikram, wa atoobu ilayh min jamee’il maasi wadh-dhunoobi wal-aatham, wa min kulli dhanbin adhnabtuhu amdan wa khata’an, zahiran wa batinan, qawlan wa fi’lan, fi jamee’i harakati wa sakatati wa khatarati wa anfaasi kulliha daiman abadan sarmadan, minal dhanbi allazi a’lam, wa minal dhanbi allazi la a’lam, ‘adada ma ahata bihil-ilm wa ahsahul-kitab wa khattahul-qalam, wa ‘adada ma awjadatahul-qudratu wa khassasat-hul-iradah, wa midaada kalimatillah, wa kama yanbaghi lijalali wajhi rabbina wa jamalihi wa kamalihi, wa kama yuhibbu rabbuna wa yardha.",
          meaning:
              "I seek forgiveness from Allah the Mighty, Whom there is none worthy of worship except Him, the Living, the Eternal, the Forgiver of sins, the Possessor of majesty and honor. And I repent to Him from all disobedience, sins, and misdeeds, and from every sin I have committed intentionally or by mistake, openly or secretly, in word or deed, in all my movements, my rests, my thoughts, and my breaths, always, forever, and eternally. From the sin which I know and from the sin which I do not know, to the number of what is encompassed by knowledge, enumerated by the Book, and written by the Pen, and to the number of what is brought into existence by power and specified by will, and the ink of Allah's words, and as befits the majesty of our Lord's Countenance, His beauty, and His perfection, and as our Lord loves and is pleased.",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "اَللّهُمَّ إِنِّيْ أَسْتَغْفِرُكَ لِكُلِّ ذَنْبٍ لِّيْ وَأَسْأَلُكَ أَنْ تَغْفِرَ لِيْ مَا أَحْصَيْتَ عَلَيَّ مِنْ مَّظَالِمِ الْعِبَادِ قِبَلِيْ فَإِنَّ لِعِبَادِكَ عَلَيَّ حُقُوْقًا وَّمَظَالِمَ وأَنَا بِهَا مُرْتَهِنٌ اَللّهُمَّ وَإِنْ كَانَتْ كَثِيْرَةً فَإِنَّهَا فِيْ جَنْبِ عَفْوِكَ يَسِيْرَةٌ اللّهُمَّ أَيُّمَا عَبْدٍ مِّنْ عِبَادِكَ أَوْ أَمَةٍ مِّنْ إِمَائِكَ كَانَتْ لَهُ مَظْلِمَةٌ عِنْدِيْ قَدْ غَصَبْتُهُ عَلَيْهَا فِيْ أَرْضِها أَوْ مَالِها أَوْ عِرْضِها أَوْ بَدَنِها أَوْ غَابَ أَوْ حَضَرَ هُوَ أَوْ خَصْمُهُ يُطَالِبُنِيْ بِهَا وَلَمْ أَسْتَطِعْ أَنْ أَرُدَّهَا إِلَيْهِ وَلَمْ أَسْتَحْلِلْهَا مِنْهُ فَأَسْأَلُكَ بِكَرَمِكَ وَجُوْدِكَ وَسِعَةِ مَا عِنْدَكَ أَنْ تُرْضِيَهُمْ عَنِّيْ وَلاَ تَجْعَلْ لَّهُمْ عَلَيَّ شَيْئًا مُّنَقِّصَةً مِّنْ حَسَنَاتِيْ فَإِنَّ عِنْدَكَ مَا يُرْضِيْهِمْ عَنِّيْ وَلَيْسَ عِنْدِيْ مَا يُرْضِيْهِمْ وَلاَ تَجْعَلْ يَوْمَ الْقِيَامَةِ لِسَيِّئَاتِهِمْ عَلىٰ حَسَنَاتِيْ سَبِيْلاً.",
          transliteration:
              "Allahumma inni astaghfiruka likulli dhanbin li wa asaluka an taghfira li ma ahsayta alayya min mazalimi al-ibadi qibali fa’inna li’ibadika alayya huquqan wa mazalima wa ana biha murtahin. Allahumma wa in kanat kathirah fa’innaha fi janbi ‘afwika yasirah. Allahumma ayyuma abdin min ibadika aw amatim min ima’ika kanat lahu mazlimatun ‘indi qad ghasabtuhu alayha fi ardihi aw malihi aw ‘irdihi aw badanihi aw ghaba aw hadara huwa aw khasmuhu yutalibuni biha walam astati‘ an uruddaha ilayh walam astahillha minhu fa asaluka bikaramika wa joodika wa si‘ati ma ‘indaka an turdiyahum ‘anni wa la taj‘al lahum alayya shay’an munaqqisan min hasanati. Fa’inna ‘indaka ma yurdihim ‘anni wa laysa ‘indi ma yurdihim wa la taj‘al yawma al-qiyamah li sayyi’atihim ‘ala hasanati sabila.",
          meaning:
              "O Allah, I seek Your forgiveness for every sin of mine and I ask You to forgive me for the injustices I have done to Your servants that You have recorded against me. For Your servants have rights and grievances against me, and I am held hostage by them. O Allah, even if they are many, they are small next to Your pardon. O Allah, whichever male servant from Your servants or female servant from Your female servants has a grievance against me, which I have wrongfully taken from them concerning their land, their wealth, their honor, or their body, whether they are absent or present, they or their adversary demand it from me, and I have not been able to return it to them nor have I been able to seek their pardon for it. So I ask You by Your generosity, Your munificence, and the vastness of what You have, to satisfy them on my behalf, and not to let them have anything against me that would diminish my good deeds. For You have what will satisfy them on my behalf, and I do not have what will satisfy them. And do not make a way for their evil deeds to overcome my good deeds on the Day of Resurrection.",
          targetCount: 3),
    ],
  ),
  PresetCategory(
    name: "Protection (Hifazat)",
    description: "Duas for protection from evil, sickness, and harm.",
    azkarList: [
      PresetAzkar(
          arabic:
              "رَّبِّ أَعُوذُ بِكَ مِنْ هَمَزَاتِ الشَّيَاطِينِ وَأَعُوذُ بِكَ رَبِّ أَن يَحْضُرُونِ",
          transliteration:
              "Rabbi ‘a`outhubika min hamazaatish-shayaateeni, wa ‘a`outhu bika rabbi ‘ay-yahdhuroon.",
          meaning:
              "My Lord! I seek refuge with You from the whisperings (suggestions) of the Shayatin (devils). And I seek refuge with You, My Lord! lest they may attend (or come near) me.",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ احْفَظْنِي مِنْ بَينِ يَدَيَّ, وَمِنْ خَلْفِي, وَعَنْ يَمِينِي, وَعَنْ شِمَالِي وَمِنْ فَوْقِي, وَأَعُوذُ بِعَظَمَتِكَ أَن أُغْتَالَ مِنْ تَحْتِي",
          transliteration:
              "Allah humma‘h fathny min bayne yaday wa min khalfi, wa‘an yameeny wa ‘an shimaly, wa min fawqi, wa a’uthu bi ‘athamatika an ughtaala min tahty.",
          meaning:
              "O Allah protect me from my front, behind me, from my right and my left, and from above me, and I seek refuge in Your Magnificence from being taken unaware from beneath me.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْبَرَصِ، وَالْجُنُونِ، وَالْجُذَامِ، وَمِنْ سَيِّئِ الأَسْقَامِ",
          transliteration:
              "Allah humma inni a’udhu bika minal-barasi, wal-jununi, wal-judhaami, wa min sayyi’il-asqaami",
          meaning:
              "O Allah, I seek refuge in You from leprosy, insanity, elephantiasis, and the worst of diseases.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ ربَّ النَّاسِ ، أَذْهِب الْبَأسَ ، واشْفِ ، أَنْتَ الشَّافي لا شِفَاءَ إِلاَّ شِفَاؤُكَ ، شِفاءً لا يُغَادِرُ سقَماً",
          transliteration:
              "Allah humma Rabban-naas, adhhibil-ba’s, washfi antash-Shaafi laa shifaa’a illaa shifaa’uka shifaa’an laa yughaadiru saqamaa",
          meaning:
              "O Allah, Lord of mankind, do away with my suffering. Heal (me) as You are the only Healer and there is no cure except that of Yours, it is that which leaves no ailment behind.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ",
          transliteration:
              "Bismillahil-lazi la yadhurru ma’asmiHi syai’un fil ardhi wa la fis-sama’i wa Huwas-Sami’ul 'Aleem",
          meaning:
              "In the Name of Allah with Whose Name there is protection against every kind of harm in the earth or in heaven, and He is All-Hearing and All-Knowing",
          targetCount: 3),
      PresetAzkar(
          arabic: "أَعُوذُ بِكلِمَاتِ الله التّامّاتِ مِن شَرّ مَا خَلَقَ",
          transliteration:
              "A’uzu bikalimatillahit-tammaati min syarri ma kholak",
          meaning:
              "I seek protection in the perfect words of Allah from every evil that has been created",
          targetCount: 3),
    ],
  ),
  PresetCategory(
    name: "Healing & Relief (Shifa)",
    description:
        "Duas for seeking well-being, health, and relief from distress.",
    azkarList: [
      PresetAzkar(
          arabic: "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ - الرَّحْمَٰنِ الرَّحِيمِ - مَالِكِ يَوْمِ الدِّينِ - إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ - اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ - صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ",
          transliteration: "Alhamdu lillaahi Rabbil ‘aalameen, Ar-Rahmaanir-Raheem, Maaliki Yawmid-Deen, Iyyaaka na’budu wa lyyaaka nasta’een, Ihdinas-Siraatal-Mustaqeem, Siraatal-lazeena an’amta ‘alaihim ghayril-maghdoobi ‘alaihim wa lad-daaalleen",
          meaning:
              "The Opening. In the name of Allah, the Entirely Merciful, the Especially Merciful...",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "قُلْ هُوَ ٱللَّهُ أَحَدٌ ١ ٱللَّهُ ٱلصَّمَدُ ٢ لَمْ يَلِدْ وَلَمْ يُولَدْ ٣ وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ ٤",
          transliteration:
              "Qul huwa Allahu ahad, Allahu assamad, lam yalid walam yoolad, walam yakun lahu kufuwan ahad",
          meaning:
              "Say, ˹O Prophet,˺ “He is Allah—One ˹and Indivisible˺; Allah—the Sustainer ˹needed by all˺. He has never had offspring, nor was He born. And there is none comparable to Him.”",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ ١ مِن شَرِّ مَا خَلَقَ ٢ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ٣ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ ٤",
          transliteration:
              "Qul a'udhu birabbi al-falaq, min sharri ma khalaq, wa min sharri ghasiqin idha waqab, wa min sharri hasidin idha hasad",
          meaning:
              "Say, ˹O Prophet,˺ I seek refuge with the Lord of daybreak from the evil of what He has created, and from the evil of the night when it grows dark, and from the evil of those ˹witches casting spells by˺ blowing onto knots, and from the evil of an envier when they envy.",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ ١ مَلِكِ ٱلنَّاسِ ٢ إِلَٰهِ ٱلنَّاسِ ٣ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ٤ الَّذِي يُوَسْوِسُ فِي صُدُورِ ٱلنَّاسِ ٥ مِنَ الْجِنَّةِ وَالنَّاسِ ٦",
          transliteration:
              "Qul a'udhu birabbi an-nas, Maliki an-nas, Ilahi an-nas, min sharri al-waswasil khannas, alladhi yuwaswisu fee sudoorin-nas, min al-jinnati wan-nas",
          meaning:
              "Say, ˹O Prophet,˺ I seek refuge with the Lord of mankind, the King of mankind, the God of mankind, from the evil of the whisperer who withdraws, who whispers in the breasts of mankind, from among jinn and mankind.",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "اللّهُـمَّ عافِـني في بَدَنـي ، اللّهُـمَّ عافِـني في سَمْـعي ، اللّهُـمَّ عافِـني في بَصَـري ، لا إلهَ إلاّ أَنْـتَ",
          transliteration: "Allahumma ‘Aafinee fee badani, Allahumma ‘Aafinee fee sam’ee, Allahumma ‘Aafinee fee basari, La ilaha illa Anta.",
          meaning:
              "O Allah, make me healthy in my body. O Allah, preserve for me my hearing. O Allah, preserve for me my sight. There is none worthy of worship but You.",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ رَبَّ النَّاسِ أَذْهِبِ الْبَأْسَ وَاشْفِ أَنْتَ الشَّافِي لَا شِفَاءَ إِلَّا شِفَاؤُكَ شِفَاءٌ لَا يُغَادِرُ سَقَمَا",
          transliteration: "Allahumma Rabban-naas adhhibil-ba’sa washfi Antash-Shaafi laa shifaa’a illaa shifaa’uk shifaa’an laa yughaadiru saqamaa.",
          meaning:
              "O Allah, the Lord of mankind, remove the difficulty and bring about healing as You are the Healer. There is no healing except Your healing, a healing that will leave no ailment.",
          targetCount: 7),
      PresetAzkar(
          arabic: "لَا بَأْسَ طَهُورٌ إِنْ شَاءَ اللَّهُ",
          transliteration: "La ba’sa tahurun insha’Allah ",
          meaning:
              "No harm, (it will be a) purification (from sins), if Allah wills.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "أَعُوذُ بِعِزَّةِ اللَّهِ وَقُدْرَتِهِ مِنْ شَرِّ مَا أَجِدُ وَأُحَاذِرُ",
          transliteration:
              "A’udhu bi’izzatillahi wa qudratihi min sharri ma ajidu wa uhaadhiru.",
          meaning:
              "I seek refuge in Allah’s Might and Power from the evil of what I feel and fear.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "رَبِّ إِنِّي مَسَّنِيَ الضُّرُّ وَأَنْتَ أَرْحَمُ الرَّاحِمِينَ",
          transliteration:
              "Rabbi inni massaniyad-durru wa anta arhamur-raahimeen.",
          meaning:
              "O my Lord, indeed adversity has touched me, and You are the Most Merciful of the merciful.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ",
          transliteration: "Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina ‘adhaban-nar.",
          meaning:
              "Our Lord, give us good in this world and good in the Hereafter, and save us from the punishment of the Fire.",
          targetCount: 7),
      PresetAzkar(
          arabic:
              "رَبَّنَا اللَّهُ الَّذِي فِي السَّمَاءِ تَقَدَّسَ اسْمُكَ أَمْرُكَ فِي السَّمَاءِ وَالْأَرْضِ كَمَا رَحْمَتُكَ فِي السَّمَاءِ اجْعَلْ رَحْمَتَكَ فِي الْأَرْضِ اغْفِرْ لَنَا حَوْبَنَا وَخَطايانا أَنْت رَبُّ الطَّيِّبِينَ أَنْزِلْ رُحْمَةً مِن رُحْمَتِكَ وَشِفَاءً مِن شِفائِكَ عَلَى هذَا الْوَعك",
          transliteration: "Rabbana Allahu allathee fissama’i taqaddasa ismuka amruka fissama’i wal-ard kama rahmatuka fissama’i aj’al rahmataka fil-ard. Ighfir lana houbana wa khatayaana anta rabbul tayyibeen anzil rahmatan min rahmatika wa shifaan min shifa’ika ‘ala hadha al-waj’i.",
          meaning:
              "Our Lord Allah Who is in heaven, holy is Your name. Your command reigns supreme in heaven and on earth; as Your mercy is in heaven, make Your mercy on earth; forgive us our sins and our errors; You are the Lord of good men; send down mercy from Your mercy, and remedy from Your remedy on this pain so that it is healed.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "اللهم إني أعوذ بك من زوال نعمتك وتحول عافيتك وفجاءة نقمتك وجميع سخطك",
          transliteration: "Allahumma inni a’udhu bika min zawali ni’matika wa tahawwuli ‘afiyatika wa fujaa’ati niqmatika wa jami’i sakhatika.",
          meaning:
              "O Allah, I seek refuge in You from the loss of Your blessings, from a change in my well-being, from Your sudden punishment, and from all forms of Your displeasure.",
          targetCount: 3),
    ],
  ),
  PresetCategory(
    name: "Darood (Salutations on the Prophet)",
    description: "Sending blessings upon the Prophet Muhammad (ﷺ).",
    azkarList: [
      PresetAzkar(
          arabic: "صَلَّى اللهُ عَلَيْهِ وَسَلَّمَ",
          transliteration: "Sallallahu 'alaihi wa sallam",
          meaning: "May the peace and blessings of Allah be upon him.",
          targetCount: 100),
      PresetAzkar(
          arabic: "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ",
          transliteration:
              "Allahumma salli 'ala Muhammadin wa 'ala ali Muhammad",
          meaning:
              "O Allah, send your grace, honour and mercy on Muhammad and on the family of Muhammad.",
          targetCount: 100),
      PresetAzkar(
          arabic: "اللَّهُمَّ صَلِّ وَ سَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ",
          transliteration: "Allahumma salli wa sallim 'ala nabiyyina Muhammad",
          meaning:
              "O Allah, send your grace and peace upon our Prophet Muhammad.",
          targetCount: 100),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ، وَعَلَى آلِ مُحَمَّدٍ، كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ، وَعَلَى آلِ مُحَمَّدٍ، كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ، وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ",
          transliteration:
              "Allahumma salli 'ala Muhammadin wa 'ala ali Muhammadin, kama sallayta 'ala Ibrahima wa 'ala ali Ibrahima, innaka Hamidum Majid. Allahumma barik 'ala Muhammadin wa 'ala ali Muhammadin, kama barakta 'ala Ibrahima wa 'ala ali Ibrahima, innaka Hamidum Majid.",
          meaning:
              "O Allah, send Your grace, honor and mercy on Muhammad and on the family of Muhammad, as You sent Your grace, honor and mercy on Ibrahim and on the family of Ibrahim. Verily, You are Most Praiseworthy, Most Glorious. O Allah, send Your blessings on Muhammad and on the family of Muhammad, as You sent Your blessings on Ibrahim and on the family of Ibrahim. Verily, You are Most Praiseworthy, Most Glorious.",
          targetCount: 11),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى أَزْوَاجِهِ وَذُرِّيَّتِهِ كَمَا صَلَّيْتَ عَلَى آلِ إِبْرَاهِيمَ وَبَارِكْ عَلَى مُحَمَّدٍ وَعَلَى أَزْوَاجِهِ وَذُرِّيَّتِهِ كَمَا بَارَكْتَ عَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ",
          transliteration:
              "Allahumma salli 'ala Muhammadin wa 'ala azwajihi wa dhurriyyatihi, kama sallayta 'ala ali Ibrahima. Wa barik 'ala Muhammadin wa 'ala azwajihi wa dhurriyyatihi, kama barakta 'ala ali Ibrahima, innaka Hamidum Majid.",
          meaning:
              "O Allah, send Your grace on Muhammad and on his wives and offspring, as You sent Your grace on the family of Ibrahim. And send Your blessings on Muhammad and on his wives and offspring, as You sent Your blessings on the family of Ibrahim. Verily, You are Most Praiseworthy, Most Glorious.",
          targetCount: 11),
    ],
  ),
  PresetCategory(
    name: "After Prayer (Namaz)",
    description: "Masnoon azkar recited after fardh salah.",
    azkarList: [
      PresetAzkar(
          arabic: "اللَّهُ أَكْبَرُ",
          transliteration: "Allahu Akbar",
          meaning: "Allah is the Greatest.",
          targetCount: 1),
      PresetAzkar(
          arabic: "أَسْتَغْفِرُ اللَّهَ",
          transliteration: "Astaghfirullah",
          meaning: "I seek forgiveness from Allah.",
          targetCount: 3),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ أَنْتَ السَّلاَمُ وَمِنْكَ السَّلاَمُ تَبَارَكْتَ ذَا الْجَلاَلِ وَالإِكْرَامِ",
          transliteration:
              "Allahumma antas-Salam wa minkas-salam, tabarakta ya Dhal-Jalaali wal-‘Ikraam",
          meaning:
              "O Allah, You are Peace and from You comes peace. Blessed are You, O Owner of majesty and honor.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهْوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ اللَّهُمَّ لاَ مَانِعَ لِمَا أَعْطَيْتَ وَلاَ مُعْطِيَ لِمَا مَنَعْتَ وَلاَ يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ",
          transliteration:
              "Laa ilaaha illal-laahu wahdahu laa shareeka lah, lahul mulku wa lahuI hamdu, wa huwa ‘ala kulli shay-in Qadeer, Allahumma laa maani’a limaa a’tayta, wa laa mu’tiya limaa mana’ta, wa laa yanfa’u dhal jaddi minkal jadd",
          meaning:
              "There is no god but Allah, alone, without partner. His is the sovereignty, and His is the praise, and He is over all things competent. O Allah, none can withhold what You have given, and none can give what You have withheld, and the might of the mighty person cannot benefit him against You.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ ، لا حول ولا قوة إلا بالله ، لاَ إِلَهَ إِلاَّ اللَّهُ وَلاَ نَعْبُدُ إِلاَّ إِيَّاهُ ، لَهُ النِّعْمَةُ وَلَهُ الْفَضْلُ وَلَهُ الثَّنَاءُ الْحَسَنُ ، لاَ إِلَهَ إِلاَّ اللَّهُ مُخْلِصِينَ لَهُ الدِّينَ وَلَوْ كَرِهَ الْكَافِرُونَ",
          transliteration:
              "Laa ilaaha illallaahu wahdahu laa shareeka lahu, lahul mulku, wa lahul hamdu wa huwa ‘alaa kulli shay-in qadeer. Laa hawla wa laa quwwata illaa billaah, laa ilaaha illallaahu, wa laa na’budu illaa iyyaah, lahun-ni’matu wa lahul fadhlu wa lahuth thanaa-ul hasan, laa ilaaha illallaahu mukhliseena lahud deena wa law karihal kaafiroon",
          meaning:
              "There is no god but Allah, alone, without partner. His is the sovereignty, and His is the praise, and He is over all things competent. There is no might nor power except with Allah. There is no god but Allah, and we do not worship except Him. For Him is the favor, and for Him is the grace, and for Him is the excellent praise. There is no god but Allah, being sincere to Him in religion, although the disbelievers dislike it.",
          targetCount: 1),
      PresetAzkar(
          arabic: "سبحان الله",
          transliteration: "SubhanAllah",
          meaning: "Glory be to Allah.",
          targetCount: 33),
      PresetAzkar(
          arabic: "الحمد لله",
          transliteration: "Alhamdulillah",
          meaning: "Praise be to Allah.",
          targetCount: 33),
      PresetAzkar(
          arabic: "الله أكبر",
          transliteration: "Allahu Akbar",
          meaning: "Allah is the Greatest.",
          targetCount: 33),
      PresetAzkar(
          arabic:
              "لاَ إِلَهَ إِلاَّ اللَّهُ وَحْدَهُ لاَ شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَىْءٍ قَدِيرٌ",
          transliteration:
              "Laa ilaaha illallaahu wahdahu laa shareeka lahu, lahul mulku, wa lahul hamdu wa huwa ‘alaa kulli shay-in qadeer",
          meaning:
              "There is no god but Allah, alone, without partner. His is the sovereignty, and His is the praise, and He is over all things competent.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "ٱللَّهُ لَآ إِلَـٰهَ إِلَّا هُوَ ٱلْحَىُّ ٱلْقَيُّومُ ۚ لَا تَأْخُذُهُۥ سِنَةٌۭ وَلَا نَوْمٌۭ ۚ لَّهُۥ مَا فِى ٱلسَّمَـٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ مَن ذَا ٱلَّذِى يَشْفَعُ عِندَهُۥٓ إِلَّا بِإِذْنِهِۦ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَىْءٍۢ مِّنْ عِلْمِهِۦٓ إِلَّا بِمَا شَآءَ ۚ وَسِعَ كُرْسِيُّهُ ٱلسَّمَـٰوَٰتِ وَٱلْأَرْضَ ۖ وَلَا يَـُٔودُهُۥ حِفْظُهُمَا ۚ وَهُوَ ٱلْعَلِىُّ ٱلْعَظِيمُ",
          transliteration:
              "Allahu la ilaha illahuwa alhayyu alqayyoomu la ta/khuthuhusinatun wala nawmun lahu ma fee assamawatiwama fee al-ardi man tha allatheeyashfaAAu AAindahu illa bi-ithnihi yaAAlamu mabayna aydeehim wama khalfahum wala yuheetoonabishay-in min AAilmihi illa bima shaawasiAAa kursiyyuhu assamawati wal-ardawala yaooduhu hifthuhumawahuwa alAAaliyyu alAAatheem",
          meaning:
              "Allah! There is no god ˹worthy of worship˺ except Him, the Ever-Living, All-Sustaining. Neither drowsiness nor sleep overtakes Him. To Him belongs whatever is in the heavens and whatever is on the earth. Who could possibly intercede with Him without His permission? He ˹fully˺ knows what is ahead of them and what is behind them, but no one can grasp any of His knowledge—except what He wills ˹to reveal˺. His Seat1 encompasses the heavens and the earth, and the preservation of both does not tire Him. For He is the Most High, the Greatest.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "قُلْ هُوَ ٱللَّهُ أَحَدٌ ١ ٱللَّهُ ٱلصَّمَدُ ٢ لَمْ يَلِدْ وَلَمْ يُولَدْ ٣ وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ ٤",
          transliteration:
              "Qul huwa Allahu ahad, Allahu assamad, lam yalid walam yoolad, walam yakun lahu kufuwan ahad",
          meaning:
              "Say, ˹O Prophet,˺ “He is Allah—One ˹and Indivisible˺; Allah—the Sustainer ˹needed by all˺. He has never had offspring, nor was He born. And there is none comparable to Him.”",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ ١ مِن شَرِّ مَا خَلَقَ ٢ وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ ٣ وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ ٤",
          transliteration:
              "Qul a'udhu birabbi al-falaq, min sharri ma khalaq, wa min sharri ghasiqin idha waqab, wa min sharri hasidin idha hasad",
          meaning:
              "Say, ˹O Prophet,˺ I seek refuge with the Lord of daybreak from the evil of what He has created, and from the evil of the night when it grows dark, and from the evil of those ˹witches casting spells by˺ blowing onto knots, and from the evil of an envier when they envy.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ ١ مَلِكِ ٱلنَّاسِ ٢ إِلَٰهِ ٱلنَّاسِ ٣ مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ ٤ الَّذِي يُوَسْوِسُ فِي صُدُورِ ٱلنَّاسِ ٥ مِنَ الْجِنَّةِ وَالنَّاسِ ٦",
          transliteration:
              "Qul a'udhu birabbi an-nas, Maliki an-nas, Ilahi an-nas, min sharri al-waswasil khannas, alladhi yuwaswisu fee sudoorin-nas, min al-jinnati wan-nas",
          meaning:
              "Say, ˹O Prophet,˺ I seek refuge with the Lord of mankind, the King of mankind, the God of mankind, from the evil of the whisperer who withdraws, who whispers in the breasts of mankind, from among jinn and mankind.",
          targetCount: 1),
      PresetAzkar(
          arabic:
              "اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْماً نَافِعاً، وَرِزْقاً طَيِّباً، وَعَمَلاً مُتَقَبَّلاً",
          transliteration:
              "Allahumma innee as-aluka ‘ilman nafi’an, wa rizqan tayyiban, wa ‘amalan mutaqabbalan",
          meaning:
              "O Allah, I ask You for beneficial knowledge, goodly provision, and acceptable deeds.",
          targetCount: 1),
    ],
  ),
  PresetCategory(
    name: "Before & After Sleeping (Neend)",
    description: "Supplications to recite before going to sleep.",
    azkarList: [
      PresetAzkar(
          arabic: "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا",
          transliteration: "Bismika Allahumma amutu wa ahya",
          meaning: "In Your name, O Allah, I die and I live.",
          targetCount: 1),
      PresetAzkar(
          arabic: "اللَّهُمَّ قِنِي عَذَابَكَ يَوْمَ تَبْعَثُ عِبَادَكَ",
          transliteration: "Allahumma qini 'adhabaka yawma tab'athu 'ibadak",
          meaning:
              "O Allah, protect me from Your punishment on the Day when You resurrect Your servants.",
          targetCount: 3),
      // after sleeping
      PresetAzkar(
          arabic:
              "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
          transliteration:
              "Alhamdulillahil-ladhi ahyana ba'da ma amatana wa ilayhi-n-nushur",
          meaning:
              "All praise is for Allah Who has given us life after He caused us to die, and to Him is the return.",
          targetCount: 1),
    ],
  ),
  
];
