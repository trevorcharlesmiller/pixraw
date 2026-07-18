import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pixraw/raw_photo.dart';

class CopyDialog extends StatefulWidget {
  final List<RawPhoto> selectedPhotos;
  const CopyDialog({super.key, required this.selectedPhotos});

  @override
  State<CopyDialog> createState() => _CopyDialogState();
}

class _CopyDialogState extends State<CopyDialog> {
  bool copying = false;
  bool complete = false;
  bool isCancelled = false;
  String? destDir;

  final progressNotifier = ValueNotifier<double>(0.0);

  Future<void> selectFolder() async {
    String? selectedDirectory = await FilePicker.getDirectoryPath();

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
                // 1. Disable the button immediately to prevent double-clicks
                setState(() {
                  isCancelled = true;
                });

                // The copy loop will notice 'isCancelled' and break gracefully.
                // We don't pop yet; we let the current file finish.
              } else {
                // If copying hasn't started yet, just close immediately
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

              // Await the copy process entirely
              await _copySelectedPhotos(
                context,
                widget.selectedPhotos,
                destDir!,
                progressNotifier,
              );

              // Once the loop terminates (either completed naturally OR broken by Cancel)
              if (isCancelled) {
                // If it was cancelled, close the dialog now that it's safe
                if (mounted) Navigator.of(context).pop();
              } else {
                // If it finished normally, update the UI to show completion
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

        final targetFile = File(newPath);
        bool shouldCopy = true;

        // Check if the file already exists in the destination
        if (await targetFile.exists()) {
          // Await the user's choice from the confirmation dialog
          final bool? overwriteDecision = await _showOverwriteDialog(context, fileName);

          // If they tapped outside the dialog or selected "Skip", don't copy
          if (overwriteDecision == null || !overwriteDecision) {
            shouldCopy = false;
          }
        }

        if (shouldCopy) {
          await file.copy(newPath);
        }
      }

      // Update progress bar
      progressNotifier.value = (i + 1) / totalFiles;
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  // Helper method to show the confirmation dialog
  Future<bool?> _showOverwriteDialog(BuildContext context, String fileName) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // Prevents closing by clicking outside, forcing a decision
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('File Already Exists'),
          content: Text('The file "$fileName" \nalready exists in the destination folder.\n\nDo you want to overwrite it?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false), // Return false (Skip)
              child: const Text('Skip'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700),
              onPressed: () => Navigator.of(dialogContext).pop(true), // Return true (Overwrite)
              child: const Text('Overwrite', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
