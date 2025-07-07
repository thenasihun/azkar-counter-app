import 'package:flutter/material.dart';
import 'package:azkar_counter/core/preset_azkar_data.dart';
import 'package:azkar_counter/views/presets/preset_azkar_list_screen.dart';

class PresetCategoriesScreen extends StatelessWidget {
  const PresetCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import from Presets'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: presetCategories.length,
        itemBuilder: (context, index) {
          final category = presetCategories[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              title: Text(category.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text(category.description, style: TextStyle(color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.7))),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PresetAzkarListScreen(category: category),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
