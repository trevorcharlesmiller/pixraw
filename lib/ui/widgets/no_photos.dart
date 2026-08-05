import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/raw_photos.dart';
import '../../state/raw_photos_notifier.dart';

class NoPhotos extends ConsumerWidget {
  final VoidCallback selectFolder;
  const NoPhotos({super.key, required this.selectFolder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          if (rawPhotos.directory != null && rawPhotos.rawPhotoPaths.isEmpty && rawPhotos.ratingFilter.isEmpty)
            Text('No RAW files were found in the\nfolder you selected.', style: TextStyle(fontSize: 26), textAlign: TextAlign.center,),
          ElevatedButton.icon(
            onPressed: selectFolder,
            icon: const Icon(Icons.folder_open, size: 24),
            label: const Text(
              'Open Folder',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}
