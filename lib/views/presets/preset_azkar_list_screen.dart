import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/core/preset_azkar_data.dart';
import 'package:azkar_counter/models/azkar_model.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';

class PresetAzkarListScreen extends StatefulWidget {
  final PresetCategory category;
  const PresetAzkarListScreen({super.key, required this.category});

  @override
  State<PresetAzkarListScreen> createState() => _PresetAzkarListScreenState();
}

class _PresetAzkarListScreenState extends State<PresetAzkarListScreen> {
  // A set to keep track of selected preset Azkar
  final Set<PresetAzkar> _selectedAzkar = {};

  void _toggleSelectAll(bool select) {
    setState(() {
      if (select) {
        _selectedAzkar.addAll(widget.category.azkarList);
      } else {
        _selectedAzkar.clear();
      }
    });
  }

  void _importSelected() {
    if (_selectedAzkar.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one Azkar to import.')),
      );
      return;
    }

    final newAzkarList = _selectedAzkar.map((preset) {
      return AzkarModel(
        title: preset.transliteration,
        arabic: preset.arabic,
        meaning: preset.meaning,
        isCustom: true,
        lastUpdated: DateTime.now(),
      );
    }).toList();

    Provider.of<AzkarProvider>(context, listen: false).addMultipleAzkar(newAzkarList);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${_selectedAzkar.length} Azkar imported successfully!')),
    );

    // Go back two screens to the main custom list
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bool allSelected = _selectedAzkar.length == widget.category.azkarList.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          TextButton(
            onPressed: () => _toggleSelectAll(!allSelected),
            child: Text(allSelected ? 'Deselect All' : 'Select All'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.category.azkarList.length,
        itemBuilder: (context, index) {
          final preset = widget.category.azkarList[index];
          final isSelected = _selectedAzkar.contains(preset);
          return ListTile(
            title: Text(preset.arabic, style: const TextStyle(fontFamily: 'NotoNaskhArabic', fontSize: 20)),
            subtitle: Text(preset.transliteration),
            leading: Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedAzkar.add(preset);
                  } else {
                    _selectedAzkar.remove(preset);
                  }
                });
              },
            ),
            onTap: () {
              setState(() {
                if (isSelected) {
                  _selectedAzkar.remove(preset);
                } else {
                  _selectedAzkar.add(preset);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: _selectedAzkar.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _importSelected,
              label: Text('Import (${_selectedAzkar.length})'),
              icon: const Icon(Icons.download_done_rounded),
            )
          : null,
    );
  }
}
