import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
import 'package:azkar_counter/providers/settings_provider.dart';
import 'package:azkar_counter/widgets/counter_button.dart';
import 'package:vibration/vibration.dart'; // Import the new vibration package

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
        text:
            widget.azkar.targetCount > 0 ? widget.azkar.targetCount.toString() : '');

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

  // Updated to use the 'vibration' package
  void _onTargetReached() async {
    // Check if the device can vibrate
    if (await Vibration.hasVibrator()) {
      // Vibrate for 400 milliseconds for a noticeable effect
      Vibration.vibrate(duration: 400);
    }
    
    _doneAudioPlayer.play(AssetSource('sounds/done_sound.mp3'));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Masha\'Allah! Target reached.'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  // Updated tap handler with corrected logic
  void _handleTap(SettingsProvider settings) async {
    // Play sound first if it's enabled
    if (settings.isSoundOn) {
      _audioPlayer.play(AssetSource('sounds/tap_sound.mp3'));
    }

    // Then, trigger vibration on every tap
    if (await Vibration.hasVibrator()) {
       Vibration.vibrate(duration: 50, amplitude: 128);
    }
  }

  @override
  Widget build(BuildContext context) {
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('Counter'),
        elevation: 1,
        actions: [
          Consumer<SettingsProvider>(
            builder: (context, settings, child) {
              return IconButton(
                icon: Icon(
                    settings.isSoundOn ? Icons.volume_up_outlined : Icons.volume_off_outlined),
                tooltip: 'Toggle Sound',
                onPressed: () {
                  settings.toggleSound();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.track_changes_outlined),
            tooltip: 'Set Target',
            onPressed: () => _showSetTargetDialog(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Reset Counter'),
                    content: const Text(
                        'Are you sure you want to reset both today\'s and total counts? This action cannot be undone.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: const Text('Reset',
                            style: TextStyle(color: Colors.red)),
                        onPressed: () {
                          azkarProvider.resetAllCounts(widget.azkar);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.azkar.arabic,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontFamily: 'NotoNaskhArabic', fontSize: 32)),
                const SizedBox(height: 8),
                Text(widget.azkar.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 4),
                Text(widget.azkar.meaning,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18)),
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
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Color(0xFF7B61FF)),
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
                                  _onTargetReached();
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
