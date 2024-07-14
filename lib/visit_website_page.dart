import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class VisitWebsitePage extends StatelessWidget {
  const VisitWebsitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URL Launcher'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: const Text('Visit Website'),
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://flutter.dev/';
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      final bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        throw 'Could not launch $url';
      }
    } else {
      throw 'Could not launch $url';
    }
  }
}
