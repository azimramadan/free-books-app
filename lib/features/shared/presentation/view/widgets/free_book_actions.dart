import 'package:bookly_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FreeBookActions extends StatelessWidget {
  const FreeBookActions({super.key, this.downloadLinkPdf, this.webReaderLink});

  final String? downloadLinkPdf;
  final String? webReaderLink;

  Future<void> launchURL(String? url) async {
    if (url == null || url.isEmpty) {
      debugPrint("URL is null or empty");
      return;
    }

    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              await launchURL(webReaderLink);
            },
            style: ElevatedButton.styleFrom(
              side: BorderSide(color: kPrimaryColor, width: 2),
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: const Text(
              "Read the book",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () async {
            await launchURL(downloadLinkPdf);
          },
          icon: Icon(Icons.download, color: Colors.green, size: 25),
        ),
      ],
    );
  }
}
