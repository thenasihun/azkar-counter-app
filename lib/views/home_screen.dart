import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:azkar_counter/providers/azkar_provider.dart';
import 'package:azkar_counter/providers/theme_provider.dart';
import 'package:azkar_counter/views/add_custom_azkar.dart';
import 'package:azkar_counter/views/info_screen.dart';
import 'package:azkar_counter/widgets/azkar_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final azkarProvider = Provider.of<AzkarProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          if (_currentIndex == 0) _buildHeader(context),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                _buildDefaultAzkarList(context, azkarProvider),
                _buildCustomAzkarList(context, azkarProvider),
                const InfoScreen(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _currentIndex == 1
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const AddCustomAzkarScreen(),
                );
              },
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
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
          _buildNavItem(Icons.info_outline, 'Info', 2),
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

  Widget _buildHeader(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    IconData themeIcon;
    switch (themeProvider.themeMode) {
      case ThemeMode.light:
        themeIcon = Icons.dark_mode_outlined;
        break;
      case ThemeMode.dark:
        themeIcon = Icons.light_mode_outlined;
        break;
      case ThemeMode.system:
        final brightness = MediaQuery.of(context).platformBrightness;
        themeIcon = brightness == Brightness.dark
            ? Icons.brightness_auto_outlined
            : Icons.brightness_auto_outlined;
        break;
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5C258D), Color(0xFF4389A2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
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
              children: [
                Text("عداد الأذكار",
                    style: TextStyle(
                        fontFamily: 'Uthmanic',
                        fontSize: 36,
                        color: Theme.of(context).colorScheme.onSurface)),
                const SizedBox(height: 8),
                Text("Azkar Counter",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface)),
                const SizedBox(height: 4),
                Text("Remember Allah with every breath",
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6))),
                const SizedBox(height: 8),
                Text("by nasihun.com",
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.5),
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 5,
          right: 15,
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // Use a dark background in light mode and a light one in dark mode for visibility
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.25)
                    : Colors.black.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
              child: Icon(themeIcon, color: Colors.white, size: 20),
            ),
            onPressed: () {
              themeProvider.cycleTheme(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultAzkarList(
      BuildContext context, AzkarProvider provider) {
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
  }

  Widget _buildCustomAzkarList(
      BuildContext context, AzkarProvider provider) {
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
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
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
    return SafeArea(
      bottom: false,
      child: ListView.builder(
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
      ),
    );
  }
}
