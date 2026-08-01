import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixraw/model/raw_photo.dart';
import 'package:path/path.dart' as p;

import '../../state/app_config_notifier.dart';
import '../../util/xmp.dart';

class CopyDialog extends ConsumerStatefulWidget {
  final List<RawPhoto> selectedPhotos;
  const CopyDialog({super.key, required this.selectedPhotos});

  @override
  ConsumerState<CopyDialog> createState() => _CopyDialogState();
}

class _CopyDialogState extends ConsumerState<CopyDialog> {
  bool copying = false;
  bool complete = false;
  bool isCancelled = false;
  String? destDir;

  final progressNotifier = ValueNotifier<double>(0.0);

  Future<String?> getInitialDir() async {
    final config = ref.watch(appConfigProvider);
    Directory? dir;
    if(config.targetDirectory != null) {
      dir = Directory(config.targetDirectory!);
      if(await dir.exists()) {
        return dir.absolute.path;
      }
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    final config = ref.watch(appConfigProvider);
    setState(() {
      destDir = config.targetDirectory;
    });
  }

  Future<void> selectFolder() async {
    String? selectedDirectory = await FilePicker.getDirectoryPath(
      dialogTitle: 'Destination',
      initialDirectory: await getInitialDir(),
    );
    ref.read(appConfigProvider.notifier).setTargetDirectory(selectedDirectory);

    if (selectedDirectory != null) {
      setState(() {
        destDir = selectedDirectory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Copy ${widget.selectedPhotos.length} selected files'),
      content: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15),
        child: SizedBox(
          width: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Destination:'),

              Row(
                children: [
                  Expanded(
                    child: destDir == null
                        ? Text('Select destination folder')
                        : Text(destDir!),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: const Icon(Icons.folder_rounded),
                    onPressed: selectFolder,
                  ),
                ],
              ),
              SizedBox(height: 10),
              ValueListenableBuilder<double>(
                valueListenable: progressNotifier,
                builder: (context, progress, child) {
                  final percentage = (progress * 100).toInt();

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LinearProgressIndicator(value: progress),
                      const SizedBox(height: 16),
                      Text('$percentage% Completed'),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        // Cancel Button logic
        if (!complete)
          OutlinedButton(
            onPressed: isCancelled
                ? null // Disabled if already clicked once
                : () async {
              if (copying) {
                setState(() {
                  isCancelled = true;
                });
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(isCancelled ? 'Cancelling...' : 'Cancel'),
          ),

        // Copy / Close Button logic
        OutlinedButton(
          onPressed: copying || destDir == null || isCancelled
              ? null
              : () async {
            if (complete) {
              Navigator.of(context).pop();
            } else {
              setState(() {
                copying = true;
              });

              await _copySelectedPhotos(
                context,
                widget.selectedPhotos,
                destDir!,
                progressNotifier,
              );

              if (isCancelled) {
                if (mounted) Navigator.of(context).pop();
              } else {
                setState(() {
                  complete = true;
                  copying = false;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Photos copied successfully!'),
                  ),
                );
              }
            }
          },
          child: complete ? const Text('Close') : const Text('Copy'),
        ),
      ],
    );
  }

  Future<void> _copySelectedPhotos(
      BuildContext context,
      List<RawPhoto> selectedPhotos,
      String destinationDirPath,
      ValueNotifier<double> progressNotifier,
      ) async {
    final int totalFiles = selectedPhotos.length;

    for (int i = 0; i < totalFiles; i++) {
      if (isCancelled) {
        break;
      }
      final photo = selectedPhotos[i];
      final file = File(photo.filePath);

      if (await file.exists()) {
        final String fileName = file.path.split(Platform.pathSeparator).last;
        final String newPath = '$destinationDirPath${Platform.pathSeparator}$fileName';
        final String fileWithoutExt = p.basenameWithoutExtension(file.absolute.path);
        final String xmpFilePath = '$destinationDirPath${Platform.pathSeparator}$fileWithoutExt.xmp';
        final String xmpContent = getXMPForRawFile(photo);

        final targetFile = File(newPath);
        final xmpFile = File(xmpFilePath);
        bool shouldCopy = true;

        if (await targetFile.exists()) {
          final bool? overwriteDecision = await _showOverwriteDialog(context, fileName);
          if (overwriteDecision == null || !overwriteDecision) {
            shouldCopy = false;
          }
        }

        if (shouldCopy) {
          await file.copy(newPath);
          await xmpFile.writeAsString(xmpContent);
        }
      }
      progressNotifier.value = (i + 1) / totalFiles;
    }
  }

  // Helper method to show the confirmation dialog
  Future<bool?> _showOverwriteDialog(BuildContext context, String fileName) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('File Already Exists'),
          content: Text('The file "$fileName" \n'
              'already exists in the destination folder.\n\n'
              'Do you want to overwrite it?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Skip'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Overwrite', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
