import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text('About Azkar Counter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoCard(context),
            const SizedBox(height: 20),
            _buildSectionCard(
              context: context,
              title: 'More Apps by Nasihun',
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF2A2A2A)
                  : const Color(0xFFFFF9E5),
              items: [
                _buildLinkItem(context, 'Quran Poster Generator', () => _launchURL('https://nasihun.com/nasihun-projects/quran-poster-generator/')),
                _buildLinkItem(context, 'Quranic Duas', () => _launchURL('https://nasihun.com/nasihun-projects/quranic-duas/')),
                _buildLinkItem(context, 'ME Azkar App', () => _launchURL('https://play.google.com/store/apps/details?id=com.is360.me_azkar')),
              ],
            ),
            const SizedBox(height: 20),
            _buildSectionCard(
              context: context,
              title: 'Connect with Us',
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF2A2A2A)
                  : const Color(0xFFE5F9F1),
              items: [
                _buildLinkItem(context, '@Nasihun on Whatsapp', () => _launchURL('https://www.whatsapp.com/channel/0029VaCXfSF1NCrXOeyGBk3l')),
                _buildLinkItem(context, '@thenasihun on Instagram', () => _launchURL('https://instagram.com/thenasihun')),
                _buildLinkItem(context, 'thenasihun@gmail.com', () => _launchURL('mailto:thenasihun@gmail.com')),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'May Allah accept your zikr and grant you His blessings.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7), fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              'بارك الله فيكم',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Uthmanic', color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8), fontSize: 16),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _launchURL('https://nasihun.com'),
              child: Text(
                'nasihun.com',
                style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "عداد الأذكار",
            style: TextStyle(
                fontFamily: 'Uthmanic',
                fontSize: 42,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            "Azkar Counter",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 4),
          Text("Version 1.0.0",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7))),
          const SizedBox(height: 20),
          Text(
            'A simple and beautiful app to help you maintain your daily azkar and remember Allah throughout the day.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                height: 1.5),
          ),
          const SizedBox(height: 16),
          Text(
            '"And remember your Lord within yourself in humility and in fear without being apparent in speech - in the mornings and the evenings."\n- Quran 7:205',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required Color backgroundColor,
    required List<Widget> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }

  Widget _buildLinkItem(BuildContext context, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Text(text,
                    style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSurface))),
            Icon(Icons.open_in_new,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                size: 20),
          ],
        ),
      ),
    );
  }
}
