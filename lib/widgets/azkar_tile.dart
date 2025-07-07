import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/providers/settings_provider.dart';
import 'package:azkar_counter/views/counter_screen.dart';

class AzkarTile extends StatelessWidget {
  final AzkarModel azkar;
  final VoidCallback onReset;
  final VoidCallback? onDelete;

  const AzkarTile({
    super.key,
    required this.azkar,
    required this.onReset,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CounterScreen(azkar: azkar)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFE2B0FF), Color(0xFF9F86FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            azkar.arabic,
                            style: TextStyle(
                                fontFamily: 'NotoNaskhArabic',
                                fontSize: 26,
                                height: 1.4,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: onReset,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.refresh,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 20),
                              ),
                            ),
                            if (onDelete != null) const SizedBox(width: 8),
                            if (onDelete != null)
                              GestureDetector(
                                onTap: onDelete,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .error
                                        .withOpacity(0.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.delete_outline,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      size: 20),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Use a Consumer to listen for changes in display settings
                    Consumer<SettingsProvider>(
                      builder: (context, settings, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Conditionally show Transliteration
                            if (settings.showTransliteration)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  azkar.title,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                ),
                              ),
                            // Conditionally show Meaning
                            if (settings.showMeaning)
                              Text(
                                azkar.meaning,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.7)),
                              ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCountChip(
                            context,
                            "Today: ${azkar.dailyCount}",
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1),
                            Theme.of(context).colorScheme.primary),
                        _buildCountChip(
                            context,
                            "Total: ${azkar.totalCount}",
                            Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.1),
                            Theme.of(context).colorScheme.secondary),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCountChip(BuildContext context, String label,
      Color backgroundColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
