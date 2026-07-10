import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:pixraw/raw_image.dart';
import 'package:pixraw/raw_photo.dart';
import 'package:window_manager/window_manager.dart';

import 'lazy_thumbnail_card.dart';

class MoveLeftIntent extends Intent { const MoveLeftIntent(); }
class MoveRightIntent extends Intent { const MoveRightIntent(); }
class ToggleViewIntent extends Intent { const ToggleViewIntent(); }

class MainWindow extends StatefulWidget {
  const MainWindow({super.key});

  @override
  State<MainWindow> createState() => _MainWindowState();
}

class _MainWindowState extends State<MainWindow> {
  static const appName = 'PixRAW';
  static const rawExtensions = {
    '.cr2',
    '.cr3',
    '.nef',
    '.arw',
    '.dng',
    '.orf',
    '.rw2',
    '.pef',
    '.raf',
    '.gpr',
  };

  Directory? directory;
  List<RawPhoto> rawPhotoPaths = [];
  int currentSelection = 0;
  bool gridView = true;
  final ScrollController _gridScrollController = ScrollController();

  @override
  void dispose() {
    _gridScrollController.dispose(); // Always dispose your controllers
    super.dispose();
  }

  void _selectPrevious() {
    if (currentSelection > 0) {
      setState(() {
        currentSelection--;
        _scrollToSelected();
      });
    }
  }

  void _selectNext() {
    if (currentSelection < rawPhotoPaths.length - 1) {
      setState(() {
        currentSelection++;
        _scrollToSelected();
      });
    }
  }

  Future<void> selectFolder() async {
    String? selectedDirectory =
        await FilePicker.getDirectoryPath(); // Note: updated to the standard FilePicker syntax

    if (selectedDirectory != null) {
      final selectedDir = Directory(selectedDirectory);

      List<RawPhoto> paths = await selectedDir
          .list(recursive: false, followLinks: false)
          .where((entity) {
            if (entity is! File) return false;
            final ext = p.extension(entity.path).toLowerCase();
            return rawExtensions.contains(ext);
          })
          .map((file) => RawPhoto(filePath: file.path))
          .toList();

      setState(() {
        directory = selectedDir;
        rawPhotoPaths = paths;
      });

      await windowManager.setTitle("$appName - $selectedDirectory");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.folder_rounded),
          onPressed: selectFolder,
        ),
        title: Text(directory?.absolute.path ?? appName),
        actions: [
          // Only show the app bar folder button if a path is already loaded
          if (directory != null)
            IconButton(
              icon: const Icon(Icons.file_copy_rounded),
              onPressed: (){},
            ),
        ],
      ),
      // 1. Wrap the changing area in an AnimatedSwitcher
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100), // How long the fade takes
              switchInCurve: Curves.easeIn, // Smooth acceleration
              switchOutCurve: Curves.easeOut, // Smooth deceleration
              // 2. Pass your conditional layout as the child
              child: directory == null
                  ? _buildEmptyState() // Shown when app opens
                  : _buildMainView(), // Shown once directory is picked
            ),),
            SizedBox(
              height: 30,
              child: rawPhotoPaths.isEmpty ? Text('0 photos.') :
                Text('${currentSelection+1} of ${rawPhotoPaths.length} photos.'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: selectFolder,
        icon: const Icon(Icons.folder_open, size: 24),
        label: const Text(
          'Open Folder',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        style: ElevatedButton.styleFrom(
          // Pads the button out so it feels substantial in the empty center space
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          // Uses the primary blue color you configured in your MaterialApp
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ), // Sleek, modern rounded corners
          ),
        ),
      ),
    );
  }

Widget _buildMainView() {
    //return gridView ? _buildPhotoGrid() : _buildSinglePhotoView();
  return FocusableActionDetector(
    autofocus: true, // Grabs focus initially so arrows work right away
    shortcuts: const <ShortcutActivator, Intent>{
      // Map Arrow Left to our MoveLeftIntent
      SingleActivator(LogicalKeyboardKey.arrowLeft): MoveLeftIntent(),
      // Map Arrow Right to our MoveRightIntent
      SingleActivator(LogicalKeyboardKey.arrowRight): MoveRightIntent(),
      SingleActivator(LogicalKeyboardKey.enter): ToggleViewIntent(),
    },
    actions: <Type, Action<Intent>>{
      // Define what happens when the intents are triggered
      MoveLeftIntent: CallbackAction<MoveLeftIntent>(onInvoke: (_) => _selectPrevious()),
      MoveRightIntent: CallbackAction<MoveRightIntent>(onInvoke: (_) => _selectNext()),
      ToggleViewIntent: CallbackAction<ToggleViewIntent>(
        onInvoke: (_) => setState(() {
          gridView = !gridView;
        }),
      ),
    },
    child:  gridView ? _buildPhotoGrid() : _buildSinglePhotoView(),
  );
}

Widget _buildSinglePhotoView() {
  return Center(child: PRawImage(rawPhoto: rawPhotoPaths[currentSelection],));
}

  // Your optimized lazy-loading photo grid
  Widget _buildPhotoGrid() {
    return GridView.builder(
      key: const ValueKey('photo_grid'),
      controller: _gridScrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: rawPhotoPaths.length,
      itemBuilder: (context, index) {
        // GridView.builder lazily instantiates this widget ONLY when visible
        return LazyThumbnailCard(
          rawPhoto: rawPhotoPaths[index],
          highlighted: index==currentSelection,
        );
      },
    );
  }

  void _scrollToSelected() {
    // Ensure the grid view is active and the controller is attached
    if (!_gridScrollController.hasClients || !gridView) return;

    // 1. Get grid metrics from the controller
    final position = _gridScrollController.position;
    final viewportHeight = position.viewportDimension;
    final currentScrollOffset = position.pixels;

    // 2. Math to calculate card dimensions dynamically
    const int crossAxisCount = 6;
    const double spacing = 8.0;

    // Calculate width of one item based on total grid width
    final double gridWidth = position.context.storageContext.size!.width;
    final double itemWidth = (gridWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

    // By default, a square delegate makes height equal to width
    final double itemHeight = itemWidth;
    final double rowHeight = itemHeight + spacing;

    // 3. Find target item's top and bottom position bounds
    final int currentRow = currentSelection ~/ crossAxisCount;
    final double itemTopY = currentRow * rowHeight;
    final double itemBottomY = itemTopY + itemHeight;

    // 4. Check boundaries and animate if necessary
    if (itemTopY < currentScrollOffset) {
      // Selection moved UP offscreen -> scroll up to align with the top of the row
      _gridScrollController.animateTo(
        itemTopY,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    } else if (itemBottomY > (currentScrollOffset + viewportHeight)) {
      // Selection moved DOWN offscreen -> scroll down to bring the row bottom into view
      _gridScrollController.animateTo(
        itemBottomY - viewportHeight,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
      );
    }
  }
}
