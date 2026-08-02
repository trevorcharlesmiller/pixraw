import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/raw_photo.dart';
import '../../model/raw_photos.dart';
import '../../state/app_config_notifier.dart';
import '../../state/raw_photos_notifier.dart';
import '../dialog/about_dialog.dart';
import '../dialog/copy_dialog.dart';
import '../dialog/settings_dialog.dart';

class ToolBar extends ConsumerWidget {
  final AsyncCallback onSelectFolder;
  final VoidCallback toggleGridView;
  const ToolBar({super.key, required this.onSelectFolder, required this.toggleGridView});

  Future<void> _showAboutDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return PRAboutDialog();
      },
    );
  }

  Future<void> _showSettingsDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SettingsDialog();
      },
    );
  }

  Future<void> _showCopyDialog(BuildContext context, List<RawPhoto> selectedPhotos) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CopyDialog(
          selectedPhotos: selectedPhotos,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    RawPhotos rawPhotos = ref.watch(rawPhotosProvider);
    final config = ref.watch(appConfigProvider);
    final configNotifier = ref.read(appConfigProvider.notifier);

    return Card(
      child: Padding(
        padding: EdgeInsetsGeometry.all(3),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Open folder',
              icon: const Icon(Icons.folder_rounded),
              onPressed: onSelectFolder,
            ),
            SizedBox(
              height: 30,
              child: VerticalDivider(
                color: Colors.grey, // Ensure color is visible
                thickness: 1, // Explicitly set thickness
                width: 20, // Space allocated for the divider
              ),
            ),
            IconButton(
              icon: config.isGridView
                  ? const Icon(Icons.grid_view_rounded)
                  : const Icon(Icons.grid_view),
              tooltip: 'Grid view',
              //iconSize: 15,
              color: config.isGridView
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              onPressed:
              rawPhotos.directory == null ||
                  rawPhotos.rawPhotoPaths.isEmpty
                  ? null
                  : toggleGridView,
            ),
            IconButton(
              icon: config.isGridView
                  ? const Icon(Icons.image_outlined)
                  : const Icon(Icons.image_rounded),
              tooltip: 'Single photo view',
              //iconSize: 15,
              color: config.isGridView
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              onPressed:
              rawPhotos.directory == null ||
                  rawPhotos.rawPhotoPaths.isEmpty
                  ? null
                  : toggleGridView,
            ),
            Expanded(child: Container(),),

            if (rawPhotos.directory != null)
              IconButton(
                tooltip: 'Copy selected photos',
                icon: const Icon(Icons.file_copy_rounded),
                onPressed:
                rawPhotos.rawPhotoPaths.where((p) => p.selected ?? false).isEmpty
                    ? null
                    : () {
                  _showCopyDialog(context,
                      rawPhotos.rawPhotoPaths
                          .where((p) => p.selected ?? false)
                      .toList());
                },
              ),

            IconButton(
              onPressed: (){
                configNotifier.togglePanelOpen(!config.isPanelOpen);
              },
              icon: Icon(Icons.info_outline),
              tooltip: 'Toggle photo information panel',
              color: config.isPanelOpen
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'App settings',
              onPressed: () => _showSettingsDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.help),
              tooltip: 'About PixRAW',
              onPressed: () => _showAboutDialog(context),
            ),

          ],
        ),
      ),
    );
  }
}
