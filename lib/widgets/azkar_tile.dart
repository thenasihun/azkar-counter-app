import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
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
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);

    return Container(
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
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CounterScreen(azkar: azkar)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row with Arabic Text and Action Buttons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        azkar.arabic,
                        style: TextStyle(
                            fontFamily: 'NotoNaskhArabic',
                            fontSize: 24,
                            height: 1.5,
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Cleaner action buttons layout
                    Row(
                      children: [
                        // Favorite Button remains as the primary action
                        IconButton(
                          icon: Icon(
                            azkar.isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: azkar.isFavorite
                                ? Theme.of(context).colorScheme.error
                                : Colors.grey,
                          ),
                          tooltip: 'Toggle Favorite',
                          onPressed: () {
                            azkarProvider.toggleFavorite(azkar);
                          },
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                        // "More" menu for other actions
                        PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'reset') {
                              onReset();
                            } else if (value == 'delete' && onDelete != null) {
                              onDelete!();
                            }
                          },
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'reset',
                              child: ListTile(
                                leading: Icon(Icons.refresh),
                                title: Text("Reset Today's Count"),
                              ),
                            ),
                            // Only show the delete option if it's available
                            if (onDelete != null)
                              PopupMenuItem<String>(
                                value: 'delete',
                                child: ListTile(
                                  leading: Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
                                  title: Text("Delete", style: TextStyle(color: Theme.of(context).colorScheme.error)),
                                ),
                              ),
                          ],
                          icon: const Icon(Icons.more_vert),
                          tooltip: 'More options',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Transliteration and Meaning (conditionally shown)
                Consumer<SettingsProvider>(
                  builder: (context, settings, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                const SizedBox(height: 16),
                // Today and Total count chips
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget to build the count chips
  Widget _buildCountChip(
      BuildContext context, String label, Color backgroundColor, Color textColor) {
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
