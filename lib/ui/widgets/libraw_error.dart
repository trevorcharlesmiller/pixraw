import 'package:flutter/material.dart';

class LibRawError extends StatelessWidget {
  final String errorMessage;
  const LibRawError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Fatal Error', style: TextStyle(fontSize: 18),),
              Text('Failed to load LibRaw package:'),
              Text(errorMessage, style: TextStyle(fontSize: 12),),
            ],
          ),
        ),
      ),
    );
  }
}
