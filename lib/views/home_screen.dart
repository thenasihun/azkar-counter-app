import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
import 'package:azkar_counter/views/add_custom_azkar.dart';
import 'package:azkar_counter/views/settings_screen.dart';
import 'package:azkar_counter/widgets/azkar_tile.dart';
import 'package:azkar_counter/views/presets/preset_categories_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

   @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildDefaultAzkarList(),
      _buildCustomAzkarList(),
      const SettingsScreen(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      // The FAB is now only shown on the Custom Azkar tab
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () => _showAddOptions(context),
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  // New method to show the "Add" options
  void _showAddOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.edit_note_outlined),
                  title: const Text('Create a New Custom Azkar'),
                  onTap: () {
                    Navigator.pop(context); // Close the sheet
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const AddCustomAzkarScreen(),
                    );
                  }),
              ListTile(
                leading: const Icon(Icons.playlist_add_check_rounded),
                title: const Text('Import from Presets'),
                onTap: () {
                  Navigator.pop(context); // Close the sheet
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PresetCategoriesScreen()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
          .copyWith(bottom: MediaQuery.of(context).padding.bottom + 10),
      decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -1))
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_filled, 'Home', 0),
          _buildNavItem(Icons.add_circle_outline, 'Custom', 1),
          _buildNavItem(Icons.settings_outlined, 'Settings', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey.shade600,
            ),
            if (isSelected) const SizedBox(width: 8),
            if (isSelected)
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Updated Header for better padding and layout
  PreferredSizeWidget _buildHeader(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(210), // Adjusted height
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            // This padding creates the outer boundary for the inner card
            padding: EdgeInsets.fromLTRB(
              16, // Left padding
              MediaQuery.of(context).padding.top + 16, // Top padding + safe area
              16, // Right padding
              16, // Bottom padding
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5C258D), Color(0xFF4389A2)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            // The inner container now fills the padded space
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Vertically centers the text
                children: [
                  Text("عداد الأذكار",
                      style: TextStyle(
                          fontFamily: 'Uthmanic',
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.onSurface)),
                  const SizedBox(height: 4),
                  Text("Azkar Counter",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface)),
                  const SizedBox(height: 4),
                  Text("Remember Allah with every breath",
                      style: TextStyle(
                          fontSize: 13,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6))),
                  const SizedBox(height: 6),
                  Text("by nasihun.com",
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.5),
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultAzkarList() {
    return Scaffold(
      appBar: _buildHeader(context),
      body: Consumer<AzkarProvider>(
        builder: (context, provider, child) {
          final defaultAzkarList =
              provider.azkarList.where((azkar) => !azkar.isCustom).toList();
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: defaultAzkarList.length,
            itemBuilder: (context, index) {
              final azkar = defaultAzkarList[index];
              return AzkarTile(
                azkar: azkar,
                onReset: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Reset Counter'),
                        content: Text(
                            'Are you sure you want to reset the daily count for "${azkar.title}"?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Reset',
                                style: TextStyle(color: Colors.red)),
                            onPressed: () {
                              provider.resetDailyCount(azkar);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCustomAzkarList() {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Azkar')),
      body: SafeArea(
        bottom: false,
        child: Consumer<AzkarProvider>(
          builder: (context, provider, child) {
            final customAzkarList =
                provider.azkarList.where((azkar) => azkar.isCustom).toList();
            if (customAzkarList.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_task,
                        size: 80, color: Theme.of(context).disabledColor),
                    const SizedBox(height: 20),
                    Text(
                      'No Custom Azkar Yet',
                      style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.6),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'Add your own azkar by tapping the button below.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: customAzkarList.length,
              itemBuilder: (context, index) {
                final azkar = customAzkarList[index];
                return AzkarTile(
                  azkar: azkar,
                  onReset: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Reset Counter'),
                          content: Text(
                              'Are you sure you want to reset the daily count for "${azkar.title}"?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            TextButton(
                              child: const Text('Reset',
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () {
                                provider.resetDailyCount(azkar);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDelete: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Azkar'),
                          content: Text(
                              'Are you sure you want to delete "${azkar.title}"?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            TextButton(
                              child: const Text('Delete',
                                  style: TextStyle(color: Colors.red)),
                              onPressed: () {
                                provider.deleteAzkar(azkar);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
