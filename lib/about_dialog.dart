import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PRAboutDialog extends StatelessWidget {
  const PRAboutDialog({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {

    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse('https://pixraw.app');
    return AlertDialog(
      title: const Text('About PixRAW'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/icon.png', height: 100,),
              SizedBox(width: 15,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PixRAW', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),),
                  SizedBox(height: 6,),
                  Text('Version 1.0.0', style: TextStyle(fontSize: 18),),
                ],
              ),),
            ],
          ),
          SizedBox(height: 20,),
          Text('PixRAW is open source software distributed under the MIT License.'),
          SizedBox(height: 15,),
          TextButton(onPressed: () async {
            await _launchUrl(_url);
          }, child: Text('https://pixraw.app', style: TextStyle(color: Colors.blue),),),
          SizedBox(height: 15,),
          Text('Keyboard Shortcuts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
          SizedBox(height: 7,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\u2022 '), // The bullet
              Expanded(
                child: Text(
                  'Enter key: toggles between grid view and full screen.',
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\u2022 '), // The bullet
              Expanded(
                child: Text(
                  'Space-bar key: Select or deselect a "keeper" photo.',
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\u2022 '), // The bullet
              Expanded(
                child: Text(
                  'Left and Right Arrow keys: Change the currently highlighted photo in'
                  '\ngridview and navigate between photos in full screen view.',
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),

          SizedBox(height: 20,),
          const Text(
                'Copyright 2026 Trevor Charles Miller.\n'
                'All rights reserved.',
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
