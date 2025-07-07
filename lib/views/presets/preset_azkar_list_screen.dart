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
  final Set<PresetAzkar> _selectedAzkar = {};
  final Set<PresetAzkar> _alreadyAddedAzkar = {};

  @override
  void initState() {
    super.initState();
    _checkForExistingAzkar();
  }

  void _checkForExistingAzkar() {
    final azkarProvider = Provider.of<AzkarProvider>(context, listen: false);
    final userAzkarArabic =
        azkarProvider.azkarList.map((a) => a.arabic).toSet();

    for (var preset in widget.category.azkarList) {
      if (userAzkarArabic.contains(preset.arabic)) {
        _alreadyAddedAzkar.add(preset);
        _selectedAzkar.add(preset);
      }
    }
    setState(() {});
  }

  void _toggleSelectAll(bool select) {
    setState(() {
      if (select) {
        _selectedAzkar.addAll(widget.category.azkarList);
      } else {
        _selectedAzkar.clear();
        _selectedAzkar.addAll(_alreadyAddedAzkar);
      }
    });
  }

  void _importSelected() {
    final azkarToImport = _selectedAzkar
        .where((preset) => !_alreadyAddedAzkar.contains(preset))
        .toList();

    if (azkarToImport.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('No new Azkar selected to import.')),
      );
      return;
    }

    final newAzkarList = azkarToImport.map((preset) {
      return AzkarModel(
        title: preset.transliteration,
        arabic: preset.arabic,
        meaning: preset.meaning,
        isCustom: true,
        lastUpdated: DateTime.now(),
        targetCount: preset.targetCount,
        // Assign the category name from the preset
        category: widget.category.name,
      );
    }).toList();

    Provider.of<AzkarProvider>(context, listen: false)
        .addMultipleAzkar(newAzkarList);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('${azkarToImport.length} new Azkar imported successfully!')),
    );

    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bool allSelectableSelected = _selectedAzkar.length == widget.category.azkarList.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        actions: [
          TextButton(
            onPressed: () => _toggleSelectAll(!allSelectableSelected),
            child: Text(allSelectableSelected ? 'Deselect All' : 'Select All'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.category.azkarList.length,
        itemBuilder: (context, index) {
          final preset = widget.category.azkarList[index];
          final isSelected = _selectedAzkar.contains(preset);
          final isAlreadyAdded = _alreadyAddedAzkar.contains(preset);

          return ListTile(
            title: Text(preset.arabic,
                style: const TextStyle(fontFamily: 'NotoNaskhArabic', fontSize: 20)),
            subtitle: Text(preset.transliteration),
            leading: isAlreadyAdded
                ? const Chip(label: Text('Added'), padding: EdgeInsets.zero)
                : Checkbox(
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
            onTap: isAlreadyAdded
                ? null
                : () {
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
      floatingActionButton: _selectedAzkar.length > _alreadyAddedAzkar.length
          ? FloatingActionButton.extended(
              onPressed: _importSelected,
              label: Text('Import (${_selectedAzkar.length - _alreadyAddedAzkar.length})'),
              icon: const Icon(Icons.download_done_rounded),
            )
          : null,
    );
  }
}
