import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
import 'package:azkar_counter/providers/settings_provider.dart';
import 'package:azkar_counter/widgets/counter_button.dart';
import 'package:vibration/vibration.dart';

class CounterScreen extends StatefulWidget {
  final AzkarModel azkar;

  const CounterScreen({super.key, required this.azkar});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioPlayer _doneAudioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    _doneAudioPlayer.dispose();
    super.dispose();
  }

  void _showSetTargetDialog(BuildContext context) {
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);
    final targetController = TextEditingController(
        text: widget.azkar.targetCount > 0
            ? widget.azkar.targetCount.toString()
            : '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Target Count'),
        content: TextField(
          controller: targetController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration:
              const InputDecoration(hintText: "e.g., 33, 100 or 0 to disable"),
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              final newTarget = int.tryParse(targetController.text) ?? 0;
              azkarProvider.updateTargetCount(widget.azkar, newTarget);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _onTargetReached(SettingsProvider settings) async {
    if (await Vibration.hasVibrator() ?? false) {
      Vibration.vibrate(duration: 400);
    }
    if (settings.isTargetSoundOn) {
      _doneAudioPlayer.play(AssetSource('sounds/done_sound.mp3'));
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Masha\'Allah! Target reached.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleTap(SettingsProvider settings) async {
    if (settings.isTapSoundOn) {
      _audioPlayer.play(AssetSource('sounds/tap_sound.mp3'));
    } else {
      if (await Vibration.hasVibrator() ?? false) {
        Vibration.vibrate(duration: 50, amplitude: 128);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.track_changes_outlined),
            tooltip: 'Set Target',
            onPressed: () => _showSetTargetDialog(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.azkar.arabic,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'NotoNaskhArabic', fontSize: 32)),
                const SizedBox(height: 8),
                // --- The Fix is Here ---
                // Wrap the text widgets in a Consumer to listen for settings changes
                Consumer<SettingsProvider>(
                  builder: (context, settings, child) {
                    return Column(
                      children: [
                        if (settings.showTransliteration)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              widget.azkar.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 24),
                            ),
                          ),
                        if (settings.showMeaning)
                          Text(
                            widget.azkar.meaning,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 40),
                Consumer2<AzkarProvider, SettingsProvider>(
                  builder: (context, azkarData, settingsData, child) {
                    final currentAzkar = azkarData.azkarList
                        .firstWhere((a) => a.key == widget.azkar.key);
                    double progress = 0.0;
                    if (currentAzkar.targetCount > 0) {
                      progress =
                          currentAzkar.dailyCount / currentAzkar.targetCount;
                      if (progress > 1.0) progress = 1.0;
                    }

                    return Column(
                      children: [
                        Text('${currentAzkar.dailyCount}',
                            style: const TextStyle(
                                fontSize: 80, fontWeight: FontWeight.bold)),
                        if (currentAzkar.targetCount > 0)
                          Text(
                              "Today's Count (Goal: ${currentAzkar.targetCount})")
                        else
                          const Text("Today's Count"),
                        const SizedBox(height: 20),
                        Text('${currentAzkar.totalCount}',
                            style: const TextStyle(fontSize: 40)),
                        const Text('All Time'),
                        const SizedBox(height: 40),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 220,
                              height: 220,
                              child: CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 8,
                                backgroundColor: Colors.grey.shade200,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).colorScheme.primary),
                              ),
                            ),
                            CounterButton(
                              onTap: () {
                                _handleTap(settingsData);
                                final previousCount = currentAzkar.dailyCount;
                                azkarProvider.incrementCount(currentAzkar);
                                if (currentAzkar.targetCount > 0 &&
                                    previousCount < currentAzkar.targetCount &&
                                    currentAzkar.dailyCount >=
                                        currentAzkar.targetCount) {
                                  _onTargetReached(settingsData);
                                }
                              },
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
