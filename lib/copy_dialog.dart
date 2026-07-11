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
        if(!complete) OutlinedButton(
          onPressed: copying
              ? null
              : () {
                  Navigator.of(context).pop();
                },
          child: Text('Cancel'),
        ),
        OutlinedButton(
          onPressed: copying || destDir == null
              ? null
              : () async {
                  if (complete) {
                    Navigator.of(context).pop();
                  } else {
                    setState(() {
                      copying = true;
                    });
                    _copySelectedPhotos(
                      context,
                      widget.selectedPhotos,
                      destDir!,
                      progressNotifier,
                    ).then((_) {
                      setState(() {
                        complete = true;
                        copying = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Photos copied successfully!'),
                        ),
                      );
                    });
                  }
                },
          child: complete ? Text('Close') : Text('Copy'),
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
      final photo = selectedPhotos[i];
      final file = File(photo.filePath);

      if (await file.exists()) {
        final String fileName = file.path.split(Platform.pathSeparator).last;
        final String newPath =
            '$destinationDirPath${Platform.pathSeparator}$fileName';
        await file.copy(newPath);
      }

      progressNotifier.value = (i + 1) / totalFiles;
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }
}
